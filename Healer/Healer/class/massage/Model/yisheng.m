//
//  yisheng.m
//  Healer
//
//  Created by LiHongYu on 16/5/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "yisheng.h"

@implementation yisheng



-(instancetype)initWithdict:(NSDictionary *)dict{
    if (self =[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }return self;
}


+(instancetype)yishengWithdict:(NSDictionary *)dict{
    return [[self alloc]initWithdict:dict];
}
@end
