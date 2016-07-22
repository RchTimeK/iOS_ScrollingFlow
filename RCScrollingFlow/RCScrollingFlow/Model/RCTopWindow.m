//
//  RCTopWindow.m
//  RCScrollingFlow
//
//  Created by RongCheng on 16/7/21.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "RCTopWindow.h"

@implementation RCTopWindow
/** 20的状态栏 */
static UIWindow * _window;
+ (void)initialize{
    
    _window=[[UIWindow alloc]init];
    _window.backgroundColor=[UIColor clearColor];
    _window.frame=CGRectMake(0, 0, WIDTH, 20);
    _window.windowLevel=UIWindowLevelAlert;
    [_window addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(windowClick)]];
}
+ (void)show {
    _window.hidden = NO;
}
+ (void)hide {
    _window.hidden = YES;
}
/**
 *  点击
 */
+ (void)windowClick {
    [self searchScrollViewInView:[UIApplication sharedApplication].keyWindow];
}
+ (void)searchScrollViewInView:(UIView *)superView{
    
    for (UIScrollView *subView in superView.subviews) {
        // 如果是scrollView, 滚动最顶部
//        if ([subView isKindOfClass:[UIScrollView class]] && subView.isShowingOnKeyWindow) {
//            CGPoint offset = subView.contentOffset;
//            offset.y = - subView.contentInset.top;
//            [subView setContentOffset:offset animated:YES];
//        }
        // 继续查找子控件
        [self searchScrollViewInView:subView];
    }
}

@end
