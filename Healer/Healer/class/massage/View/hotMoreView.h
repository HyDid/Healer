//
//  hotMoreView.h
//  Healer
//
//  Created by LiHongYu on 16/4/21.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotTalk.h"
@interface hotMoreView : UIView
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UITextView *text;
@property (strong,nonatomic) HotTalk *hottalk;
//@property (strong,nonatomic)hotMoreView* hotMore;
+(hotMoreView *)viewwithhotmore;
@end
