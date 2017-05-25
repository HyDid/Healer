//
//  HyDiaryViewController.m
//  Healer
//
//  Created by LiHongYu on 2016/11/15.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyDiaryViewController.h"

@interface HyDiaryViewController ()
@property(nonatomic,strong)UITextView *customTextView;
@end

@implementation HyDiaryViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    self.navigationItem.title = @"心事日记";
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [self.navigationController.navigationBar setTitleTextAttributes:attrs];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.customTextView resignFirstResponder];
}

-(void)addView{

    //view
    self.view.backgroundColor = [UIColor colorWithRed:216/255.0 green:217/255.0 blue:218/255.0 alpha:1.0];
    
    UIView *customview = [[UIView alloc]init];
    customview.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height/40+60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*39/40);
    customview.backgroundColor = [UIColor colorWithRed:235/255.0 green:236/255.0 blue:237/255.0 alpha:1.0];
    
    //lable
    UILabel *customLable = [[UILabel alloc]init];
    customLable.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    customLable.text = @"1234年05月06日 记";
    customLable.textAlignment = NSTextAlignmentCenter;
    customLable.font = [UIFont systemFontOfSize:13];
    customLable.textColor = [UIColor lightGrayColor];
    
    //textview
    UITextView *customTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*2/3)];
    customTextView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    customTextView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"selfbg"]];

    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 25;// 字体的行间距
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:18],
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName:[UIColor colorWithRed:62/255.0 green:60/255.0 blue:66/255.0 alpha:1.0]
                                 };
    customTextView.attributedText = [[NSAttributedString alloc] initWithString:@"~~记录你的心事" attributes:attributes];
    self.customTextView = customTextView;
    

    
    
    //two button
    UIButton *buttonleft = [[UIButton alloc]initWithFrame:CGRectMake(40, [UIScreen mainScreen].bounds.size.height*3/4, 80, 40)];
    [buttonleft setBackgroundImage:[UIImage imageNamed:@"ed"] forState:UIControlStateNormal];
    [buttonleft addTarget:self action:@selector(buttonleftOnclick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *buttonright = [[UIButton alloc]initWithFrame:CGRectMake( [UIScreen mainScreen].bounds.size.width-120, [UIScreen mainScreen].bounds.size.height*3/4, 80, 40)];
    [buttonright setBackgroundImage:[UIImage imageNamed:@"ing"] forState:UIControlStateNormal];
    [buttonright addTarget:self action:@selector(buttonrightOnclick) forControlEvents:UIControlEventTouchUpInside];
    
    
    [customview addSubview:customTextView];
    [customview addSubview:buttonleft];
    [customview addSubview:buttonright];
    [customview addSubview:customLable];
    [self.view addSubview:customview];
}


-(void)buttonleftOnclick{
    
}
-(void)buttonrightOnclick{
    _customTextView.text = nil;
}

@end
