//
//  flyResult.h
//  Healer
//
//  Created by LiHongYu on 2017/3/15.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface flyResult : NSObject

@property (nonatomic, assign) Boolean success;
@property (nonatomic, assign) int error_code;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic,copy) NSDictionary *result;

@end
