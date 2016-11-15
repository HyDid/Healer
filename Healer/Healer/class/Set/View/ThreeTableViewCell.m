//
//  ThreeTableViewCell.m
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "ThreeTableViewCell.h"

@implementation ThreeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(CGFloat)cellhight{
    return 50;
}

+(ThreeTableViewCell *)cellWithTableview:(UITableView *)tableview{
    static NSString *ID = @"id";
    ThreeTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ThreeTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

@end
