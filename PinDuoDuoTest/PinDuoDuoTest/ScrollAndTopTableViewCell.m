//
//  ScrollAndTopTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ScrollAndTopTableViewCell.h"

@implementation ScrollAndTopTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//用markman测量处理高度先
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self=  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
       //滚动用第三方来做就好，。。。高度是339
        
        
        
        
        
        
    }
    return self;
    
    
    
    
}



@end
