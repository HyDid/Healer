//
//  HyFlyHttpTool.h
//  Healer
//
//  Created by LiHongYu on 2017/3/15.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HyHttpTool.h"
#import "Flyparam.h"
#import "flyResult.h"
#import "MJExtension.h"
@interface HyFlyHttpTool : NSObject

+(void)getWithParameter:(Flyparam *)param  success:(void (^)(flyResult *result))success failure:(void (^)(NSError *error))failure;

@end
