//
//  HyTableViewCell.m
//  Healer
//
//  Created by LiHongYu on 16/5/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyTableViewCell.h"

@implementation HyTableViewCell



+(HyTableViewCell *)cellWithTableview:(UITableView *)tableview{
    
    static NSString *ID = @"id";
    HyTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"HyTableViewCell" owner:nil options:nil]lastObject];
    }
    return cell;
    

}
+(CGFloat)cellhight{
    return 70;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setYisheng:(yisheng *)yisheng{
    
    _yisheng = yisheng;
    self.name.text = yisheng.name;
    self.labl.text = yisheng.labl;
    self.icon.image = [UIImage imageNamed:yisheng.icon];
    self.number.text = [NSString stringWithFormat:@"%d",yisheng.number];

}

@end
