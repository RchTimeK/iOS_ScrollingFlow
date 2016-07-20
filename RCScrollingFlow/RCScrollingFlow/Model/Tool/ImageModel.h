//
//  ImageModel.h
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageModel : NSObject
@property (nonatomic,copy)NSString * height,*width,*picUrl;

-(instancetype)initWithDic:( NSDictionary * )dic;
+ (ImageModel*)imageModelWithDictionary:(NSDictionary *)DIC;
@end
