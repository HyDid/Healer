//
//  hotMoreView.m
//  Healer
//
//  Created by LiHongYu on 16/4/21.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "hotMoreView.h"

@implementation hotMoreView

+(hotMoreView *)viewwithhotmore{

    hotMoreView *hotMore = [[[NSBundle mainBundle]loadNibNamed:@"hotMoreView" owner:nil options:nil]lastObject];
    
    return hotMore;
}
-(void)setHottalk:(HotTalk *)hottalk{
    
    _hottalk = hottalk;
    self.icon.image = [UIImage imageNamed:hottalk.icon];
    self.title.text = hottalk.name;
    self.text.text = hottalk.edit;
}

@end
