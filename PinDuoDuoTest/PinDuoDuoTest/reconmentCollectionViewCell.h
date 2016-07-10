//
//  reconmentCollectionViewCell.h
//  PinDuoDuoTest
//
//  Created by mac on 16/7/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reconmentCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *thumb_url;

@property (weak, nonatomic) IBOutlet UILabel *goods_name;

@property (weak, nonatomic) IBOutlet UILabel *price;

@property (weak, nonatomic) IBOutlet UIButton *commend;



@end
