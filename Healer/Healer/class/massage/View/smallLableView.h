//
//  smallLableView.h
//  Healer
//
//  Created by LiHongYu on 16/4/20.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class smallLableViewObject;
@interface smallLableView : UIView

@property (nonatomic,strong)smallLableViewObject *smallLableViewObject;
@property (strong,nonatomic)UILabel *timeLable;
@property (strong,nonatomic)UILabel *textLable;
@property (strong,nonatomic)UIButton *yueduButton;
@property (strong,nonatomic)UIButton *shoutingButton;
@property (strong,nonatomic)UIButton *xiazaiButton;
@property (strong,nonatomic)UIButton *gengduoButton;


@end
