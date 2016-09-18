//
//  xinlingjitang1View.h
//  Healer
//
//  Created by LiHongYu on 16/4/20.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "smallLableView.h"

@interface xinlingjitang1View : UIView
@property (weak, nonatomic) IBOutlet smallLableView *oneView;
@property (weak, nonatomic) IBOutlet smallLableView *twoView;
@property (weak, nonatomic) IBOutlet smallLableView *thirdView;
@property (weak, nonatomic) IBOutlet smallLableView *fourView;
@property (weak, nonatomic) IBOutlet smallLableView *fiveView;

@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
-(void)setsmallLableView;
@property (nonatomic, strong) NSMutableArray *smallLableViewObjects;
@end
