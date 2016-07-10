//
//  detailModel.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeDetailsModle.h"
#import "MallDataModle.h"
@class detailModel;
@protocol detailModelDelegate <NSObject>
#pragma mark 因为在第一个大数组就有很多数据需要，就不能单单传过去之前习惯传的数组什么的。。需要把模型都传过去
-(void)suceessToSendDetailData:(detailModel*)detailModle homeDetail:(HomeDetailsModle*)homeDetail;
-(void)failToSendDatailData:(detailModel*)detailModel error:(NSError*)error;

#pragma mark 进店请求的  还是只能传这个过去啊
-(void)successToGetMallData:(detailModel*)mallModle mall:(MallDataModle*)mall;
-(void)failToGetMallData:(detailModel*)mallModle error:(NSError*)error;


#pragma mark 进店推荐请求
-(void)successTogetMallRecometData:(detailModel*)detailModle mallRecoment:(NSMutableArray*)reconmtentArray;
-(void)failToGetMallRecomentData:(detailModel*)detailModle error:(NSError*)error;


@end


@interface detailModel : NSObject
-(void)detailRequestData:(NSString*)urlStr;

@property(weak,nonatomic)id<detailModelDelegate>delegate;

//进店的请求
-(void)mallData:(NSString*)mall_idString;


#pragma mark进店的推荐
-(void)mallRecomentRequest:(NSString*)urlStr;

@end
