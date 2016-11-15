//
//  FellTableViewCell.m
//  Healer
//
//  Created by LiHongYu on 16/4/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "FellTableViewCell.h"


@implementation FellTableViewCell


- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)table{
    static NSString *ID = @"";
    FellTableViewCell *cell = [table dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"FellTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
}




-(void)setHottalk:(HotTalk *)hottalk{
    _hottalk = hottalk;
    
    self.icon.image = [UIImage imageNamed:hottalk.icon];
    self.name.text = hottalk.name;
    self.edit.text = hottalk.edit;
    self.god.text = hottalk.cheer;
    self.eye.text = hottalk.eye;
}


@end
