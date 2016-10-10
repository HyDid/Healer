//
//  HyAccountTool.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HyLoginResult;

@interface HyAccountTool : NSObject


/**
 *  存储帐号信息
 
 *  @param access 需要存储的帐号
 */
+(void)savaAccount:(HyLoginResult *)account;

/**
 *  返回存储的帐号信息
 */
+(HyLoginResult *)account;
/**
 *  注销
 */
+(void)exit;

@end
