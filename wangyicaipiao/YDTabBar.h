//
//  YDTabBar.h
//  wangyicaipiao
//
//  Created by alyadan on 15/4/14.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YDTabBarDelegate <NSObject>

@optional
-(void) selectedButton:(int) tag;

@end

@interface YDTabBar : UIView
@property(nonatomic, assign)id delegate;
-(void)addTabButtonWithName:(NSString *)name selName:(NSString*)selName;

@end
