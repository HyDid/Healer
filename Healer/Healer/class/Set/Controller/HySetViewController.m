//
//  HySetViewController.m
//  Healer
//
//  Created by LiHongYu on 16/10/12.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HySetViewController.h"

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
    seTableView.separatorStyle = NO;
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
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];

    cell.backgroundColor = [UIColor whiteColor];
    return cell;
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
