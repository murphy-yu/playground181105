//
//  ViewController.m
//  playground181105
//
//  Created by Murphy Yu on 2018/11/4.
//  Copyright © 2018 Murphy Yu. All rights reserved.
//

#import "ViewController.h"


#import "AFHTTPSessionManager+RetryPolicy.h"

//static NSString * const kTestURL = @"http://httpbin.org/get";


static NSString * const kTestURL = @"https://www.baidu.com/s?wd=%ld&rsv_spt=1&rsv_iqid=0xdab71f2e00010912&issp=1&f=3&rsv_bp=0&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=1&rsv_sug3=1&rsv_sug1=1&rsv_sug7=100&rsv_sug2=0&prefixsug=1&rsp=0&inputT=1849&rsv_sug4=1850";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    // App Transport Security will block this request since App transport security settings is not set. You will see how retry logic working in log.
    
    for (int i = 0; i < 1000; i++) {
        [self exampleGETRequest:i];
    }
}


- (void)exampleGETRequest:(NSInteger)cnt {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    manager.retryPolicyLogMessagesEnabled = true;
    NSString *url = [NSString stringWithFormat:kTestURL, (long)cnt] ;
    [manager GET:url
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@"##Success: %@", nil);
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"##Failure: %@", nil);
             
         }
      retryCount:5
   retryInterval:2.0
     progressive:false
fatalStatusCodes:nil];
}


@end
