//
//  KaiJiangViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/28.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "KaiJiangViewController.h"
#import "YDSettingSwitchItem.h"

@interface KaiJiangViewController ()

@end

@implementation KaiJiangViewController

//-(id)init
//{
//    return [self initWithStyle:UITableViewStylePlain];
//}
//
//-(id)initWithStyle:(UITableViewStyle)style
//{
//    return [super initWithStyle:UITableViewStylePlain];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData:self.data];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(void)setData:(NSMutableArray *)data
{
    self.identifier = @"kaijiang";
	self.title = @"开奖号码推送";
    [self.tableView registerClass:[YDSettingCell class] forCellReuseIdentifier:self.identifier];
    
    YDSettingItem *ball = [YDSettingSwitchItem itemWithIcon:nil title:@"双色球" desVcClass:nil];
    YDSettingItem *daletou = [YDSettingSwitchItem itemWithIcon:nil title:@"大乐透" desVcClass:nil];
    
    YDSettingGroup *group0 = [[YDSettingGroup alloc] init];
    
    group0.header = @"打开设置即可在开奖后立即收到推送消息，获得开奖号码";
    group0.items = @[ball, daletou];
    
    [data addObjectsFromArray:@[group0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
