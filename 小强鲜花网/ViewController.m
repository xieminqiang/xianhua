//
//  ViewController.m
//  小强鲜花网
//
//  Created by 谢明强 on 16/5/18.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController





- (void)viewDidLoad {
        [super viewDidLoad];
        self.webView.delegate= self;
        NSURL *url = [NSURL URLWithString:@"http://www.xianhua.com.cn/m/?u=318719"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];

    }
- (void)webViewDidStartLoad:(UIWebView *)webView {


    [SVProgressHUD showWithStatus:@"正在加载中，请稍后。。。"];

    // Do something useful in the background and update the HUD periodically.
    NSString *str = @"var h1 = document.getElementsByTagName('h1')[0];""h1.innerHTML='小强哥哥鲜花网';";

    [self.webView stringByEvaluatingJavaScriptFromString:str];

    NSString *str1 =@"document.getElementById('footer').remove();";

    [self.webView stringByEvaluatingJavaScriptFromString:str1];

    }
-(void)webViewDidFinishLoad:(UIWebView *)webView {

    [SVProgressHUD dismiss];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [SVProgressHUD showErrorWithStatus:@"网络错误，请重新加载。。。"];
}

- (BOOL)prefersStatusBarHidden{

    return YES;
}

@end
