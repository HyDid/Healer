//
//  HyHomeViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/7.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyHomeViewController.h"
#import "HyFlyViewController.h"
#import "HyMassageViewController.h"

@interface HyHomeViewController ()
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)HyFlyViewController *HyFly;
@property (nonatomic,strong)HyMassageViewController *HyMassage;
@end


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ButtonW 100

@implementation HyHomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"zhuye"]];
    [self HomeButton];
}

//创建首页按钮
-(void)HomeButton{

    for (int i = 0; i<7; i++) {
        UIButton *button = [[UIButton alloc]init];
        

            switch (i) {
                case 0:
                    button.frame = CGRectMake((ScreenW - ButtonW)/2, ScreenH *0.1, ButtonW, ButtonW);
                    break;
                case 1:
                    button.frame = CGRectMake(ScreenW/3-ButtonW/2, ScreenH *0.3, ButtonW, ButtonW);
                    break;
                case 2:
                    button.frame = CGRectMake(ScreenW*2/3-ButtonW/2, ScreenH *0.3, ButtonW, ButtonW);
                    break;
                case 3:
                    button.frame = CGRectMake(ScreenW/3-ButtonW/2, ScreenH *0.5, ButtonW, ButtonW);
                    break;
                case 4:
                    button.frame = CGRectMake(ScreenW*2/3-ButtonW/2, ScreenH *0.5, ButtonW, ButtonW);
                    break;
                case 5:
                    button.frame = CGRectMake(ScreenW/3-ButtonW/2, ScreenH *0.7, ButtonW, ButtonW);
                    break;
                case 6:
                    button.frame = CGRectMake(ScreenW*2/3-ButtonW/2, ScreenH *0.7, ButtonW, ButtonW);
                    break;
                default:
                    break;
            }

        NSArray *ImageArray = @[@"icon",@"my",@"xinshi",@"fly",@"massage",@"yule",@"set"];
        [button setImage:[UIImage imageNamed:ImageArray[i]] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(HomeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.view addSubview:button];
    }
    
    
    
}
-(void)HomeButtonClick:(UIButton *)button{
    
    
    
    switch (button.tag) {
        case 0:

            break;
        case 1:

            break;
        case 2:

            break;
        case 3:
            self.HyFly =[[HyFlyViewController alloc]init];
            [self.navigationController pushViewController:self.HyFly animated:YES];
            
            break;
        case 4:
            self.HyMassage =[[HyMassageViewController alloc]init];
            [self.navigationController pushViewController:self.HyMassage animated:YES];
            
            break;
            
        default:
            break;
    }


    

            

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
