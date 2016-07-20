//
//  HttpRequest.h
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject
+ (void)requestWithPage:(int)page completion:(void(^)(NSDictionary * jsonDic))complete;
@end
