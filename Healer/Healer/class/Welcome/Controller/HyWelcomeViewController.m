//
//  HyWelcomeViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyWelcomeViewController.h"

#import "HyHomeViewController.h"

@interface HyWelcomeViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *welcomeImages;
@end

@implementation HyWelcomeViewController

//页数


-(NSArray *)welcomeImages{
    if (!_welcomeImages) {
        _welcomeImages = [NSArray arrayWithObjects:@"welcome", nil];
    }
    return _welcomeImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    //1. 设置ScrollView
    [self setupScrollView];
    
    //2. 设置分页
  //  [self setupPageControl];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2ull * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self login];
    });
}

-(void)setupScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    CGFloat imageW = scrollView.frame.size.width;
    CGFloat imageH = scrollView.frame.size.height;
    for(int index = 0; index < self.welcomeImages.count; index++){
        UIImageView *imageView = [UIImageView new];
        
        // 设置图片
        NSString *name = _welcomeImages[index];
        imageView.image = [UIImage imageNamed:name];
        
        
        // 设置frame
        CGFloat imageX = index * imageW;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        [scrollView addSubview:imageView];
    }
    
    scrollView.contentSize = CGSizeMake(imageW * self.welcomeImages.count , 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
}

-(void)setupPageControl{
    // 1. 添加
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = self.welcomeImages.count;
    CGFloat centerX = self.view.frame.size.width * 0.5;
    CGFloat centerY = self.view.frame.size.height - 35;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    // 2. 设置圆点颜色
    pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:70.0/255.0 green:148.0/255.0 blue:232.0/255.0 alpha:1];
    pageControl.pageIndicatorTintColor =[UIColor lightGrayColor];
    //[UIColor colorWithRed:222 green:223 blue:224 alpha:1.0];
    
}

-(void)login{
    [UIApplication sharedApplication].statusBarHidden = NO;
    HyHomeViewController *login = [HyHomeViewController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:login];
    self.view.window.rootViewController = nav;
    
}

#pragma mark Delegate Method
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 1. 取出水平方向滚动距离
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 2. 求出页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
    
    if (pageInt == 1) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self login];
        });
    }else{
    }
}


@end
