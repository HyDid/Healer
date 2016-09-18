//
//  smallLableViewObject.m
//  Healer
//
//  Created by LiHongYu on 16/4/20.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "smallLableViewObject.h"



@implementation smallLableViewObject


-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)smallViewWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
