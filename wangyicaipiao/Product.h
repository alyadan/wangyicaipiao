//
//  Product.h
//  wangyicaipiao
//
//  Created by alyadan on 15/5/28.
//  Copyright (c) 2015年 alyadan. All rights reserved.

//"title": "网易电影票",
//"id": "com.netease.movie",
//"url": "http://itunes.apple.com/app/id583784224?mt=8",
//"icon": "movie@2x.png",
//"customUrl": "movieticket163"/

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *icon;

+(instancetype) productWithDict:(NSDictionary *)dict;
-(instancetype) initWithDict:(NSDictionary *)dict;
@end
