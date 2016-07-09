//
//  groupTableViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/9.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface groupTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *icon;

@property (weak, nonatomic) IBOutlet UILabel *personName;

@property (weak, nonatomic) IBOutlet UILabel *cityName;

@property (weak, nonatomic) IBOutlet UILabel *needPeople;
@property (weak, nonatomic) IBOutlet UILabel *needTime;





@end
