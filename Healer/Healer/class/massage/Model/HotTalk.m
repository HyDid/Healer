//
//  HotTalk.m
//  Healer
//
//  Created by LiHongYu on 16/4/13.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HotTalk.h"

@implementation HotTalk


-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}
+(instancetype)hottalkWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
