//
//  MainTableViewCell.h
//  wangyicaipiao
//
//  Created by alyadan on 15/6/1.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDSettingCell.h"
@class YDSettingItem;

@interface MainTableViewCell : YDSettingCell
@property (weak, nonatomic) IBOutlet UIImageView * myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;



-(void)setup:(UIImage *)image text:(NSString *)text;

@end
