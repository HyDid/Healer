//
//  HyAccountTool.m
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyAccountTool.h"

@implementation HyAccountTool

+(void)savaAccount:(HyLoginResult *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject] stringByAppendingPathComponent:@"access.data"]];
}

+(HyLoginResult *)account
{
    // 取出帐号
    HyLoginResult *account = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject] stringByAppendingPathComponent:@"access.data"]];
    return account;
}

+(void)exit{
    NSFileManager *mgr = [NSFileManager defaultManager];
    [mgr removeItemAtPath:[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject] stringByAppendingPathComponent:@"access.data"] error:nil];
}

@end
