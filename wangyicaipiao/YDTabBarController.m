//
//  YDTabBarController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/14.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDTabBarController.h"
#import "YDTabBar.h"

@interface YDTabBarController ()<YDTabBarDelegate>

@end

@implementation YDTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // replace the tabBar
   	YDTabBar *myTabBar = [[YDTabBar alloc] initWithFrame:[self.tabBar bounds]];
    [self.tabBar addSubview:myTabBar];
    myTabBar.delegate = self;
    
    // adding the TabBarButton
    for (int i = 0; i < self.viewControllers.count; i++) {
        NSString *name = [NSString stringWithFormat:@"TabBar%d", i + 1];
        NSString *selName= [NSString stringWithFormat:@"TabBar%dSel", i + 1];
        [myTabBar addTabButtonWithName:(NSString *)name selName:(NSString*)selName];
    }
    NSLog(@"viewDidLoad------------");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectedButton:(int)tag
{
    self.selectedIndex = tag;
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
