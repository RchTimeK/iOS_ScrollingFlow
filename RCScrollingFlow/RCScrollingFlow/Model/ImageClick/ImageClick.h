//
//  ImageClick
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ImageClick;
@protocol ImageClickDelegate <NSObject>
@optional
- (void)ImageClick:(ImageClick*)imgC;
@end


@interface ImageClick : UIImageView
@property (nonatomic,weak) id <ImageClickDelegate> delegate;
@end
