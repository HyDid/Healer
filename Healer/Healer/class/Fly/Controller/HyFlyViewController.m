//
//  HyFlyViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/7.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyFlyViewController.h"
#import "FellTableViewCell.h"
#import "hotMoreView.h"

@interface HyFlyViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak)UIScrollView *scrolView;
@property (nonatomic,weak)UIPageControl *pagecontrol;
@property (nonatomic,weak)UIView *actionView;
@property (nonatomic,weak)UITableView  *TalkTableView;
@property (nonatomic,copy)NSMutableArray *hotTalkArray;
@property (nonatomic,weak)hotMoreView *moreView;
@end

@implementation HyFlyViewController


static const int imageCount = 5;
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"心情纸飞机";
    self.view.backgroundColor = [UIColor lightGrayColor];
    
}

//- (void)viewDidLayoutSubviews {
//    
//    [super viewDidLayoutSubviews];
//
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self didscrolView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self didactionView];
    [self didTalkTableView];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"hottalk.plist" ofType:nil];
    NSArray *talkDicts = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in talkDicts) {
        HotTalk *hottalk = [HotTalk hottalkWithDict:dict];
        [self.hotTalkArray addObject:hottalk];
    }
}

-(NSMutableArray *)hotTalkArray{
    if (!_hotTalkArray) {
        _hotTalkArray = [NSMutableArray array];
    }
    return _hotTalkArray;
}


-(void)didscrolView{
    
    UIScrollView *scrolView = [[UIScrollView alloc]init];
    scrolView.frame = CGRectMake(0, ScreenH*0.1, ScreenW, ScreenH*0.27);

    CGFloat imageW = scrolView.frame.size.width;
    CGFloat imageH = scrolView.frame.size.height;
    for (int i = 0; i<imageCount; i++) {
        UIImageView *imageview = [[UIImageView alloc]init];
        //设置frame
        CGFloat imageX = i * imageW;
        CGFloat imageY = 0;
        imageview.frame =CGRectMake(imageX, imageY, imageW, imageH);
        //设置图片
        NSString *name = [NSString stringWithFormat:@"lunbo%d",i+1];
        imageview.image =[UIImage imageNamed:name];
        [scrolView addSubview:imageview];
    }
    //设置内容尺寸
    CGFloat contentW = imageCount * imageW;
    scrolView.contentSize = CGSizeMake(contentW, 0);
    //隐藏水平滚动条
    scrolView.showsHorizontalScrollIndicator = NO;
    //水平滚动
//    scrolView.alwaysBounceVertical = YES;
    //分页
    scrolView.pagingEnabled = YES;

    //设置pageview的属性
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake(0, ScreenH*0.33, ScreenW, 20);
    
    pageControl.numberOfPages = imageCount;
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    self.pagecontrol = pageControl;
    self.scrolView = scrolView;
    self.scrolView.delegate = self;

    [self.view addSubview:self.scrolView];
    [self.view addSubview:self.pagecontrol];
}
//改变每页图片
-(void)nextImage{
    if (self.pagecontrol.currentPage == imageCount - 1) {
        self.pagecontrol.currentPage = 0 ;
    }else{
        self.pagecontrol.currentPage++;
    }
    CGFloat offsetX = self.pagecontrol.currentPage * self.scrolView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrolView setContentOffset:offset  animated:YES];
}
//代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width*0.5)/scrollView.frame.size.width;
    self.pagecontrol.currentPage = page ;
}

