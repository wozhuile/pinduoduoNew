//
//  detailsViewController.m
//  PinDuoDuoTest
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "detailsViewController.h"
#import "detailModel.h"
#import "HomeDetailsModle.h"
#import "HomeGallery.h"
#import "HomeGroup.h"
#import "HomeSku.h"

#pragma mark 导入第三方，一直报错原因，一般要尖括号

//#import "SDCycleScrollView.h"
#import <SDCycleScrollView.h>
#import <TAPageControl.h>
#import <UIView+SDExtension.h>


#import <UIImageView+WebCache.h>




#import "ScrollAndTopTableViewCell.h"
#import "ShowScrollTableViewCell.h"



@interface detailsViewController ()<UITableViewDataSource,UITableViewDelegate,ViewControllerDataDelegate,detailModelDelegate,SDCycleScrollViewDelegate>

@end

@implementation detailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"拼多多商城";
    self.view.backgroundColor=[UIColor greenColor];
    
#pragma mark 设置左边的按钮，就看不到那个拼多多商场文字，，但是返回的时候有点小bug，就是还会看到一些些拼多多文字。。
    UIBarButtonItem*item=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(backButon)];
    self.navigationItem.leftBarButtonItem=item;
#warning 注意跳转过来后的效果，，下边的标签栏应该隐藏的，然后再下边创建一个view来做下边的东西。。self.tabBarController.hidesBottomBarWhenPushed
    
    //[self sendUrl];
    
    //初始化数组
    [self initArray];
    
    
    
    
    [self createtableView];
    
    
#pragma mark 遵循首页代理，，实现代理方法
   // _viewDelegate.dataDelegate=self;
    
    //[self sendUrl];
    
}
-(void)initArray
{
    _scrollArray=[[NSMutableArray alloc]init];
    _showArray=[[NSMutableArray alloc]init];
    
    
    
    
    
}
#pragma mark跳转过来，可以直接用表，，分几个区就好。就分大区？？，，宝贝介绍，包邮哪里（颜色不同，最后就是单独一个，，如果是按钮呢？）然后支付开团，以下伙伴头一个，评论一个，在分行，，进店一个，图片一个，后边图片展示一个，。。。推荐一个，。一共至少6个，，就先4个处理吧，，第一个大区哪些也不能点击吧》。。就图片，，点击可以放大，，然后放大后，，点击了。就会回到对应那一个，，这个滑动的时候看起来是bug，，还有图片放大着，，也可以滚动，。。点击下了，，滑动到哪里就到哪里，。。醉了。。。
#pragma mark 创建表
-(void)createtableView
{
    _detailTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];//注意样式
    _detailTableView.delegate=self;
    _detailTableView.dataSource=self;
    _detailTableView.backgroundColor=[UIColor greenColor];
    [self.view addSubview:_detailTableView];
    
#pragma mark  不知道为什么下边对象在没有创建这里的时候一直是空了。跳转斗这样麼？？这前的都不是跳转的，声明属性都可以了。。现在这里还需要创建对象才可以有对象，，，不过好像也是啊
    
    
    _detail=[[detailModel alloc]init];
    _detail.delegate=self;
    
    
    // _viewDelegate.dataDelegate=self;
    
    
    //NSLog(@"%ld",(long)self.dataIndex);
    
     [self sendUrl];
    
}

