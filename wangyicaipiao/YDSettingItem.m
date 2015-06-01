//
//  YDSettingItem.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/21.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDSettingItem.h"

@implementation YDSettingItem

+(instancetype)itemWithIcon:(NSString*)icon title:(NSString *)title desVcClass:(__unsafe_unretained Class)desVcClass
{
//    NSLog(@"%@",self);
    YDSettingItem* item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.desVcClass = desVcClass;
    return item;
    
}

@end
