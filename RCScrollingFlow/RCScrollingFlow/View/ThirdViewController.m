//
//  ThirdViewController.m
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "ThirdViewController.h"
#import "ImageModel.h"

@interface ThirdViewController ()<ImageClickDelegate>
{
    NSMutableArray * dataArray;
    UIScrollView * scrollV;
    int page ;
}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    page=1;
    dataArray=[ NSMutableArray array];
    scrollV =[[ UIScrollView alloc]initWithFrame:self.view.bounds];
    [self .view addSubview:scrollV];
    
    
    [self HttpRequestImageFlow];
    
    
    scrollV.mj_header=[ MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(HeaderClick)];
    scrollV .mj_footer=[ MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(FootClick)];

}
-(void)HeaderClick
{
    [scrollV .mj_header endRefreshing];
}
-(void)FootClick
{
    [self HttpRequestImageFlow];
    
    [ scrollV.mj_footer endRefreshing];
    page++;
    
}
- (void)HttpRequestImageFlow{
    
    [HttpRequest requestWithPage:page completion:^(NSDictionary *jsonDic) {
        for (NSDictionary * dic in jsonDic[@"data"][@"items"]){
            ImageModel * model =[ImageModel imageModelWithDictionary:dic];
            if(model.picUrl.length>0){
                [dataArray addObject:model];
            }

        }
        [self loadImageFlow];
    }];
}
-(void)loadImageFlow
{
   
    float colHeigth[4]={0.0,0.0,0.0,0.0};
    for (int i =0;i<dataArray.count;i++)
    {
        ImageModel * model =dataArray[i];
        float height,width;
        width=(WIDTH-40)/4;
        height=width*[model.height floatValue]/[model.width floatValue];
        
        int index;
        if (colHeigth[0]<=colHeigth[1] &&colHeigth[0]<=colHeigth[2] )
        {
            index=0;
        }
        else if (colHeigth[1]<=colHeigth[2])
        {
            index =1;
        }else if (colHeigth[2]<=colHeigth[3])
        {
            index =2;
        }
        else{
            index=3;
        }
        float x ;
        if (index==0)
        {
            x=5;
        }else if (index==1)
        {
            x=width+15;
        }else if (index==2)
        {
            x=width*2+25;
        }
        else
        {
            x=width*3+35;
        }
        float y =colHeigth[index];
        ImageClick * img=[[ImageClick alloc]initWithFrame:CGRectMake(x, y, width, height)];
        [img sd_setImageWithURL:[ NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"rc"]];
        img.tag=i;
        img.delegate=self;
        [  scrollV addSubview:img ];
        colHeigth[index]+= height+10;
    }
    float f ;
    
    if (colHeigth[0]<=colHeigth[1] &&colHeigth[1]<=colHeigth[2] )
    {
        f=colHeigth[2];
    }
    else if (colHeigth[0]<=colHeigth[1])
    {
        f=colHeigth[1];
    }
    else{
        f=colHeigth[0];
    }
    [ scrollV setContentSize:CGSizeMake(WIDTH, f)];
    
}
- (void)ImageClick:(ImageClick*)imgC{
    ShowViewController * show=[[ShowViewController alloc]init];
    ImageModel * model =dataArray[imgC.tag];
    show.model=model;
    [self.navigationController pushViewController:show animated:YES];
    
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
