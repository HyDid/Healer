//
//  FellTableViewCell.h
//  Healer
//
//  Created by LiHongYu on 16/4/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotTalk.h"

@interface FellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *edit;
@property (weak, nonatomic) IBOutlet UILabel *god;
@property (weak, nonatomic) IBOutlet UILabel *eye;
@property (weak, nonatomic) IBOutlet UIButton *more;


@property (strong,nonatomic) HotTalk *hottalk;
+(instancetype)cellWithTableView:(UITableView *)table;
@end
