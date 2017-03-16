//
//  Flyparam.h
//  Healer
//
//  Created by LiHongYu on 2017/3/15.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flyparam : NSObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *sort;
@property (nonatomic, assign) int page;
@property (nonatomic, assign) int pagesize;
@property (nonatomic, copy) NSString *time;
@end
