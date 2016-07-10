//
//  MallList.h
//
//  Created by   on 16/7/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MallList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double sales;
@property (nonatomic, assign) double goodsId;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *goodsName;
@property (nonatomic, strong) NSString *thumbUrl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
