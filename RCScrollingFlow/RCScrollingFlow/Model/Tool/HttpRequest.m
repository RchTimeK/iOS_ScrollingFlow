

//
//  HttpRequest.m
//  RCScrollingFlow
//
//  Created by RongCheng on 16/6/20.
//  Copyright © 2016年 RongCheng. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest
+ (void)requestWithPage:(int)page completion:(void (^)(NSDictionary *))complete{
    NSString * url = [NSString stringWithFormat:@"http://api2.hichao.com/stars?category=全部&page=%d",page] ;
    NSString *new = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    
    AFHTTPSessionManager * session=[AFHTTPSessionManager manager];
    session.responseSerializer=[AFHTTPResponseSerializer serializer];
    [session GET: new parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if(complete){
            complete(dict);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       NSLog(@"---error---%@",error);
    }];

    
}
@end
