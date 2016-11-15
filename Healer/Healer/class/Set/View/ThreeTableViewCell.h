//
//  ThreeTableViewCell.h
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labtext;

+(ThreeTableViewCell *)cellWithTableview:(UITableView *)tableview;
+(CGFloat)cellhight;
@end
