//
//  YDSettingItem.h
//  wangyicaipiao
//
//  Created by alyadan on 15/4/21.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDSettingItem : NSObject
typedef void (^settingOption)();
/**
 *  标题
 */
@property(nonatomic, copy)NSString *title;

/**
 * 图标
 */
@property(nonatomic, copy)NSString *icon;

/**
 *  跳转的类
 */
@property(nonatomic, assign)Class desVcClass;

@property(nonatomic, copy)settingOption option;

+(instancetype)itemWithIcon:(NSString*)icon title:(NSString *)title desVcClass:(Class)desVcClass;
@end
