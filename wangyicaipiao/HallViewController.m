//
//  HallViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/6/10.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "HallViewController.h"
#import "YDSettingArrowItem.h"
#import "PushNoticeViewController.h"
#import "TableViewController.h"

@implementation HallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData:self.data];
   
}

-(void)setData:(NSMutableArray *)data
{
   	self.identifier = @"hall";
    
    UINib *xib = [UINib nibWithNibName:@"MainTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:xib forCellReuseIdentifier:self.identifier];
    
    YDSettingArrowItem *pushNotice = [YDSettingArrowItem itemWithIcon:@"LoginScreen" title:@"大乐透" desVcClass:[TableViewController class]];
    YDSettingArrowItem *ball  = [YDSettingArrowItem itemWithIcon:@"LoginScreen" title:@"双色球" desVcClass:[TableViewController class]];
   	YDSettingGroup *group0  = [[YDSettingGroup alloc] init];
    group0.items = @[pushNotice,ball];
    
    [data addObjectsFromArray:@[group0]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}


@end
