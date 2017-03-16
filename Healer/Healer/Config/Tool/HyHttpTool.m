//
//  HyHttpTool.m
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyHttpTool.h"
#import "AFNetworking.h"

@implementation HyHttpTool

+(void)postWithURL:(NSString *)url parameter:(NSDictionary *)param  success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    
    mgr.requestSerializer.timeoutInterval = 10;
    [mgr POST:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@-----------HyHttpTool",responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"-----------------------------------%@",error);
            failure(error);
        }
    }];
}

+(void)getWithURL:(NSString *)url parameter:(NSDictionary *)param  success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"text/plain", nil];
    
    mgr.requestSerializer.timeoutInterval = 10;
    
    [mgr GET:url parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@-----------HyHttpTool",responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"-----------------------------------%@",error);
            failure(error);
        }
    }];
    
    
    
    
}
@end
