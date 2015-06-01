//
//  ProductViewCell.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/29.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "ProductViewCell.h"
#import "Product.h"


@interface ProductViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end


@implementation ProductViewCell

//-(Product *)product
//{®
//    if (!_product) {
//        _product = [[Product alloc] init];
//    }
//    return  _product;
//}
-(void)awakeFromNib
{
    self.imageView.layer.cornerRadius = 5;
    self.imageView.clipsToBounds = YES;
}

-(void)setProduct:(Product *)product
{
    _product = product;
    
    NSString *str = [NSMutableString stringWithString:product.icon];
    NSRange rang = [str rangeOfString:@"@"];
    str = [str substringToIndex:rang.location];
    
    self.imageView.image = [UIImage imageNamed:str];
    self.title.text = product.title;

}


@end
