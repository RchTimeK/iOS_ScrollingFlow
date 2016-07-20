//
//  ImageClick
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "ImageClick.h"

@implementation ImageClick
- (instancetype)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame]){
        self.userInteractionEnabled=YES;
    }
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if  ([self.delegate respondsToSelector:@selector(ImageClick:)]){
        [self.delegate ImageClick:self];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
