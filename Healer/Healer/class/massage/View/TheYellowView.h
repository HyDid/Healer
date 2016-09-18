//
//  TheYellowView.h
//  Healer
//
//  Created by LiHongYu on 16/9/18.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LittleButton;
@protocol TheYellowViewDelegate <NSObject>
@optional

-(void)btnOnClick:(NSString*)ButtonText Frame:(CGRect)frame;
-(void)didbtnOnClick:(NSString *)textFieldString;

@end

@interface TheYellowView : UIView

@property(nonatomic,strong)UITextField *textfield;
@property(nonatomic,weak)id<TheYellowViewDelegate>delegate;
@end
