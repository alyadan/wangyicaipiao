//
//  HtmlViewController.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/30.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "HtmlViewController.h"
#import "Html.h"

@interface HtmlViewController ()<UIWebViewDelegate>

@end

@implementation HtmlViewController

-(void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:self.html.title];
    // Do any additional setup after loading the view.
    UIWebView *webView = (UIWebView *)self.view;
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.html.html withExtension:nil];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    
//    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)] ];
   	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(clickBack)];
    webView.delegate = self;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if(self.html.ID){
        NSString *str = [NSString stringWithFormat:@"window.location.href = '#%@'",self.html.ID];
        [webView stringByEvaluatingJavaScriptFromString:str];
    }
}

-(void)clickBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
