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
                btn.frame = CGRectMake(50, 80, ButtonW, ButtonW);
                break;
            case 1:
                btn.frame = CGRectMake(50, 80, ButtonW, ButtonW);
                break;
            case 2:
                btn.frame = CGRectMake(150, 80, ButtonW, ButtonW);
                break;
            case 3:
                btn.frame = CGRectMake(250, 80, ButtonW, ButtonW);
                break;
            case 4:
                btn.frame = CGRectMake(50, 300, ButtonW, ButtonW);
                break;
            case 5:
                btn.frame = CGRectMake(150, 300, ButtonW, ButtonW);
                break;
            case 6:
                btn.frame = CGRectMake(250, 300, ButtonW, ButtonW);
                break;
            case 7:
                btn.frame = CGRectMake(250, 300, SmallButtonW, SmallButtonW);
                break;
            case 8:
                btn.frame = CGRectMake(250, 300, SmallButtonW, SmallButtonW);
                break;
            case 9:
                btn.frame = CGRectMake(250, 300, SmallButtonW, SmallButtonW);
                break;
            case 10:
                btn.frame = CGRectMake(250, 300, SmallButtonW, SmallButtonW);
                break;
            case 11:
                btn.frame = CGRectMake(250, 300, SmallButtonW, SmallButtonW);
                break;
            case 12:
                btn.frame = CGRectMake(250, 300, SmallButtonW, SmallButtonW);
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
    if ([self.delegate respondsToSelector:@selector(didbtnOnClick)]) {
        [self.delegate didbtnOnClick];
    }
}
@end
