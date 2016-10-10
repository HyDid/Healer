//
//  HyHttpTool.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyHttpTool : NSObject

+(void)postWithURL:(NSString *)url parameter:(NSDictionary *)param  success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end
