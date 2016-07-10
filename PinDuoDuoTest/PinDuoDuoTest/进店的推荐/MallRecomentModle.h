//
//  MallRecomentModle.h
//
//  Created by   on 16/7/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MallRecomentModle : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double serverTime;
@property (nonatomic, strong) NSArray *list;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
