//
//  OneTableViewCell.m
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "OneTableViewCell.h"

@implementation OneTableViewCell

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

+(OneTableViewCell *)cellWithTableview:(UITableView *)tableview{
    static NSString *ID = @"id";
    OneTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"OneTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}

@end
