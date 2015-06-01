//
//  Html.h
//  wangyicaipiao
//
//  Created by alyadan on 15/5/29.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//
//"title" : "如何充值？",
//"html" : "help.html",
//"id" : "howtorecharge"

#import <Foundation/Foundation.h>

@interface Html : NSObject
@property(nonatomic, copy)NSString* title;
@property(nonatomic, copy)NSString* html;
@property(nonatomic, copy)NSString* ID;

+(instancetype) htmlWithDict:(NSDictionary *)dict;
-(instancetype) initWithDict:(NSDictionary *)dict;
@end
