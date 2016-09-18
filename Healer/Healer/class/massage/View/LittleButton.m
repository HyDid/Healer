//
//  LittleButton.m
//  Healer
//
//  Created by LiHongYu on 16/9/18.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//
#define MarkButtonTitleW 80

#import "LittleButton.h"

@implementation LittleButton


//Only override drawRect: if you perform custom drawing.
//An empty implementation adversely affects performance during animation.
+ (instancetype)markButton
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        //self.titleLabel.textColor = [UIColor whiteColor];
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;

        // 背景
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageX = 0;
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleW = MarkButtonTitleW;
    CGFloat titleX = (contentRect.size.width - titleW)/2;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
