//
//  HyFlyHttpTool.m
//  Healer
//
//  Created by LiHongYu on 2017/3/15.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import "HyFlyHttpTool.h"


@implementation HyFlyHttpTool



+(void)getWithParameter:(Flyparam *)param  success:(void (^)(flyResult *result))success failure:(void (^)(NSError *error))failure{
    
    NSString *postURL = @"http://japi.juhe.cn/joke/content/list.from";
    
    [HyHttpTool getWithURL:postURL parameter:param.mj_keyValues success:^(id json) {
        flyResult *result = [flyResult mj_objectWithKeyValues:json];
        
        if(success){
            success(result);
        }
    } failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
    
    
}



@end
