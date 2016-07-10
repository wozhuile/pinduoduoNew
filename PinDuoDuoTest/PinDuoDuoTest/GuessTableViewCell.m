//
//  GuessTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "GuessTableViewCell.h"

@implementation GuessTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UILabel*lab=[[UILabel alloc]initWithFrame:CGRectMake(25, 5, 100, 40)];
        lab.tag=99;
        [self.contentView addSubview:lab];
        
        
    }
    return self;
    
}

@end
