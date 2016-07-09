//
//  detailModel.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "detailModel.h"
#import "AFNetworking.h"
@implementation detailModel



-(void)detailRequestData:(NSString*)urlStr
{
    
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    
    
    
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
#pragma mark 试试看得到数据不一会
        //NSLog(@"detailData===%@",responseObject);
        HomeDetailsModle*model=[HomeDetailsModle modelObjectWithDictionary:responseObject];
        
        
        if ([_delegate respondsToSelector:@selector(suceessToSendDetailData:homeDetail:)]) {
            [_delegate suceessToSendDetailData:self homeDetail:model];
        }
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if ([_delegate respondsToSelector:@selector(failToSendDatailData:error:)]) {
            [_delegate failToSendDatailData:self error:error];
        }
    }];
    
    
}

-(void)mallData:(NSString*)mall_idString
{
    
    AFHTTPSessionManager*manager=[AFHTTPSessionManager manager];
    
    [manager GET:mall_idString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //试试输出看看可以直接在上个数据源哪里直接接受就请求麼，。。还是先接受数据，然后滚动一段距离在刷新请求？？
        NSLog(@"%@",responseObject);
        
        MallDataModle*mallModel=[MallDataModle modelObjectWithDictionary:responseObject];
        
        if ([_delegate respondsToSelector:@selector(successToGetMallData:mall:)]) {
            [_delegate successToGetMallData:self mall:mallModel];
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        
        if ([_delegate respondsToSelector:@selector(failToGetMallData:error:)]) {
            [_delegate failToGetMallData:self error:error];
        }
        
        
        
    }];
    
    
    

}


@end
