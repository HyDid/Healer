//
//  HySetViewController.m
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySetViewController.h"
#import "OneTableViewCell.h"
#import "TwoTableViewCell.h"
#import "ThreeTableViewCell.h"
#import "SVProgressHUD.h"

#import "HyAccountTool.h"

@interface HySetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *SeTableView;

@end

@implementation HySetViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // 设置标题文字颜色
    self.navigationItem.title = @"设置";
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [self.navigationController.navigationBar setTitleTextAttributes:attrs];
    
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"qudingkuang"] forBarMetrics:UIBarMetricsDefault]; // 设置导航栏背景颜色
    
    
    //    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:51.0/255.0 green:143.0/255.0 blue:210.0/255.0 alpha:0.8]; // 其上默认按钮（比如返回按钮）颜色
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    [self addTableView];
    [self.view addSubview:self.SeTableView];
}
-(void)addTableView{
    UITableView *seTableView = [[UITableView alloc]init];
    seTableView.frame = [UIScreen mainScreen].bounds;
    seTableView.delegate = self;
    seTableView.dataSource = self;
    seTableView.bounces = NO;
    seTableView.scrollEnabled = NO;
    seTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.SeTableView = seTableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 30;
    }else if (section == 1){
        return 40;
    }else if (section == 2){
        return 60;
    }else if (section == 3){
        return 300;
    }
    return 0;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        OneTableViewCell *cell = [OneTableViewCell cellWithTableview:self.SeTableView];
        if (indexPath.row == 0) {
            cell.icon.image = [UIImage imageNamed:@"xiaoxitongzhi"];
//            cell.labtext.text = @"消息通知";
            [self setLabel:cell.labtext string:@"消息通知" withLineSpacing:1];
        }else if (indexPath.row == 1){
            cell.icon.image = [UIImage imageNamed:@"yijianfankui"];
//            cell.labtext.text = @"意见反馈";
            [self setLabel:cell.labtext string:@"意见反馈" withLineSpacing:1];
        }else if (indexPath.row == 2){
            cell.icon.image = [UIImage imageNamed:@"tupianjieshou"];
//            cell.labtext.text = @"图片接收";
            [self setLabel:cell.labtext string:@"图片接收" withLineSpacing:1];
            
        }else if (indexPath.row == 3){
            cell.icon.image = [UIImage imageNamed:@"quanxian"];
//            cell.labtext.text = @"权限与隐私";
            [self setLabel:cell.labtext string:@"权限与隐私" withLineSpacing:1];
            
        }else if (indexPath.row == 4){
            cell.icon.image = [UIImage imageNamed:@"huancun"];
//            cell.labtext.text = @"清除系统缓存";
            [self setLabel:cell.labtext string:@"清除系统缓存" withLineSpacing:1];
            
        }
        return cell;
    }else if (indexPath.section == 1){
        TwoTableViewCell *cell = [TwoTableViewCell cellWithTableview:self.SeTableView];
        [self setLabel:cell.labtext string:@"关于Healer" withLineSpacing:1];
        return cell;
        
    }else if (indexPath.section == 2){
        ThreeTableViewCell *cell = [ThreeTableViewCell cellWithTableview:self.SeTableView];
        [self setLabel:cell.labtext string:@"退出登录" withLineSpacing:1];
        cell.labtext.textColor = [UIColor redColor];
        return cell;
        
    }
    

    return [[UITableViewCell alloc]init];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.SeTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            
            [SVProgressHUD showErrorWithStatus:@"近期无消息"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });

        }else if (indexPath.row == 1){
            [SVProgressHUD showErrorWithStatus:@"近期无意见反馈"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }else if (indexPath.row == 2){
            [SVProgressHUD showErrorWithStatus:@"近期无图片接收"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }else if (indexPath.row == 3){
            
        }else if (indexPath.row == 4){
            [SVProgressHUD showWithStatus:@"缓存清理中"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        }
        
    }else if (indexPath.section == 1){
        
        
       NSString *str = @"版本（Healer 1.0）介绍: 1.由app获取并且推送的每日轻松励志小故事。2.“心情纸飞机”中，写下自己的压力，发泄自己的压力，查看未知人群的压力。3.“心理按摩院”中，寻求医师的心理辅导。寻找自我解压的方式方法。";
        
        [SVProgressHUD showInfoWithStatus:str];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
    }else if (indexPath.section == 2){
        
        [SVProgressHUD showSuccessWithStatus:@"退出登录成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        
        [HyAccountTool exit];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }
}

//设置文字
-(void)setLabel:(UILabel *)label string:(NSString *)str withLineSpacing:(CGFloat)space{
    NSMutableAttributedString * mas=[[NSMutableAttributedString alloc]init];
    NSMutableParagraphStyle * style=[NSMutableParagraphStyle new];
    style.alignment=NSTextAlignmentLeft;
//    style.lineSpacing=space;
    style.lineBreakMode = UILineBreakModeTailTruncation;
//    style.paragraphSpacing=space;
    NSDictionary * attributesDict=@{
                                    NSFontAttributeName:[UIFont systemFontOfSize:16],		//label.text字体大小
                                    NSForegroundColorAttributeName:[UIColor colorWithRed:80/255.0f green:80/255.0f blue:80/255.0f alpha:1/1.0f],	//label.textColor 字体颜色
                                    NSParagraphStyleAttributeName:style
                                    };
    NSAttributedString *as=[[NSAttributedString alloc]initWithString:str attributes:attributesDict];
    [mas appendAttributedString:as];
    [label setAttributedText:mas];
     label.numberOfLines = space;
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
