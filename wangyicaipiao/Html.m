//
//  Html.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/29.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "Html.h"

@implementation Html

-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init]){
        //        [self setValuesForKeysWithDictionary:dict];
        [self setValue:[dict objectForKey:@"title"] forKey:@"title"];
        [self setValue:[dict objectForKey:@"html"] forKey:@"html"];
        [self setValue:[dict objectForKey:@"id"] forKey:@"ID"];
    }
    return self;
}

+(instancetype)htmlWithDict:(NSDictionary *)dict
{
    return  [[self alloc] initWithDict:dict];
}
@end
