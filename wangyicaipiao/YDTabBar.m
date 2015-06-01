//
//  YDTabBar.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/14.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//
//#define count 5
#import "YDTabBar.h"
#import "YDTabBarButton.h"

@interface YDTabBar()
@property(nonatomic, assign)UIButton *selectedButton;
@end

@implementation YDTabBar

-(void)addTabButtonWithName:(NSString *)name selName:(NSString*)selName
{
    //creat the Button
    YDTabBarButton *button = [YDTabBarButton buttonWithType:UIButtonTypeCustom];
    
    //setting image
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    
    //adding the Button
    [self addSubview:button];
    
    //listing
    [button addTarget:self action:@selector(buttonClick:)
             forControlEvents:UIControlEventTouchDown];
    
    //selecting the first button
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    int count = (int)self.subviews.count;
    for (int i = 0; i < count; i++) {
        YDTabBarButton *button = self.subviews[i];
        CGFloat buttonW = (self.frame.size.width / count);
        CGFloat buttonH = self.frame.size.height;
        CGFloat buttonX = buttonW * i;
        CGFloat buttonY = 0;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = i;
    }
    NSLog(@"layoutSubviews------------%d",count);
}



-(void) buttonClick:(UIButton *) button
{
    if (self.selectedButton == button) {
        return;
    }else if(self.selectedButton == nil){
        self.selectedButton = button;
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    [self.delegate selectedButton: (int)button.tag];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    NSLog(@"drawRect--------");
//}


@end
