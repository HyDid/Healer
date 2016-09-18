//
//  smallLableViewObject.h
//  Healer
//
//  Created by LiHongYu on 16/4/20.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface smallLableViewObject : NSObject
@property (copy,nonatomic)NSString *timeLable;
@property (copy,nonatomic)NSString *textLable;
@property (copy,nonatomic)NSString *yueduButton;
@property (copy,nonatomic)NSString *shoutingButton;
@property (copy,nonatomic)NSString *xiazaiButton;
@property (copy,nonatomic)NSString *gengduoButton;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)smallViewWithDict:(NSDictionary *)dict;
@end