#pragma mark 首页商品id实现方法，先点击看看传值成功没有，如果成功了，，在进行网络请求
-(void)sendGoods_listIndex:(ViewController *)viewcontroller indexPath:(NSInteger)indexPath
{
    NSLog(@"商品indexPath＝＝＝＝%ld",(long)indexPath);
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    
//    [self sendUrl];
//
//}
#pragma mark 属性传值过来，进行对应请求吧
-(void)sendUrl
{
    
    NSLog(@"%ld",(long)self.dataIndex);
#pragma mark 刚刚属性哪里用成weak来修饰了。对象就是空。释放了
    [_detail detailRequestData:[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/goods/%ld",(long)self.dataIndex]];
    
   // NSLog(@"%@",[NSString stringWithFormat:@"http://apiv2.yangkeduo.com/goods/%ld",(long)self.dataIndex]);
#pragma mark上边创建对象可以请求后，就可以代理传值过来了
    
}

#pragma mark 得到数据了。声明代理，实现方法，创建数组接受，刷新表

-(void)suceessToSendDetailData:(detailModel *)detailModle homeDetail:(HomeDetailsModle *)homeDetail
{
    //输出看看先
   // NSLog(@"%@",homeDetail);
    
    //数据特别难处理
    /*
     1,最上边和最下边图片，都在gallery里边，type是1的时候，就是滚动的，是2的时候，就是下边展示的
     2,
     */
    //临时滚动图片
    NSMutableArray*array=[[NSMutableArray alloc]init];
    //临时展示图片
    NSMutableArray*showArray=[[NSMutableArray alloc]init];
#warning 不会做就分布做，现在就先处理这个图片，这个gallery数组,得到就去布局先，得到什么先做什么就好了
    //遍历方法
    [homeDetail.gallery enumerateObjectsUsingBlock:^(HomeGallery*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //根据索引idx和数组类型来做
        
        
        
        if (obj.type==1) {
         //[_scrollArray addObject:obj.url];
         [array addObject:obj.url];
           
                //int  count=(int)array.count;
            
#pragma mark 在里边这样反排序，就会报错崩溃，崩溃是因为我大于等于0，，然后这里出来的排序还是之前样子，，还有一点就是，这个遍历进行多少次，就重复多少次数组添加，之前是4张图片，出来后就12张等等了。。。。在外边一样的代码，效果出来了，还没有bug，，这就是遍历的核心重点，不是随便逗可以用
            
//        for (int i=count; i>0; i--) {
//           NSMutableArray*selectArray= [array objectAtIndex:i-1];
//            [_scrollArray addObject:selectArray];
//            
//           }
            //[_scrollArray insertObject:obj.url atIndex:idx];
            ///
            
            //[array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
               
               // [_scrollArray addObject:obj];
           // }];
            
            
            
            
            
        }
        if (obj.type==2) {
#pragma mark 输出，断点试试看数组都对没有
            [showArray addObject:obj.url];
            //NSLog(@"_showArray====%@",_showArray);
        }
        
    }];
    
    
    
    
#pragma mark 完美排序了，前后元素调换过来
   int  count=(int)array.count;
   
   for (int i=count; i>0; i--) {
       NSMutableArray*selectArray= [array objectAtIndex:i-1];
       [_scrollArray addObject:selectArray];
       
   }
//这里这样处理后，下边show都没有图片了。。全部变成滚动了。。。那是因为 [_scrollArray addObject:selectArray];里边美誉修改。虽然看起来上边这样也不错，因为点击进来的是气质美女。。。但是效果，，，，就是bug
    int  ShowCount=(int)showArray.count;
    
    for (int i=ShowCount; i>0; i--) {
        NSMutableArray*selectArray= [showArray objectAtIndex:i-1];
        //[_scrollArray addObject:selectArray];
        [_showArray addObject:selectArray];
        
    }

    
    
    
#pragma mark 第二步，第一区固定死值，用字典来做？
    
    
    
    [_detailTableView reloadData];
    
    
   
    
    
    
}

/*void bubbleSort(int arrry[]);

int main(int argc, const char * argv[]) {
    
    int numberArray[20] = {9,2,10,399,339,33,335,567,353,246,567,896,678,1234,567,78,682,13,4 };
    
    bubbleSort(numberArray);
    
    for (int i = 0; i < 20; i++) {
        printf("%d位数字是%d\n",i,numberArray[i]);
    }
    
    return 0;
}
*/
#warning 冒泡排序，滚动图片和展示图片排序
void bubbleSort(int arrry[] ){
    
    for (int i = 0; i < 20; i++)
    {
        
        for (int j = i; j < 20; j++)
        {
            if (arrry[i] > arrry[j] )
            {
                // 大数下沉策略
                int temp = arrry[i];
                arrry[i] = arrry[j];
                arrry[j] = temp;
            }
        }
    }
    
}
void bubble_sory(int array[], int count) {
    
    for (int i = 0; i < count - 1; i++) {
        
        int didSwap = 0;
        for (int j = 0; j < count-1-i; j++) {
            
            if (array[j] > array[j+1]) {
                
                // 交换数值
                array[j] = array[j]+array[j+1];
                array[j+1] = array[j]-array[j+1];
                array[j] = array[j]-array[j+1];
                
                didSwap = 1;
            }
        }
        if (didSwap == 0) {
            return;
        }
    }
}


//-(void)bubblesort:(NSArray*)array
//{
//    for (int i = 0; i < array.count; i++)
//    {
//        
//        for (int j = i; j < array.count; j++)
//        {
//            if (array[i]> array[j])
//            {
//                // 大数下沉策略
//                int temp = array[i];
//                array[i] = array[j];
//                array[j] = temp;
//            }
//        }
//    }
//
//}


-(void)failToSendDatailData:(detailModel *)detailModel error:(NSError *)error
{
    NSLog(@"详情error%@",error);
}







#pragma mark 进行网络请求,先在那边传数据过来了。。


#pragma mark tableview   delegate  and  datasource
//区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;//先至少6个，按照上边分析的
}

//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   //推荐的药比较多 。看具体来
    if (section==5) {
        return 1;//这里放的可能还是一个行，上边放集合视图就好，，不需要之前写的50个
#warning 注意得到数据的时候修改数组
    }
    //展示图片的
    if (section==4) {
        return _showArray.count;//上边得到展示图片数组了。。这里修改
    }
    //展示商品图片的店的图片
    if (section==3) {
        return 1;
    }
    //进店
    if (section==2) {
        return 1;
    }
#warning  //评论有些有，有些没有
    //评论有些有，有些没有
    if (section==1) {
        return 1;//暂时先这样
        
    }
    //详情展示，都不可点击的，所以...
    else{
        return 1;
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    

    
    if (indexPath.section==0) {
        
      static  NSString*cellID=@"scrollCell";
        
        ScrollAndTopTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell==nil) {
            cell=[[ScrollAndTopTableViewCell alloc]init];
        }
        
        
        
#pragma mark 不知道为什么这个系统提供的方法用不了  分开调用着先吧
        SDCycleScrollView*scroll=[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0,  CGRectGetWidth(self.view.frame),339 )];//CGRectGetWidth(cell.contentView.frame)用这个就是320

        
        scroll.imageURLStringsGroup=_scrollArray;
        scroll.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
       scroll.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        scroll.autoScrollTimeInterval=4.0;
        
        scroll.pageControlDotSize=CGSizeMake(10, 10);
        scroll.dotColor=[UIColor whiteColor];
        
        
        scroll.delegate=self;
#pragma mark 占位图片
        [scroll setPlaceholderImage:[UIImage imageNamed:@"default_mall_logo"]];
        
        [cell.contentView addSubview:scroll];
        
        //缓存
        [scroll clearCache];
        
        cell.backgroundColor=[UIColor greenColor];
        return cell;
    }
    
    
    if (indexPath.section==4) {
        
        static NSString*cellID=@"showCell";
        ShowScrollTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell==nil) {
            cell=[[ShowScrollTableViewCell alloc]init];
            
            //_showCount++;//可以输出看看实现加加没有
            //NSLog(@"_showCount===%ld",(long)_showCount);
            
//            UIImageView*oldImage=[cell.contentView viewWithTag:100];
//             [oldImage removeFromSuperview];
//            UIImageView*img=[[UIImageView alloc]initWithFrame:CGRectMake(15, 5, CGRectGetWidth(self.view.frame)-30,  350)];
//            
//            img.tag=100;
//            
//           // NSLog(@"img.tag===%ld",(long)img.tag);
//            [cell.contentView addSubview:img];
            
            
        }

        UIImageView*oldImage=[cell.contentView viewWithTag:100];
        [oldImage removeFromSuperview];
        UIImageView*img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 5, CGRectGetWidth(self.view.frame),  530)];//之前是350.。
        
        img.tag=100;
        
        // NSLog(@"img.tag===%ld",(long)img.tag);
        [cell.contentView addSubview:img];
        
        [_showArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //UIImageView*img
         
           // NSLog(@"img=====%@",img);
            
            //可以输出obj
            //NSLog(@"------%@",obj);
            //[img sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
#pragma mark 上边用数组遍历也会出来问题的，断点发现不是就一次。，这个就咬考虑效率问题了。。因为不要遍历，我直接用这个数组_showArray objectAtIndex:indexPath.row就不会错，，用遍历也不会错，，，但是用上边那个直接obj就会错，，是不是用id的原因？？试试改对应对象看看，不行，，不知道在cell类里边创建会怎么样，，，以后遇到这类型的，数组里边放URL的，，要给图片赋值的，就要[_showArray objectAtIndex:indexPath.row]方法，尽量不需要遍历了如果不需要取值。
            
            //这种是可以的了。。但是理解不够，，还是没达到效果
            //img.contentMode=UIViewContentModeScaleAspectFit;
            //设置个颜色来看看 效果
            //NSLog(@"11====%f",img.frame.size.width);
            NSLog(@"11====%f",img.frame.size.height);
   
            //NSLog(@"11====%f",img.frame.size.width);

            img.backgroundColor=[UIColor redColor];
            //img.contentMode=UIViewContentModeScaleAspectFit;
#warning 用这个模型是保持了比例，，但是还需要传进来高度和宽度来具体计算的，，它们都不是唯一一样的，，要不就让服务器给一样宽度和高度的。
            img.contentMode=UIViewContentModeScaleAspectFill;
           // NSLog(@"22====%f",img.frame.size.width);

             NSLog(@"22====%f",img.frame.size.height);
            
            [img sd_setImageWithURL:[NSURL URLWithString:[_showArray objectAtIndex:indexPath.row]] placeholderImage:[UIImage imageNamed:@"default_mall_logo"]];
            NSLog(@"333====%f",img.frame.size.height);
            //用.clipsToBounds = YES;可以使图片占满整个父容器，并且不变形。
            

            //img.clipsToBounds=YES;
            

   }];
     
        
        
        //看看图片模型的效果
        cell.backgroundColor=[UIColor orangeColor];
        
        
        return cell;
        
        
    }
    
