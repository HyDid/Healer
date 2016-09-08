//
//  HotTalk.h
//  Healer
//
//  Created by LiHongYu on 16/4/13.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotTalk : NSObject
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *edit;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)hottalkWithDict:(NSDictionary *)dict;

@end
