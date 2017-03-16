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
    
//    //归档
//    NSString *multiHomePath = [NSHomeDirectory() stringByAppendingPathComponent:@"multi.archiver"];
//    
//    NSMutableData *data = [[NSMutableData alloc] init];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    
//    [archiver encodeObject:account forKey:@"accesss"];
//    [archiver finishEncoding];
//    //写入文件
//    [data writeToFile:multiHomePath atomically:YES];
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
