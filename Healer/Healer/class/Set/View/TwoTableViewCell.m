//
//  TwoTableViewCell.m
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "TwoTableViewCell.h"

@implementation TwoTableViewCell

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

+(TwoTableViewCell *)cellWithTableview:(UITableView *)tableview{
    static NSString *ID = @"id";
    TwoTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"TwoTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

@end
