//
//  MallReconmentTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
//cell里边在.m遵循不了这些代理
@interface MallReconmentTableViewCell : UITableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>


#pragma mark 获取控制器中推荐数据
@property(nonatomic,strong)NSMutableArray*recommentArray;


#pragma mark 为了下边设置不可以滚动，集合视图声明全局的
@property(nonatomic,strong) UICollectionView*collection;
@end