#pragma mark 展示滚动图片和显示图片的时候，图片反过来了。。需要数组排序下。。
    
    
    
    
    
    //暂时
    static NSString*cellID=@"cell";
    
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]init];
    }
    
    //看看各个分区情况
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row  ];
    
    cell.backgroundColor=[UIColor purpleColor];
    
    return cell;
    
    
    
}
#pragma mark SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    //输出看看点击的对不对
    NSLog(@"index==%ld",(long)index);
    
    
    
}
//区高度。。先大概做，，后边在具体调整和计算
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return self.view.frame.size.height;
    }
    
    //这个是参团，，是不固定的，，药根据数据源来的。。所以这里就先大概来个100占位下而已
    if (indexPath.section==1) {
        return 100;
    }
    
    //进店
    if (indexPath.section==2) {
        return 60;
    }
    //标题图片
    if (indexPath.section==3) {
        return 60;
    }
    //展示的图片，一般10张，每张大概先350到400.。参数给有，，这里就任性先
    if (indexPath.section==4) {
        return 530;//之前是350，，不够高度，，我还没有传图片的高度和宽度进来计算。。要自动那个模型来设计，会保持原来图片的宽高比例的。。
    }
    //推荐..看数组给的..先大概给个全屏幕高
    else
    {
        return self.view.frame.size.height;
    
    }
    
}





-(void)backButon
{
    [self.navigationController popViewControllerAnimated:YES];
    //NSLog(@"---");
}

@end
