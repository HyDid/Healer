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
#import "HyHomeViewController.h"
#import "HyLoginHttpTool.h"
#import "HyLoginParam.h"

#import "SVProgressHUD.h"

#import <TencentOpenAPI/TencentOAuth.h>

@interface HyLoginViewController ()<TencentSessionDelegate>
{
    UIButton *qqLoginBtn;
    TencentOAuth *tencentOAuth;
    NSArray *permissions;
    UILabel *resultLable;
    UILabel *tokenLable;
}
@property (weak, nonatomic) IBOutlet UITextField *PhoneNumberTextInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextInput;



@end

@implementation HyLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //QQ第三方登录设置
    tencentOAuth=[[TencentOAuth alloc]initWithAppId:@"1105649935"andDelegate:self];
    //设置需要的权限列表
    permissions= [NSArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo",@"add_t",nil];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goback:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//忘记密码
- (IBAction)forgetPassword:(id)sender {
    HyFindPasswordViewController *HyFindPassword = [[HyFindPasswordViewController alloc]init];
    [self.navigationController pushViewController:HyFindPassword animated:YES];
}

//登陆
- (IBAction)join:(id)sender {
//    if ([self.PhoneNumberTextInput.text  isEqual: @"a"]||[self.passwordTextInput.text  isEqual:@"a"]) {
//        [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
//        HyHomeViewController *home = [[HyHomeViewController alloc]init];
//        [self.navigationController pushViewController:home animated:YES];
//    }else{
//        [SVProgressHUD showErrorWithStatus:@"登录失败"];
////        [SVProgressHUD showWithStatus:@"加载中.."];
////        [SVProgressHUD dismiss];
//    }
    
    HyLoginParam *param = [[HyLoginParam alloc]init];
    param.username = self.PhoneNumberTextInput.text;
    param.password = self.passwordTextInput.text;

    [HyLoginHttpTool postForLoginWithParameter:param success:^(HyLoginResult *result) {
        if (result.success) {
            NSLog(@"%@",result);
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            [self.navigationController popViewControllerAnimated:YES];

        }
        
        

    } failure:^(NSError *error) {
         NSLog(@"%@",error);
        [SVProgressHUD showSuccessWithStatus:@"登录失败"];

    }];
    
}


//注册
- (IBAction)newPerson:(id)sender {
    HySignViewController *HySign = [[HySignViewController alloc]init];
    [self.navigationController pushViewController:HySign animated:YES];
}

//其他方式登陆
- (IBAction)weixinJoin:(id)sender {
    [tencentOAuth authorize:permissions inSafari:NO];
}
- (IBAction)weiboJoin:(id)sender {
}

#pragma mark -- TencentSessionDelegate
//登陆完成调用
- (void)tencentDidLogin
{
        [SVProgressHUD showSuccessWithStatus:@"登录完成"];
    
    if (tencentOAuth.accessToken && 0 != [tencentOAuth.accessToken length])
    {
        //  记录登录用户的OpenID、Token以及过期时间
        [SVProgressHUD showSuccessWithStatus:tencentOAuth.accessToken];
        tokenLable.text = tencentOAuth.accessToken;
        [tencentOAuth getUserInfo];
    }
    else
    {
        [SVProgressHUD showErrorWithStatus:@"登录不成功 没有获取accesstoken"];
    }
}

//非网络错误导致登录失败：
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    NSLog(@"tencentDidNotLogin");
    if (cancelled)
    {
        resultLable.text = @"用户取消登录";
        
         [SVProgressHUD showErrorWithStatus:@"用户取消登录"];
    }else{
        resultLable.text = @"登录失败";
        [SVProgressHUD showErrorWithStatus:@"登录失败"];
    }
}
// 网络错误导致登录失败：
-(void)tencentDidNotNetWork
{
    NSLog(@"tencentDidNotNetWork");
    resultLable.text = @"无网络连接，请设置网络";
    [SVProgressHUD showErrorWithStatus: @"无网络连接，请设置网络"];

}

-(void)getUserInfoResponse:(APIResponse *)response
{
    NSLog(@"respons:%@",response.jsonResponse);
}

@end
