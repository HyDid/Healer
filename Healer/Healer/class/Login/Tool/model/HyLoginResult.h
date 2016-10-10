//
//  HyLoginResult.h
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HyLoginResult : NSObject<NSCoding>


@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) Boolean success;

@property (nonatomic, copy) NSString *token;

@end
