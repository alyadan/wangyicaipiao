//
//  YDLoggingViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/20.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDLoggingViewController.h"
#import "YDSettingViewController.h"

@interface YDLoggingViewController ()
- (IBAction)setting:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation YDLoggingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *normal = [UIImage imageNamed:@"RedButton"];
    UIImage *high = [UIImage imageNamed:@"RedButtonPress"];
    
    
    
    normal = [normal resizableImageWithCapInsets:UIEdgeInsetsMake(5, 10, 5, 10)];
    high = [high stretchableImageWithLeftCapWidth:high.size.width * 0.5
                                topCapHeight:high.size.height * 0.5];
    [self.loginBtn setBackgroundImage:normal forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:high forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)setting:(UIBarButtonItem *)sender {
    [self.navigationController pushViewController:[[YDSettingViewController alloc] init]animated:YES];
}
@end
