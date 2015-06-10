//
//  YDBaseViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/1.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDBaseViewController.h"
#import "YDSettingItem.h"
#import "PushNoticeViewController.h"
#import "YDSettingGroup.h"
#import "YDSettingCell.h"




@interface YDBaseViewController ()



@end

@implementation YDBaseViewController

-(id)init
{
  
    return [super initWithStyle:UITableViewStyleGrouped];
}

//-(id)initWithStyle:(UITableViewStyle)style
//{
//    return [super initWithStyle:UITableViewStyleGrouped];
//}

-(NSArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
        
    }
    return _data;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.data[section] items] count];
    
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YDSettingCell *cell = [YDSettingCell cellWithTableView:tableView indexPath:indexPath identifier:self.identifier ];
    YDSettingGroup *group = self.data[indexPath.section];
    YDSettingItem *item = group.items[indexPath.row];
 
    cell.item = item;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YDSettingGroup *group = self.data[indexPath.section];
    YDSettingItem *item = group.items[indexPath.row];
    if (item.desVcClass == nil && item.option == nil) {
        return;
    }else if(item.option){
        item.option();
       	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }else{
        UIViewController *vc = [[item.desVcClass alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    YDSettingGroup *group = self.data[section];
    return group.header;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    YDSettingGroup *group = self.data[section];
    return group.footer;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

