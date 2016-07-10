//
//  MallList.m
//
//  Created by   on 16/7/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MallList.h"


NSString *const kMallListSales = @"sales";
NSString *const kMallListGoodsId = @"goods_id";
NSString *const kMallListPrice = @"price";
NSString *const kMallListGoodsName = @"goods_name";
NSString *const kMallListThumbUrl = @"thumb_url";


@interface MallList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MallList

@synthesize sales = _sales;
@synthesize goodsId = _goodsId;
@synthesize price = _price;
@synthesize goodsName = _goodsName;
@synthesize thumbUrl = _thumbUrl;


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
            self.sales = [[self objectOrNilForKey:kMallListSales fromDictionary:dict] doubleValue];
            self.goodsId = [[self objectOrNilForKey:kMallListGoodsId fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kMallListPrice fromDictionary:dict] doubleValue];
            self.goodsName = [self objectOrNilForKey:kMallListGoodsName fromDictionary:dict];
            self.thumbUrl = [self objectOrNilForKey:kMallListThumbUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sales] forKey:kMallListSales];
    [mutableDict setValue:[NSNumber numberWithDouble:self.goodsId] forKey:kMallListGoodsId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kMallListPrice];
    [mutableDict setValue:self.goodsName forKey:kMallListGoodsName];
    [mutableDict setValue:self.thumbUrl forKey:kMallListThumbUrl];

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

    self.sales = [aDecoder decodeDoubleForKey:kMallListSales];
    self.goodsId = [aDecoder decodeDoubleForKey:kMallListGoodsId];
    self.price = [aDecoder decodeDoubleForKey:kMallListPrice];
    self.goodsName = [aDecoder decodeObjectForKey:kMallListGoodsName];
    self.thumbUrl = [aDecoder decodeObjectForKey:kMallListThumbUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_sales forKey:kMallListSales];
    [aCoder encodeDouble:_goodsId forKey:kMallListGoodsId];
    [aCoder encodeDouble:_price forKey:kMallListPrice];
    [aCoder encodeObject:_goodsName forKey:kMallListGoodsName];
    [aCoder encodeObject:_thumbUrl forKey:kMallListThumbUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    MallList *copy = [[MallList alloc] init];
    
    if (copy) {

        copy.sales = self.sales;
        copy.goodsId = self.goodsId;
        copy.price = self.price;
        copy.goodsName = [self.goodsName copyWithZone:zone];
        copy.thumbUrl = [self.thumbUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
