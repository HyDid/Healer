//
//  TwoTableViewCell.h
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labtext;

+(TwoTableViewCell *)cellWithTableview:(UITableView *)tableview;
+(CGFloat)cellhight;
@end
