//
//  purChasingViewController.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "puchaseModle.h"
@interface purChasingViewController : UIViewController

#pragma mark collectionView
@property(nonatomic,strong)UICollectionView*dataConllection;

@property(nonatomic,strong)NSMutableArray*dataArray;
@property(nonatomic,strong)puchaseModle*modle;
@end
