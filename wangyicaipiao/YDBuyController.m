//
//  YDBuyController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/4/20.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "YDBuyController.h"

@interface YDBuyController (){
@private
    BOOL isTitleClicked;
    CGFloat X;
   	CGFloat Y;
    CGFloat W;
   	CGFloat H;
}
- (IBAction)titleClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *popView;


@end

@implementation YDBuyController

- (void)viewDidLoad {
    isTitleClicked = 0;
    [super viewDidLoad];
    X = self.popView.frame.origin.x;
   	Y = self.popView.frame.origin.y;
    W = self.popView.frame.size.width;
    H = self.popView.frame.size.height;
    self.popView.frame = CGRectMake(X + W/2, Y, 0, 0);
    // Do any additional setup after loading the view.
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

- (IBAction)titleClick:(UIButton *)sender {
    
    if (!isTitleClicked) {
        [UIView animateWithDuration:0.3 animations:^{
        	sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
		    self.popView.frame = CGRectMake(X, Y, W, H);
        }];
        isTitleClicked = 1;
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            sender.imageView.transform = CGAffineTransformMakeRotation(2*(-M_PI));
            self.popView.frame = CGRectMake(X + W/2, Y, 0, 0);
        }];
        isTitleClicked = 0;
    }
    
    
}
@end
