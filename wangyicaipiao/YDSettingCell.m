//
//  YDSettingCell.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/21.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDSettingCell.h"
#import "YDSettingItem.h"
#import "YDSettingSwitchItem.h"
#import "YDSettingArrowItem.h"

@interface YDSettingCell()
@property(nonatomic, strong)UIImageView *cellImageView;
@property(nonatomic, strong)UISwitch *cellSwitch;

@end

@implementation YDSettingCell
@synthesize item = _item;
-(UIImageView *)cellImageView
{
    if (_cellImageView == nil) {
        _cellImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _cellImageView;
}

-(UISwitch *)cellSwitch
{
    if (_cellSwitch== nil) {
        _cellSwitch = [UISwitch new];
        [_cellSwitch addTarget:self action:@selector(switchStateChange) forControlEvents:
         UIControlEventValueChanged];
    }
    return _cellSwitch;
}

-(void)switchStateChange
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:self.cellSwitch.isOn forKey:self.item.title];
    [defaults synchronize];
    
}


-(void)setItem:(YDSettingItem *)item
{
    _item = item;
    [self setupData];
    [self setupRightContent];
}

-(void)setupRightContent
{
    if ([_item isKindOfClass:[YDSettingArrowItem class]]) {
        self.accessoryView = self.cellImageView;
    }else if([_item isKindOfClass:[YDSettingSwitchItem class]]){
        self.accessoryView = self.cellSwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        self.cellSwitch.on = [defaults boolForKey:self.item.title];
    }else{
        self.accessoryView = nil;
    }
}

-(void)setupData
{
    self.textLabel.text = _item.title;
    if(_item.icon)
        self.imageView.image = [UIImage imageNamed:_item.icon];
    
}

+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier
{
    
    
    YDSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

@end
