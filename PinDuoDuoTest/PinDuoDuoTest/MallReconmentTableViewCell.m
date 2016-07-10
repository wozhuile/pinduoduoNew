//
//  MallReconmentTableViewCell.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MallReconmentTableViewCell.h"

#import "reconmentCollectionViewCell.h"
#import "MallList.h"
#import <UIImageView+WebCache.h>


static NSString*cellID=@"cell";

@implementation MallReconmentTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark 用集合视图来做吧，
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    if (self) {
        //垂直间隔
       // CGFloat lineSpace=10;
        //水平间隔
        //CGFloat interitemspace=10;
        
       // self.backgroundColor=[UIColor purpleColor];
        
        
        UICollectionViewFlowLayout*flowlayout=[[UICollectionViewFlowLayout alloc]init];
        //markman出来的是全宽是540.，，现在系统的是414，算420，都是1.3倍左右，，
        //flowlayout.itemSize=CGSizeMake(150, 250);
         flowlayout.itemSize=CGSizeMake(115, 192);
        
#warning 没起作用！！！怎么回事？？
        flowlayout.minimumLineSpacing=10;
#warning 没起作用！！！怎么回事？？
        flowlayout.minimumInteritemSpacing=10;
       
#warning   //上边的就是列和行的间距，，要设置旁边的还需要下边的这个
      
        
          flowlayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        flowlayout.scrollDirection=UICollectionViewScrollDirectionVertical;
        //注意这里大小是不是和控制器大小一样
       // UICollectionView*collection=[[UICollectionView alloc]initWithFrame:self.contentView.bounds collectionViewLayout:flowlayout];//太小这样赋值大小
#warning  //注意这里大小是不是和控制器大小一样   414和736大小是控制器输出的,但是这里明显不可以，，一个item大小都是250了。。还有间距。应该这里决定外边大小。750＋40
        _collection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 414, 610) collectionViewLayout:flowlayout];

        
        
        [self.contentView addSubview:_collection];
#pragma mark 试试看在cell里边可以设置代理方法没，，或者麻烦不／
        _collection.delegate=self;
        
        
        
#warning 忘记数据源代理声明，，难怪下边多少行都没有调用
        _collection.dataSource=self;
        
#warning 集合视图不设置背景颜色，都是黑色
        
        _collection.backgroundColor=[UIColor whiteColor];
        //注册
        [_collection registerNib:[UINib nibWithNibName:@"reconmentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:cellID];
        
        //滚动条隐藏
        _collection.showsVerticalScrollIndicator=YES;
        _collection.showsHorizontalScrollIndicator=YES;
        
    }
    
    return self;
    
    
    
    
}
#pragma mark collection  datasource  and   delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
#pragma mark 这里需要数据，但是现在数据是在控制器里边的，先用属性传值进来试试看，一会再用block
    
    return  _recommentArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    reconmentCollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];

    
    
    
    
     //试试看，，首先没有崩溃了。。在布局数据什么的
    //cell.price.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    
#pragma mark 布局数据吧
    MallList*list=[_recommentArray objectAtIndex:indexPath.row];
    [cell.thumb_url sd_setImageWithURL:[NSURL URLWithString:list.thumbUrl] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
    cell.price.text=[NSString stringWithFormat:@"¥%.f",list.price/100];
    cell.price.font=[UIFont systemFontOfSize:14];
    cell.price.textColor=[UIColor redColor];
    cell.goods_name.text=list.goodsName;
    cell.goods_name.font=[UIFont systemFontOfSize:12];
#pragma mark 推荐收藏那个图片太模糊。。。加了的
    
    
    
   // cell.backgroundColor=[UIColor redColor];
    return cell;
    
    
    
}
#warning 设置集合视图不滚动试试看  ，。。小心点击的时候有bug。。先做吧。 记得断点看看进来不啊。
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //试试看效果，，
    _collection.scrollEnabled=NO;
}


@end
