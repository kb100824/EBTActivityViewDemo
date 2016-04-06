//
//  ViewController.m
//  EBTActivityViewDemo
//
//  Created by ebaotong on 16/4/6.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import "ViewController.h"
#import "EBTActivityIndicatorView.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
    
    
    
}
- (IBAction)btnTopClick:(UIButton *)sender {
    
    [EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionTop withContent:@"顶部活动指示器测试"];
    
}
- (IBAction)topMosClick:(id)sender {
     [EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionTopMost withContent:@"最顶部活动指示器测试"];
}


- (IBAction)middleBtnClick:(UIButton *)sender {

 [EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionMiddle withContent:@"中间活动指示器测试"];
}


- (IBAction)bottomClick:(UIButton *)sender {
     [EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionBottom withContent:@"底部活动指示器测试"];
}



- (IBAction)btnRemoveClick:(UIButton *)sender {
    
    
    [EBTActivityIndicatorView dismissActivityIndicatorView:^{
        
        NSLog(@"移除");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
