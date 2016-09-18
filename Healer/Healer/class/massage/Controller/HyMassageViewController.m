//
//  HyMassageViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/7.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define rectNavH self.navigationController.navigationBar.frame.size.height

#import "HyMassageViewController.h"
#import "TheYellowView.h"

@interface HyMassageViewController ()<TheYellowViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)UIButton *leftButton;
@property(nonatomic,weak)UIButton *rightButton;
@property(nonatomic,weak)UITableView *tableview;

@end



@implementation HyMassageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"心理按摩院";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self addYellowView];
    [self addTwoBar];
    [self addTableview];
    
    _rightButton.selected = YES;
}

-(void)addYellowView{
    
    
    TheYellowView *yellowview = [[TheYellowView alloc]init];
    yellowview.delegate = self;
    yellowview.frame = CGRectMake(0, rectNavH, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.5);
    yellowview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    [self.view addSubview:yellowview];
}

-(void)addTwoBar{
    
    UIView *TwoItemView = [[UIView alloc]init];
    TwoItemView.frame = CGRectMake(0, rectNavH + ScreenH*0.5, ScreenW, ScreenH*0.08);
    TwoItemView.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn_one = [[UIButton alloc]init];
    btn_one.frame = CGRectMake(0, 0, ScreenW*0.5, ScreenH*0.08);
    [btn_one setImage:[UIImage imageNamed:@"xinliyishenghuise"] forState:UIControlStateNormal];
    [btn_one setImage:[UIImage imageNamed:@"xinliyishengchengse"] forState:UIControlStateHighlighted];
    [btn_one setImage:[UIImage imageNamed:@"xinliyishengchengse"] forState:UIControlStateSelected];
    [btn_one addTarget:self action:@selector(btn_one_OnClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn_two = [[UIButton alloc]init];
    btn_two.frame = CGRectMake(ScreenW*0.5, 0, ScreenW*0.5, ScreenH*0.08);
    [btn_two setImage:[UIImage imageNamed:@"xinllingjitanghuise"] forState:UIControlStateNormal];
    [btn_two setImage:[UIImage imageNamed:@"xinlingjitang"] forState:UIControlStateHighlighted];
    [btn_two setImage:[UIImage imageNamed:@"xinlingjitang"] forState:UIControlStateSelected];
    [btn_two addTarget:self action:@selector(btn_two_OnClick) forControlEvents:UIControlEventTouchUpInside];
    _leftButton = btn_one;
    _rightButton = btn_two;
    
    [TwoItemView addSubview:_leftButton];
    [TwoItemView addSubview:_rightButton];
    
    [self.view addSubview:TwoItemView];
    

}

-(void)addTableview{
    UITableView *tableview = [[UITableView alloc]init];
    tableview.frame = CGRectMake(-ScreenW, rectNavH+ScreenH*0.58, ScreenW, ScreenH*0.42-rectNavH);
    tableview.delegate = self;
    tableview.dataSource = self;
    self.tableview = tableview;
    [self.view addSubview:self.tableview];
}


//Button response event
-(void)btn_one_OnClick{
    _leftButton.selected = YES;
    _rightButton.selected = NO;
    self.tableview.frame = CGRectMake(0, rectNavH+ScreenH*0.58, ScreenW, ScreenH*0.42-rectNavH);
}
-(void)btn_two_OnClick{
    _rightButton.selected = YES;
    _leftButton.selected = NO;
    self.tableview.frame = CGRectMake(-ScreenW, rectNavH+ScreenH*0.58, ScreenW, ScreenH*0.42-rectNavH);

}

//delegate mothod


-(void)btnOnClick:(NSString *)ButtonText Frame:(CGRect)frame{
    NSLog(@"%@----%f",ButtonText,frame.origin.x);
    
}

-(void)didbtnOnClick{
    NSLog(@"确定");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    return cell;
}


@end
