//
//  Product.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/28.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "Product.h"

@implementation Product
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if(self = [super init]){
//        [self setValuesForKeysWithDictionary:dict];
        [self setValue:[dict objectForKey:@"title"] forKey:@"title"];
        [self setValue:[dict objectForKey:@"icon"] forKey:@"icon"];
    }
    return self;
}
+(instancetype)productWithDict:(NSDictionary *)dict
{
    return  [[self alloc] initWithDict:dict];
}

@end
