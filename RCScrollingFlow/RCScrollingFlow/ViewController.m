//
//  ViewController.m
//  RCScrollingFlow
//
//  Created by RongCheng on 16/7/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThirdViewController.h"
#import "RCSegmentView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SETNAVIGTIONBAR(@"当前是两列瀑布流");
    
    OneViewController * One=[[OneViewController alloc]init];
    TwoViewController * Two=[[TwoViewController alloc]init];
    ThirdViewController * Third =[[ThirdViewController alloc]init];
    NSArray *controllers=@[One,Two,Third];
    
    NSArray *titleArray =@[@"两列",@"三列",@"四列"];
    RCSegmentView * rcs=[[RCSegmentView alloc]initWithFrame:CGRectMake(0, 64, WIDTH, HEIGHT) controllers:controllers titleArray:titleArray ParentController:self];
    [self.view addSubview:rcs];
    // 当前选择的视图
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(SelectVCClick:) name:@"SelectVC" object:nil];
    
}
- (void)SelectVCClick:(NSNotification *)not
{
    UIButton * btn=not.object;
    NSString * title=[NSString stringWithFormat:@"%@",@[@"当前是两列瀑布流",@"当前是三列瀑布流",@"当前是四列瀑布流"][btn.tag]];
    SETNAVIGTIONBAR(title);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
