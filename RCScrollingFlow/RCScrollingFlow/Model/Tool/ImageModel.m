
//
//  ImageModel.m
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "ImageModel.h"

@implementation ImageModel
-(instancetype)initWithDic:(NSDictionary *)dic{
    if(self=[super init]){
        _height=dic[@"height"];
        _width =dic[@"width"];
        _picUrl = dic[@"component"][@"picUrl"];
    }
    return self;
}
+ (ImageModel*)imageModelWithDictionary:(NSDictionary *)DIC{
    return [[ImageModel alloc]initWithDic:DIC];
}
@end