-(void)didactionView{
    UIView *actionView = [[UIView alloc]init];
    actionView.frame = CGRectMake(0, ScreenH*0.37, ScreenW, ScreenH*0.12);
    actionView.backgroundColor = [UIColor whiteColor];
    
    NSArray *ImageArray = @[@"xie",@"jian",@"fa"];
    NSArray *LableArray = @[@"写",@"捡",@"发泄墙"];
    CGFloat imageW = 55;
    for (int i = 0; i <3; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(i*ScreenW/3+ScreenW/6-imageW/2, 2, imageW, imageW);

        btn.tag = i;
        
    [btn setImage:[UIImage imageNamed:ImageArray[i]] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
        
        UILabel *lab = [[UILabel alloc]init];

        lab.frame = CGRectMake(i*ScreenW/3, 55, ScreenW/3, 30);
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:13 weight:1];
        lab.tag = i;
        
        [lab setText:LableArray[i]];
        

        [actionView addSubview:btn];
        [actionView addSubview:lab];
    
    }
    UIView *lineview = [[UIView alloc]init];
    lineview.backgroundColor = [UIColor lightGrayColor];
    lineview.frame = CGRectMake(ScreenW/3, 20, 1.5, 35);
    [actionView addSubview:lineview];
    UIView *lineview2 = [[UIView alloc]init];
    lineview2.backgroundColor = [UIColor lightGrayColor];
    lineview2.frame = CGRectMake(ScreenW*2/3, 20, 1.5, 35);
    [actionView addSubview:lineview2];

    
    self.actionView = actionView;
    [self.view addSubview:self.actionView];
    
}
-(void)didTalkTableView{
    UITableView *tableview = [[UITableView alloc]init];
    tableview.frame = CGRectMake(0, ScreenH*0.5, ScreenW, ScreenH*0.5);
    self.TalkTableView = tableview;
    self.TalkTableView.delegate = self;
    self.TalkTableView.dataSource = self;
    self.TalkTableView.separatorStyle = NO;
    self.TalkTableView.showsVerticalScrollIndicator = NO;
    //    //失去弹性
    //    self.hytableview.bounces = NO;
    
    [self.view addSubview:self.TalkTableView];
    
}

-(void)actionClick:(UIButton*)btn{

    switch (btn.tag) {
        case 0:
            NSLog(@"------0");
            break;
        case 1:
            NSLog(@"------1");
            break;
        case 2:
            NSLog(@"------2");
            break;
            
        default:
            break;
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headview = [[UIView alloc]init];
    headview.backgroundColor = [UIColor whiteColor];
    UIImageView *hotview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hot"]];
    hotview.frame = CGRectMake(10, 10, 20, 20);
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(40, 10, 200, 20);
    lab.textAlignment = NSTextAlignmentLeft;
    lab.font = [UIFont systemFontOfSize:15 weight:1];
    [lab setText:@"热 门 话 题"];
    
    UIView *lineview = [[UIView alloc]init];
    lineview.backgroundColor = [UIColor lightGrayColor];
    lineview.frame = CGRectMake(0, 48, ScreenW, 1);
    
    [headview addSubview:lineview];
    [headview addSubview:lab];
    [headview addSubview:hotview];

    return headview;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.hotTalkArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FellTableViewCell *cell = [FellTableViewCell cellWithTableView:self.TalkTableView];
    cell.hottalk = self.hotTalkArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    hotMoreView *moreView=[hotMoreView viewwithhotmore];
    moreView.frame = CGRectMake(0, ScreenH, ScreenW, ScreenH*0.5);
    moreView.hottalk = self.hotTalkArray[indexPath.row];
    
    self.moreView = moreView;
    
    [self.view addSubview:moreView];
    
    [moreView.back addTarget:self action:@selector(moreViewBtn) forControlEvents:UIControlEventTouchUpInside];
    

    [UIView animateWithDuration:0.4 animations:^{
        
        self.TalkTableView.transform = CGAffineTransformMakeTranslation(ScreenW, 0);
        self.moreView.transform = CGAffineTransformMakeTranslation(0, -ScreenH*0.5);
        
    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)moreViewBtn{
    
    
    [UIView animateWithDuration:0.4 animations:^{
        self.TalkTableView.transform = CGAffineTransformMakeTranslation(0, 0);
        self.moreView.transform = CGAffineTransformMakeTranslation(0, ScreenH);
        
    } completion:^(BOOL finished) {
        
    }];
    
}


@end
