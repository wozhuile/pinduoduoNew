//
//  detailsViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detailModel.h"

#pragma mark 练习block
typedef void(^sendIndexPath) (NSInteger indexPath);


#pragma mark 导入首页控制器,声明成属性，然后遵循代理，实现方法，先输出看看对不对！
#import "ViewController.h"
@interface detailsViewController : UIViewController


#pragma mark 创建表
@property(nonatomic,strong)UITableView*detailTableView;


@property(nonatomic,strong)ViewController*viewDelegate;


@property(nonatomic,assign)NSInteger dataIndex;
#warning 知道为什么那边进行请求就是对象是空的了。。这里修饰居然写成weak修饰了。。想代理想多了。。走神了。。
//@property(nonatomic,weak)detailModel*detail;

@property(nonatomic,strong)detailModel*detail;


#pragma mark block声明属性，



#pragma 图片 滚动和下边展示数组  不会做也要分解做
@property(nonatomic,strong)NSMutableArray*scrollArray;
@property(nonatomic,strong)NSMutableArray*showArray;




#pragma mark 展示图片哪里重用了。。问让创建 加加1，，tag就不一样，应该可以解决下
@property(nonatomic,assign)NSInteger showCount;
@property(nonatomic,copy)NSString*priceNum;

#pragma mark 
@property(nonatomic,strong)NSMutableArray*detailTextArray;


@end
