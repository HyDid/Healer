//
//  HyLoginHttpTool.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HyLoginParam.h"
#import "HyLoginResult.h"
#import "HyForgetPasswordParam.h"
#import "HyForgetPasswordResult.h"
#import "HySignParam.h"
#import "HySignResult.h"
#import "HyGetCodeResult.h"

@interface HyLoginHttpTool : NSObject

+(void)postForSignWithParameter:(HySignParam *)param  success:(void (^)(HySignResult *result))success failure:(void (^)(NSError *error))failure;

+(void)postForCodeWithParameter:(HyLoginParam *)param success:(void (^)(HyGetCodeResult *result))success failure:(void (^)(NSError *error))failure;

+(void)postForLoginWithParameter:(HyLoginParam *)param success:(void (^)(HyLoginResult *result))success failure:(void (^)(NSError *error))failure;

+(void)postForForgotPwdWithParameter:(HyForgetPasswordParam *)param success:(void (^)(HyForgetPasswordResult *result))success failure:(void (^)(NSError *error))failure;

@end
