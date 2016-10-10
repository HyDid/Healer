//
//  HyLoginResult.m
//  Healer
//
//  Created by LiHongYu on 16/9/27.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyLoginResult.h"

@implementation HyLoginResult

/**
 *  从文件中解析对象的时候调
 */

-(instancetype)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.token = [decoder decodeObjectForKey:@"token"];
    }
    
    return self;
}


/**
 *  将对象写入文件的时候调用
 */

-(void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.token forKey:@"token"];
}
@end
