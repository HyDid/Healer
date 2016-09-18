//
//  yisheng.h
//  Healer
//
//  Created by LiHongYu on 16/5/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface yisheng : NSObject
@property (strong, nonatomic)NSString *icon;
@property (strong, nonatomic)NSString *name;

@property (assign, nonatomic)int number;
@property (strong, nonatomic)NSString *labl;
-(instancetype)initWithdict:(NSDictionary*)dict;
+(instancetype)yishengWithdict:(NSDictionary*)dict;

@end
