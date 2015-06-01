//
//  LuckyViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/31.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "LuckyViewController.h"
#import "TurnTableView.h"

@interface LuckyViewController ()

@property (weak, nonatomic) IBOutlet UIButton *midBtn;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation LuckyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.leftBtn setImage:[UIImage imageNamed: @"LuckyLeftPressed"] forState:UIControlStateHighlighted];
    [self.midBtn setImage:[UIImage imageNamed: @"LuckyMidPressed"] forState:UIControlStateHighlighted];
    [self.rightBtn setImage:[UIImage imageNamed: @"LuckyRightPressed"] forState:UIControlStateHighlighted];
   	TurnTableView *turnTable = [TurnTableView turnTableView];
    turnTable.center =	self.view.center;
    [self.view addSubview:turnTable];
    [turnTable startRotating];
    
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
