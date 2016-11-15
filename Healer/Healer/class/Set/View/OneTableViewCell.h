//
//  OneTableViewCell.h
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *rightlab;

@property (weak, nonatomic) IBOutlet UILabel *labtext;

+(OneTableViewCell *)cellWithTableview:(UITableView *)tableview;
+(CGFloat)cellhight;
@end
