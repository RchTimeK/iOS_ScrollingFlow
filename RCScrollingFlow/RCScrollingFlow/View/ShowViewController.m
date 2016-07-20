//
//  ShowViewController.m
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/21.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SETNAVIGTIONBAR(@"Show");
    self.view.backgroundColor=[UIColor whiteColor];
    [self setButtonWithNavigationBar];
    UIImageView * image=[[UIImageView alloc]init];
    image.center=CGPointMake(WIDTH/2, HEIGHT/2);
    float heigth=HEIGHT-164;
    float width=[self.model.width floatValue]/[self.model.height floatValue]*heigth;
    image.bounds=CGRectMake(0, 0, width, heigth);
    [image sd_setImageWithURL:[NSURL URLWithString:self.model.picUrl] placeholderImage:[UIImage imageNamed:@"rc"]];
    [self.view addSubview:image];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.hidesBackButton=YES;
}
- (void)setButtonWithNavigationBar
{
    UIButton * leftButton=[ UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame=CGRectMake(0, 0, 30, 30);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    [leftButton addTarget:self action:@selector(backClick) forControlEvents:(UIControlEventTouchUpInside)];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftButton];
}
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
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
