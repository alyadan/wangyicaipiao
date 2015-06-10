//
//  YDSettingCell.h
//  wangyicaipiao
//
//  Created by alyadan on 15/4/21.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YDSettingItem;


@interface YDSettingCell : UITableViewCell{
@protected
    YDSettingItem *_item;
}

@property(nonatomic,strong)YDSettingItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier;

-(void)setupData;

@end
