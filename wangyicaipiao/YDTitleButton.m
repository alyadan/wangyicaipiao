//
//  YDTitleButton.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/20.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDTitleButton.h"
@interface YDTitleButton()
@property(nonatomic,strong)UIFont *titleFont;
@end

@implementation YDTitleButton

-(void)awakeFromNib
{
    _titleFont = [UIFont systemFontOfSize:16];
    self.titleLabel.font = self.titleFont;
    self.imageView.contentMode = UIViewContentModeCenter;
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    NSDictionary *attrs = @{NSFontAttributeName : self.titleFont};
    CGFloat titleW = [self.currentTitle boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(contentRect.size.width * 0.8, 0, contentRect.size.width * 0.2, contentRect.size.height);
}


@end
