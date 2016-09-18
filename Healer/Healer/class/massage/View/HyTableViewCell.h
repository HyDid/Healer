//
//  HyTableViewCell.h
//  Healer
//
//  Created by LiHongYu on 16/5/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "yisheng.h"


@interface HyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *labl;

@property (strong,nonatomic)yisheng *yisheng;

+(HyTableViewCell *)cellWithTableview:(UITableView *)tableview;
+(CGFloat)cellhight;
@end
