//
//  HyBaseParam.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyBaseParam : NSObject

/**
 *  用户标识
 */
@property (nonatomic, copy) NSString *token;

+(instancetype)param;

@end
