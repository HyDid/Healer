//
//  HyBaseParam.m
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyBaseParam.h"
#import "HyLoginResult.h"
#import "HyAccountTool.h"

@implementation HyBaseParam

-(NSString *)token{
    HyLoginResult *result = [HyAccountTool account];
    if (![result.token isEqualToString:@""]) {
        return result.token;
    }else{
        return nil;
    }
}

+(instancetype)param{
    return [[self alloc] init];
}
@end
