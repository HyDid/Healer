//
//  HyLoginViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/26.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyLoginViewController.h"
#import "HySignViewController.h"
#import "HyFindPasswordViewController.h"

@interface HyLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *PhoneNumberTextInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextInput;


@end

@implementation HyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)forgetPassword:(id)sender {
    HyFindPasswordViewController *HyFindPassword = [[HyFindPasswordViewController alloc]init];
    [self.navigationController pushViewController:HyFindPassword animated:YES];
}
- (IBAction)join:(id)sender {
}
- (IBAction)newPerson:(id)sender {
    HySignViewController *HySign = [[HySignViewController alloc]init];
    [self.navigationController pushViewController:HySign animated:YES];
}

//其他方式登陆
- (IBAction)weixinJoin:(id)sender {
}
- (IBAction)weiboJoin:(id)sender {
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
