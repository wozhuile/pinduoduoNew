//
//  MallDataModle.m
//
//  Created by   on 16/7/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MallDataModle.h"


NSString *const kMallDataModleMallSales = @"mall_sales";
NSString *const kMallDataModleMallName = @"mall_name";
NSString *const kMallDataModleLastEventId = @"last_event_id";
NSString *const kMallDataModleGoodsNum = @"goods_num";
NSString *const kMallDataModleMallId = @"mall_id";
NSString *const kMallDataModleMallDesc = @"mall_desc";
NSString *const kMallDataModleMallCoupons = @"mall_coupons";
NSString *const kMallDataModleLogo = @"logo";
NSString *const kMallDataModleChatEnable = @"chat_enable";
NSString *const kMallDataModleOfflineNote = @"offline_note";
NSString *const kMallDataModleScoreAvg = @"score_avg";
NSString *const kMallDataModleCompanyPhone = @"company_phone";
NSString *const kMallDataModleStapleId = @"staple_id";
NSString *const kMallDataModleServerTime = @"server_time";
NSString *const kMallDataModleRefundAddress = @"refund_address";


@interface MallDataModle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MallDataModle

@synthesize mallSales = _mallSales;
@synthesize mallName = _mallName;
@synthesize lastEventId = _lastEventId;
@synthesize goodsNum = _goodsNum;
@synthesize mallId = _mallId;
@synthesize mallDesc = _mallDesc;
@synthesize mallCoupons = _mallCoupons;
@synthesize logo = _logo;
@synthesize chatEnable = _chatEnable;
@synthesize offlineNote = _offlineNote;
@synthesize scoreAvg = _scoreAvg;
@synthesize companyPhone = _companyPhone;
@synthesize stapleId = _stapleId;
@synthesize serverTime = _serverTime;
@synthesize refundAddress = _refundAddress;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.mallSales = [self objectOrNilForKey:kMallDataModleMallSales fromDictionary:dict];
            self.mallName = [self objectOrNilForKey:kMallDataModleMallName fromDictionary:dict];
            self.lastEventId = [self objectOrNilForKey:kMallDataModleLastEventId fromDictionary:dict];
            self.goodsNum = [[self objectOrNilForKey:kMallDataModleGoodsNum fromDictionary:dict] doubleValue];
            self.mallId = [[self objectOrNilForKey:kMallDataModleMallId fromDictionary:dict] doubleValue];
            self.mallDesc = [self objectOrNilForKey:kMallDataModleMallDesc fromDictionary:dict];
            self.mallCoupons = [self objectOrNilForKey:kMallDataModleMallCoupons fromDictionary:dict];
            self.logo = [self objectOrNilForKey:kMallDataModleLogo fromDictionary:dict];
            self.chatEnable = [[self objectOrNilForKey:kMallDataModleChatEnable fromDictionary:dict] doubleValue];
            self.offlineNote = [self objectOrNilForKey:kMallDataModleOfflineNote fromDictionary:dict];
            self.scoreAvg = [[self objectOrNilForKey:kMallDataModleScoreAvg fromDictionary:dict] doubleValue];
            self.companyPhone = [self objectOrNilForKey:kMallDataModleCompanyPhone fromDictionary:dict];
            self.stapleId = [[self objectOrNilForKey:kMallDataModleStapleId fromDictionary:dict] doubleValue];
            self.serverTime = [[self objectOrNilForKey:kMallDataModleServerTime fromDictionary:dict] doubleValue];
            self.refundAddress = [self objectOrNilForKey:kMallDataModleRefundAddress fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.mallSales forKey:kMallDataModleMallSales];
    [mutableDict setValue:self.mallName forKey:kMallDataModleMallName];
    [mutableDict setValue:self.lastEventId forKey:kMallDataModleLastEventId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsNum] forKey:kMallDataModleGoodsNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mallId] forKey:kMallDataModleMallId];
    [mutableDict setValue:self.mallDesc forKey:kMallDataModleMallDesc];
    NSMutableArray *tempArrayForMallCoupons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mallCoupons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMallCoupons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMallCoupons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMallCoupons] forKey:kMallDataModleMallCoupons];
    [mutableDict setValue:self.logo forKey:kMallDataModleLogo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.chatEnable] forKey:kMallDataModleChatEnable];
    [mutableDict setValue:self.offlineNote forKey:kMallDataModleOfflineNote];
    [mutableDict setValue:[NSNumber numberWithDouble:self.scoreAvg] forKey:kMallDataModleScoreAvg];
    [mutableDict setValue:self.companyPhone forKey:kMallDataModleCompanyPhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stapleId] forKey:kMallDataModleStapleId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kMallDataModleServerTime];
    [mutableDict setValue:self.refundAddress forKey:kMallDataModleRefundAddress];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.mallSales = [aDecoder decodeObjectForKey:kMallDataModleMallSales];
    self.mallName = [aDecoder decodeObjectForKey:kMallDataModleMallName];
    self.lastEventId = [aDecoder decodeObjectForKey:kMallDataModleLastEventId];
    self.goodsNum = [aDecoder decodeDoubleForKey:kMallDataModleGoodsNum];
    self.mallId = [aDecoder decodeDoubleForKey:kMallDataModleMallId];
    self.mallDesc = [aDecoder decodeObjectForKey:kMallDataModleMallDesc];
    self.mallCoupons = [aDecoder decodeObjectForKey:kMallDataModleMallCoupons];
    self.logo = [aDecoder decodeObjectForKey:kMallDataModleLogo];
    self.chatEnable = [aDecoder decodeDoubleForKey:kMallDataModleChatEnable];
    self.offlineNote = [aDecoder decodeObjectForKey:kMallDataModleOfflineNote];
    self.scoreAvg = [aDecoder decodeDoubleForKey:kMallDataModleScoreAvg];
    self.companyPhone = [aDecoder decodeObjectForKey:kMallDataModleCompanyPhone];
    self.stapleId = [aDecoder decodeDoubleForKey:kMallDataModleStapleId];
    self.serverTime = [aDecoder decodeDoubleForKey:kMallDataModleServerTime];
    self.refundAddress = [aDecoder decodeObjectForKey:kMallDataModleRefundAddress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_mallSales forKey:kMallDataModleMallSales];
    [aCoder encodeObject:_mallName forKey:kMallDataModleMallName];
    [aCoder encodeObject:_lastEventId forKey:kMallDataModleLastEventId];
    [aCoder encodeDouble:_goodsNum forKey:kMallDataModleGoodsNum];
    [aCoder encodeDouble:_mallId forKey:kMallDataModleMallId];
    [aCoder encodeObject:_mallDesc forKey:kMallDataModleMallDesc];
    [aCoder encodeObject:_mallCoupons forKey:kMallDataModleMallCoupons];
    [aCoder encodeObject:_logo forKey:kMallDataModleLogo];
    [aCoder encodeDouble:_chatEnable forKey:kMallDataModleChatEnable];
    [aCoder encodeObject:_offlineNote forKey:kMallDataModleOfflineNote];
    [aCoder encodeDouble:_scoreAvg forKey:kMallDataModleScoreAvg];
    [aCoder encodeObject:_companyPhone forKey:kMallDataModleCompanyPhone];
    [aCoder encodeDouble:_stapleId forKey:kMallDataModleStapleId];
    [aCoder encodeDouble:_serverTime forKey:kMallDataModleServerTime];
    [aCoder encodeObject:_refundAddress forKey:kMallDataModleRefundAddress];
}

- (id)copyWithZone:(NSZone *)zone
{
    MallDataModle *copy = [[MallDataModle alloc] init];
    
    if (copy) {

        copy.mallSales = [self.mallSales copyWithZone:zone];
        copy.mallName = [self.mallName copyWithZone:zone];
        copy.lastEventId = [self.lastEventId copyWithZone:zone];
        copy.goodsNum = self.goodsNum;
        copy.mallId = self.mallId;
        copy.mallDesc = [self.mallDesc copyWithZone:zone];
        copy.mallCoupons = [self.mallCoupons copyWithZone:zone];
        copy.logo = [self.logo copyWithZone:zone];
        copy.chatEnable = self.chatEnable;
        copy.offlineNote = [self.offlineNote copyWithZone:zone];
        copy.scoreAvg = self.scoreAvg;
        copy.companyPhone = [self.companyPhone copyWithZone:zone];
        copy.stapleId = self.stapleId;
        copy.serverTime = self.serverTime;
        copy.refundAddress = [self.refundAddress copyWithZone:zone];
    }
    
    return copy;
}


@end
