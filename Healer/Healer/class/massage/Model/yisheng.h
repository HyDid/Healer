//
//  yisheng.h
//  Healer
//
//  Created by LiHongYu on 16/5/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface yisheng : NSObject
@property (copy, nonatomic)NSString *icon;
@property (copy, nonatomic)NSString *name;
@property (copy, nonatomic)NSString *number;
@property (copy, nonatomic)NSString *labl;


-(instancetype)initWithdict:(NSDictionary*)dict;
+(instancetype)yishengWithdict:(NSDictionary*)dict;

@end
