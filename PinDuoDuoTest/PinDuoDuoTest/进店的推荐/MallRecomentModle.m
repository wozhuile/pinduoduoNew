//
//  MallRecomentModle.m
//
//  Created by   on 16/7/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MallRecomentModle.h"
#import "MallList.h"


NSString *const kMallRecomentModleServerTime = @"server_time";
NSString *const kMallRecomentModleList = @"list";


@interface MallRecomentModle ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MallRecomentModle

@synthesize serverTime = _serverTime;
@synthesize list = _list;


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
            self.serverTime = [[self objectOrNilForKey:kMallRecomentModleServerTime fromDictionary:dict] doubleValue];
    NSObject *receivedMallList = [dict objectForKey:kMallRecomentModleList];
    NSMutableArray *parsedMallList = [NSMutableArray array];
    if ([receivedMallList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedMallList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedMallList addObject:[MallList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedMallList isKindOfClass:[NSDictionary class]]) {
       [parsedMallList addObject:[MallList modelObjectWithDictionary:(NSDictionary *)receivedMallList]];
    }

    self.list = [NSArray arrayWithArray:parsedMallList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serverTime] forKey:kMallRecomentModleServerTime];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kMallRecomentModleList];

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

    self.serverTime = [aDecoder decodeDoubleForKey:kMallRecomentModleServerTime];
    self.list = [aDecoder decodeObjectForKey:kMallRecomentModleList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_serverTime forKey:kMallRecomentModleServerTime];
    [aCoder encodeObject:_list forKey:kMallRecomentModleList];
}

- (id)copyWithZone:(NSZone *)zone
{
    MallRecomentModle *copy = [[MallRecomentModle alloc] init];
    
    if (copy) {

        copy.serverTime = self.serverTime;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
