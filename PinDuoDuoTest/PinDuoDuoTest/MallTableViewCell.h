//
//  MallTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MallTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logo;

@property (weak, nonatomic) IBOutlet UILabel *mall_name;

@property (weak, nonatomic) IBOutlet UILabel *mall_sales;

//是不是要开交互，，防止点击不进去？
@property (weak, nonatomic) IBOutlet UIImageView *picture;



@end
