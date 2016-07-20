//
//  OneViewController.m
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "OneViewController.h"
#import "ImageModel.h"
@interface OneViewController ()<ImageClickDelegate>
{
    NSMutableArray * dataArray;
    
    int page ;
}
@property (nonatomic,strong)UIScrollView * scrollV;
@end

@implementation OneViewController
/**
 使用的是UIScrollView，简单易学。
 
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    page=10;
    dataArray=[ NSMutableArray array];
    self.scrollV =[[ UIScrollView alloc]initWithFrame:self.view.bounds];
    [self .view addSubview:self.scrollV];
    
    
    [self HttpRequestImageFlow];
    
    
    self.scrollV.mj_header=[ MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(HeaderClick)];
    for (UIView * v in  self.scrollV.mj_header.subviews){
        v.tag=10086;
    }
   
    self.scrollV .mj_footer=[ MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(FootClick)];
    for (UIView * v in  self.scrollV.mj_footer.subviews){
        v.tag=10087;
    }

}
-(void)HeaderClick
{
    [self.scrollV .mj_header endRefreshing];
}
-(void)FootClick
{
    [self HttpRequestImageFlow];
    [self.scrollV.mj_footer endRefreshing];
    page++;
    
}
- (void)HttpRequestImageFlow{
    
    [HttpRequest requestWithPage:page completion:^(NSDictionary *jsonDic) {
        for (NSDictionary * dic in jsonDic[@"data"][@"items"]){
            ImageModel * model =[ImageModel imageModelWithDictionary:dic];
            // 剔除空的url
            if(model.picUrl.length>0){
               //  NSLog(@"-*****************-%@",model.picUrl);
               [dataArray addObject:model];
            }
        }
        [self loadImageFlow];
    }];
}
-(void)loadImageFlow
{
    float colHeigth[2]={0.0,0.0};
    for (int i =0;i<dataArray.count;i++ )
    {
        /* *
         根据图片真实的高、宽，图片的宽与屏幕成正比。按比例得出图片的高，保证图片不会变形。
         
         */
        ImageModel * model =dataArray[i];
        float height,width;
        width=(WIDTH-40)/2;
        height=width*[model.height floatValue]/[model.width floatValue];
        int index=colHeigth[0]<=colHeigth[1]?0:1;
        float x = index==0?10:10+width+20;
        float y = colHeigth [index];
        
        ImageClick * img=[[ImageClick alloc]initWithFrame:CGRectMake(x, y, width, height)];
        [img sd_setImageWithURL:[ NSURL URLWithString:model.picUrl] placeholderImage:[UIImage imageNamed:@"rc"]];
        img.tag=i;
        img.delegate=self;
        [  self.scrollV addSubview:img ];
        colHeigth[index]+= height+10;
       // NSLog(@"----%lu-----%@",img.tag,model.picUrl);
}
    float f=colHeigth[0]<=colHeigth[1]?colHeigth[1]:colHeigth[0];
    [self.scrollV setContentSize:CGSizeMake(WIDTH, f)];
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
