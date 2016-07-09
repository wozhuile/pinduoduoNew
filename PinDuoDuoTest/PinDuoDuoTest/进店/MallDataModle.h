//
//  MallDataModle.h
//
//  Created by   on 16/7/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MallDataModle : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *mallSales;
@property (nonatomic, strong) NSString *mallName;
@property (nonatomic, assign) id lastEventId;
@property (nonatomic, assign) double goodsNum;
@property (nonatomic, assign) double mallId;
@property (nonatomic, strong) NSString *mallDesc;
@property (nonatomic, strong) NSArray *mallCoupons;
@property (nonatomic, strong) NSString *logo;
@property (nonatomic, assign) double chatEnable;
@property (nonatomic, strong) NSString *offlineNote;
@property (nonatomic, assign) double scoreAvg;
@property (nonatomic, strong) NSString *companyPhone;
@property (nonatomic, assign) double stapleId;
@property (nonatomic, assign) double serverTime;
@property (nonatomic, strong) NSString *refundAddress;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
