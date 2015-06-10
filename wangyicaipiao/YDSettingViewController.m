//
//  YDSettingViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/20.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDSettingViewController.h"
#import "YDSettingArrowItem.h"
#import "YDSettingSwitchItem.h"
#import "TableViewController.h"
#import "ProductViewController.h"
#import "HelpViewController.h"


@interface YDSettingViewController ()



@end

@implementation YDSettingViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData:self.data];
   
}

-(void) setData:(NSMutableArray *)data
{
    self.identifier = @"setting";
    
    
    [self setTitle:@"设置"];
    [self.tableView registerClass:[YDSettingCell class] forCellReuseIdentifier:self.identifier];
    
    
    YDSettingArrowItem * pushNotice = [YDSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" desVcClass:[PushNoticeViewController class]];
    YDSettingItem* handShake = [YDSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选" desVcClass:nil];
    YDSettingItem * soundEffect  = [YDSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果" desVcClass: nil];
    
    YDSettingGroup *group0 = [[YDSettingGroup alloc] init];
    group0.items = @[pushNotice, handShake, soundEffect];
          //1组
    YDSettingItem * updata = [YDSettingItem itemWithIcon:@"MoreUpdate" title:@"检查新版本" desVcClass: nil];
//        _webView = [[UIWebView alloc] init];
    updata.option = ^(){
		NSLog(@"it's the option's effect!");
//            NSURL *url = [NSURL URLWithString:@"tel://18242320775"];
////            [[UIApplication sharedApplication] openURL:url];
//            [_webView loadRequest:[NSURLRequest requestWithURL:url]];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"test" message:@"it's a alert" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
    };
    YDSettingArrowItem *help = [YDSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" desVcClass:[  HelpViewController class]];
    YDSettingArrowItem *share = [YDSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" desVcClass:[TableViewController class]];
    YDSettingArrowItem *message = [YDSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息" desVcClass:[TableViewController class]];
    YDSettingArrowItem *netease = [YDSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" desVcClass:[ProductViewController class]];
    YDSettingArrowItem *about = [YDSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于" desVcClass:[TableViewController class]];
    YDSettingGroup *group1 = [[YDSettingGroup alloc] init];
    group1.items = @[updata, help, share, message, netease, about];
    
    [data addObjectsFromArray:@[group0,group1]];
    
}








@end
