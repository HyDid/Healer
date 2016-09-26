//
//  HyCustomScrollView.m
//  Healer
//
//  Created by LiHongYu on 16/9/8.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyCustomScrollView.h"



@implementation HyCustomScrollView

static const int imageCount = 5;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self didscrolView];

    }
    return self;
}

-(void)didscrolView{
    
    UIScrollView *scrolView = [[UIScrollView alloc]init];
    scrolView.frame = self.frame;
    
    CGFloat imageW = self.frame.size.width;
    CGFloat imageH = self.frame.size.height;
    
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

    //隐藏水平滚动条
    scrolView.showsHorizontalScrollIndicator = NO;
    //水平滚动
    scrolView.contentSize = CGSizeMake(contentW, 0);
//    scrolView.alwaysBounceVertical = YES;
//    scrolView.alwaysBounceHorizontal = NO;
    //分页
    scrolView.pagingEnabled = YES;
    

    
    //设置pageview的属性
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake((imageW-100)/2, 0, 100,50);
    pageControl.numberOfPages = imageCount;
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    int page = (scrolView.contentOffset.x + scrolView.frame.size.width*0.5)/scrolView.frame.size.width;
    pageControl.currentPage = page;
    
    self.pageControl = pageControl;
    self.scrolView = scrolView;
    [self addSubview:self.pageControl];
    
    [self addSubview:self.scrolView];
    
}



//改变每页图片
-(void)nextImage{

    if (self.pageControl.currentPage == imageCount - 1) {
        self.pageControl.currentPage = 0 ;
    }else{
        self.pageControl.currentPage++;
    }
    CGFloat offsetX = self.pageControl.currentPage * self.scrolView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrolView setContentOffset:offset  animated:YES];
}

@end
