//
//  HyBaseViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/7.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyBaseViewController.h"

@interface HyBaseViewController ()

@end

@implementation HyBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,44)];
    [self.nBarView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.nBarView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    
    button.frame = CGRectMake(0, 0, 100, 44);
    [button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.nBarView addSubview:button];
    
    
}
-(void)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
