//
//  PushNoticeViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/21.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "PushNoticeViewController.h"
#import "TableViewController.h"
#import "YDSettingArrowItem.h"
#import "KaiJiangViewController.h"


@interface PushNoticeViewController ()


@end

@implementation PushNoticeViewController

-(id)init
{
    return [self initWithStyle:UITableViewStylePlain];
}

-(id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStylePlain];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData:self.data];
    
}

-(void) setData:(NSMutableArray *)data
{
    self.identifier = @"pushNotice";
    [self setTitle:@"推送提醒"];
    [self.tableView registerClass:[YDSettingCell class] forCellReuseIdentifier:self.identifier];
    
 
    YDSettingItem *numPush  = [YDSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" desVcClass:[KaiJiangViewController class]];
    YDSettingItem *zhongjiang = [YDSettingArrowItem itemWithIcon:nil title:@"中奖动画" desVcClass:[TableViewController class]];
    YDSettingItem *score = [YDSettingArrowItem itemWithIcon:nil title:@"比分直播提醒" desVcClass:[TableViewController class]];
    YDSettingItem *timeNotice = [YDSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒" desVcClass:[TableViewController class]];
    
    YDSettingGroup *group0 = [[YDSettingGroup alloc] init];
    group0.items = @[numPush, zhongjiang, score, timeNotice];
    [data addObjectsFromArray:@[group0]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
