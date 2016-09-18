//
//  TheYellowView.m
//  Healer
//
//  Created by LiHongYu on 16/9/18.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#define ButtonW 50
#define SmallButtonW 30
#define SelfW  self.frame.size.width
#define SelfH  self.frame.size.height

#import "TheYellowView.h"
#import "LittleButton.h"

@implementation TheYellowView


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self addRoundbutton];

    }
    return self;
}
-(void)addRoundbutton{
    
    for (int i = 0 ; i < 13; i++) {
        NSArray *array = @[@"心理障碍",@"婆媳关系",@"婚恋情感",@"职场社交",@"青春成长",@"亲子教育",@"性倾向",@"误解",@"烦恼",@"心结",@"选择恐惧",@"学习压力",@"纠结"];
        LittleButton *btn = [[LittleButton alloc]init];
        switch (i) {
            case 0:
                btn.frame = CGRectMake(50, 50, ButtonW, ButtonW);
                break;
            case 1:
                btn.frame = CGRectMake(150, 30, ButtonW, ButtonW);
                break;
            case 2:
                btn.frame = CGRectMake(270, 60, ButtonW, ButtonW);
                break;
            case 3:
                btn.frame = CGRectMake(280, 160, ButtonW, ButtonW);
                break;
            case 4:
                btn.frame = CGRectMake(175, 210, ButtonW, ButtonW);
                break;
            case 5:
                btn.frame = CGRectMake(65, 200, ButtonW, ButtonW);
                break;
            case 6:
                btn.frame = CGRectMake(30, 150, ButtonW, ButtonW);
                break;
            case 7:
                btn.frame = CGRectMake(110, 60, SmallButtonW, SmallButtonW);
                break;
            case 8:
                btn.frame = CGRectMake(210, 60, SmallButtonW, SmallButtonW);
                break;
            case 9:
                btn.frame = CGRectMake(300, 120, SmallButtonW, SmallButtonW);
                break;
            case 10:
                btn.frame = CGRectMake(250, 200, SmallButtonW, SmallButtonW);
                break;
            case 11:
                btn.frame = CGRectMake(130, 200, SmallButtonW, SmallButtonW);
                break;
            case 12:
                btn.frame = CGRectMake(40, 100, SmallButtonW, SmallButtonW);
                break;
                
            default:
                break;
        }
        
        if (i > 6) {
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        }
        
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"xiaoquan"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(YellowbtnOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
    UILabel *lab = [[UILabel alloc]init];
    lab.frame = CGRectMake(120,95, 200, 50);
    lab.text = @"您现在有什么";
    lab.font = [UIFont systemFontOfSize:20 weight:13];
    [self addSubview:lab];
    UILabel *lab2 = [[UILabel alloc]init];
    lab2.frame = CGRectMake(130,125, 200, 50);
    lab2.text = @"情绪?";
    lab2.font = [UIFont systemFontOfSize:32 weight:13];
    [self addSubview:lab2];
    
    UIImageView *lineview = [[UIImageView alloc]init];
    lineview.frame = CGRectMake(80,90, 200, 100);
    lineview.image = [UIImage imageNamed:@"quan"];
    [self addSubview:lineview];
    
    UITextField *textfield = [[UITextField alloc]init];
    textfield.frame = CGRectMake(40,280, 230, 30);
    textfield.background = [UIImage imageNamed:@"qudingkuang"];
    textfield.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 5)];
    textfield.leftViewMode = UITextFieldViewModeAlways;
    self.textfield = textfield;
    [self addSubview:self.textfield];
    
    UIButton *didButton = [[UIButton alloc]init];
    didButton.frame = CGRectMake(280,280, 60, 30);
    [didButton setBackgroundImage:[UIImage imageNamed:@"queding"] forState:UIControlStateNormal];
    [didButton addTarget:self action:@selector(DidbtnOnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:didButton];

}



//button response event
-(void)YellowbtnOnClick:(LittleButton *)button{

    if ([self.delegate respondsToSelector:@selector(btnOnClick:Frame:)]) {
        [self.delegate btnOnClick:button.titleLabel.text Frame:button.frame];
    }

}

-(void)DidbtnOnClick{
    if ([self.delegate respondsToSelector:@selector(didbtnOnClick:)]) {
        [self.delegate didbtnOnClick:self.textfield.text];
    }
}
@end
