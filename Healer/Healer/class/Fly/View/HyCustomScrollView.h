//
//  HyCustomScrollView.h
//  Healer
//
//  Created by LiHongYu on 16/9/8.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HyCustomScrollView : UIView<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView * scrolView;
@property (nonatomic,strong)UIPageControl * pageControl;
@end
