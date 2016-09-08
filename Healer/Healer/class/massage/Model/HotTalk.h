//
//  HotTalk.h
//  Healer
//
//  Created by LiHongYu on 16/4/13.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotTalk : NSObject
//图片
@property (nonatomic,copy)NSString *icon;
//标题
@property (nonatomic,copy)NSString *name;
//正文缩略
@property (nonatomic,copy)NSString *edit;
//点赞数
@property (nonatomic,copy)NSString *cheer;
//浏览量
@property (nonatomic,copy)NSString *eye;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)hottalkWithDict:(NSDictionary *)dict;

@end
