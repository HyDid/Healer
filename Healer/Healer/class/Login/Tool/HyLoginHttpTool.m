//
//  HyLoginHttpTool.m
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyLoginHttpTool.h"
#import "HyHttpTool.h"
#import "MJExtension.h"

@implementation HyLoginHttpTool


+(void)postForSignWithParameter:(HySignParam *)param  success:(void (^)(HySignResult *result))success failure:(void (^)(NSError *error))failure{
    
    NSString *postURL = @"http://localhost:8080/abc/form";
    
    [HyHttpTool postWithURL:postURL parameter:param.mj_keyValues success:^(id json) {
        HySignResult *result = [HySignResult mj_objectWithKeyValues:json];
        if(success){
            success(result);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];

}

+(void)postForCodeWithParameter:(HyLoginParam *)param success:(void (^)(HyGetCodeResult *result))success failure:(void (^)(NSError *error))failure{
    
}

+(void)postForLoginWithParameter:(HyLoginParam *)param success:(void (^)(HyLoginResult *result))success failure:(void (^)(NSError *error))failure{
    
        NSString *postURL = [NSString stringWithFormat:@"http://127.0.0.1/test/response.php"];
        [HyHttpTool postWithURL:postURL parameter:param.mj_keyValues success:^(id json) {
            HyLoginResult *result = [HyLoginResult mj_objectWithKeyValues:json];
            if(success){
                success(result);
            }
        } failure:^(NSError *error) {
            if(failure){
                failure(error);
            }
        }];
}

+(void)postForForgotPwdWithParameter:(HyForgetPasswordParam *)param success:(void (^)(HyForgetPasswordResult *result))success failure:(void (^)(NSError *error))failure{
    
}

@end
