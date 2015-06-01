//
//  AstrologyButton.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/31.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "AstrologyButton.h"

@implementation AstrologyButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width - 40)/2, 20, 40, 47);
}

-(void)setHighlighted:(BOOL)highlighted
{
    return;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
