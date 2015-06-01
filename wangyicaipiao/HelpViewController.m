//
//  HelpViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/29.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "HelpViewController.h"
#import "YDSettingArrowItem.h"
#include "Html.h"
#include "HtmlViewController.h"
#include "YDNavigationController.h"

@interface HelpViewController ()
@property(nonatomic, strong)NSArray *htmls;

@end

@implementation HelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setData:self.data];
}

-(NSArray *)htmls
{
    if(!_htmls){
        NSMutableArray *HtmlsArray = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        for(NSDictionary* d in array){
            Html *html = [Html htmlWithDict: d];
            [HtmlsArray addObject:html];
        }
        
        _htmls = HtmlsArray;
    }
    
    return _htmls;
}

-(void)setData:(NSMutableArray *)data
{
    self.identifier = @"html";
    
    
    [self setTitle:@"帮助"];
    [self.tableView registerClass:[YDSettingCell class] forCellReuseIdentifier:self.identifier];
    
    
    NSMutableArray *items = [NSMutableArray array];
    for(Html *ht in self.htmls){
    	YDSettingItem * it = [YDSettingArrowItem itemWithIcon:nil title:ht.title desVcClass:nil];
       	[items addObject:it];
    }
    YDSettingGroup *group0 = [[YDSettingGroup alloc] init];
    group0.items = items;
   	[data addObjectsFromArray:@[group0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HtmlViewController *HtmlVC = [[HtmlViewController alloc] init];
    HtmlVC.html = self.htmls[indexPath.item];
   	YDNavigationController* nav = [[YDNavigationController alloc] initWithRootViewController:HtmlVC];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
	    
}

#pragma mark - Navigation

//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    NSLog(@"222");
//}



@end
