//
//  ScrollAndTopTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ScrollAndTopTableViewCell.h"

//#import "SDCycleScrollView.h"


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
        
       //滚动用第三方来做就好，。。。高度是339,这里直接创建好像很麻烦啊，数据不再这边，如果在外边滴哦啊用赋值，那初始化这里就不能有，可以用对象调用的，，试试看
        
        
        
        
        
        
    }
    return self;
    
    
    
    
}
#warning 不知道为什么会报错，是不是不能再这里？
//-(void)scrollImageView:(NSArray*)imageArray
//{
//    SDCycleScrollView *cycleScrollView3 =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 339, 180) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
//    cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
//    cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
//    cycleScrollView3.imageURLStringsGroup = imageArray;
//    
//    [self.contentView addSubview:cycleScrollView3];
//}


@end
