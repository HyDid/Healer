//
//  HyBaseResult.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyBaseResult : NSObject

/**
 *  成功标志
 */
@property (nonatomic, assign) Boolean success;
/**
 *  消息
 */
@property (nonatomic, copy) NSString *msg;
/**
 *  token过期
 */
@property (nonatomic, assign) Boolean token;

@end
