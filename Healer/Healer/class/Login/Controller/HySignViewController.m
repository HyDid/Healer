//
//  HySignViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/26.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySignViewController.h"
#import "HySignParam.h"
#import "HySignResult.h"
#import "HyLoginHttpTool.h"

@interface HySignViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phonenumberFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordFiled;
@property (weak, nonatomic) IBOutlet UITextField *copField;

@end

@implementation HySignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)fastSign:(id)sender {
    
        HySignResult *param = [[HySignResult alloc]init];;
        param.username = self.phonenumberFiled.text;
        param.code = self.copField.text;
        param.password = self.passwordFiled.text;
    [HyLoginHttpTool postForSignWithParameter:param success:^(HySignResult *result) {
        NSLog(@"%@",result);
    } failure:^(NSError *error) {
        
    }];


}
- (IBAction)backJoin:(id)sender {
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
