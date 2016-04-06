//
//  EBTActivityIndicatorView.m
//  EBTActivityViewDemo
//
//  Created by ebaotong on 16/4/6.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#define KDisplayTime   5     //活动指示器显示的时间
#import "EBTActivityIndicatorView.h"

@interface EBTActivityIndicatorView ()
{
    UIView *alertView;//弹框view
    UILabel *lblContent;//描述label
}
@end
@implementation EBTActivityIndicatorView
+ (EBTActivityIndicatorView *)shareInstance
{
    static dispatch_once_t onceToken = 0;
    static EBTActivityIndicatorView *indicatorView = nil;
    dispatch_once(&onceToken, ^{
        
        indicatorView = [[EBTActivityIndicatorView alloc]init];
    });
    
    
    return indicatorView;
 

}
- (instancetype)init
{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        self.frame = [UIScreen mainScreen].bounds;
        self.userInteractionEnabled = NO;//关闭交互
    }
    
    return self;

}


+ (void)showActivityIndicatorView:(EBTActivityIndicatorViewPosition)indicatorViewPosition withContent:(NSString *)descriptContent
{
    
    [[EBTActivityIndicatorView shareInstance] showIndicatorView:indicatorViewPosition withContent:descriptContent];
    
    
}
+ (void)dismissActivityIndicatorView:(EBTActivityIndicatorViewRemoveCompleteHandler)completeHandler
{
    [[EBTActivityIndicatorView shareInstance] dismissActivityIndicatorView:completeHandler];
    
}


- (void)showIndicatorView
{
    
    UIWindow *keyWindows = [UIApplication sharedApplication].keyWindow;
    [keyWindows addSubview:self];
    alertView.alpha = 0;
    alertView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    [UIView animateWithDuration:0.3 animations:^{
        alertView.alpha = 1.f;
         alertView.transform = CGAffineTransformMakeScale(1.f, 1.f);
        

        
    }];
    
}
- (void)disMissIndicatorView
{
   
   [UIView animateWithDuration:0.3 animations:^{
       alertView.alpha = 0.f;
       alertView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
       if (removeCompleteHandler)
       {
           removeCompleteHandler();
       }

       
   } completion:^(BOOL finished) {
       
       [self removeFromSuperview];
       
       
       
   }];

}
- (void)dismissActivityIndicatorView:(EBTActivityIndicatorViewRemoveCompleteHandler)completeHandler
{
    removeCompleteHandler = completeHandler;
    [self disMissIndicatorView];
    
    
}

- (void)showIndicatorView:(EBTActivityIndicatorViewPosition)indicatorViewPosition withContent:(NSString *)descriptContent
{

    alertView = [[UIView alloc]init];
    alertView.translatesAutoresizingMaskIntoConstraints = NO;
    alertView.layer.cornerRadius = 5.f;
    alertView.layer.masksToBounds = YES;
    alertView.backgroundColor = [UIColor colorWithWhite:0.004 alpha:1.000];
    alertView.alpha = 0.5;
    [self addSubview:alertView];

    //创建描述label
    lblContent = [[UILabel alloc]init];
    lblContent.text = descriptContent;
    lblContent.textColor = [UIColor whiteColor];
    lblContent.font = [UIFont systemFontOfSize:12.f];
    lblContent.numberOfLines = 0;
    lblContent.textAlignment = NSTextAlignmentCenter;
    lblContent.lineBreakMode = NSLineBreakByCharWrapping;
    lblContent.translatesAutoresizingMaskIntoConstraints = NO;
    [alertView addSubview:lblContent];
    
     NSArray *lbl_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[lblContent]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lblContent)];
     NSArray *lbl_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[lblContent(>=18)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(lblContent)];
    [alertView addConstraints:lbl_H];
    [alertView addConstraints:lbl_V];
    
    
    NSArray * alertView_H = [NSArray array];
    NSArray * alertView_V = [NSArray array];
     CGSize  alertViewSize = [lblContent systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSDictionary *dictionary_Constant = @{
                                  @"height": @(alertViewSize.height+20),
                                  @"width" : @(alertViewSize.width+10),
                                  @"screenWidth":@([UIScreen mainScreen].bounds.size.width),
                                   @"screenHeight":@([UIScreen mainScreen].bounds.size.height),
                                  @"heightMargin":@(fabs([UIScreen mainScreen].bounds.size.height-alertViewSize.height-20)/2.f),
                                  @"widthMargin":@(fabs([UIScreen mainScreen].bounds.size.width-alertViewSize.width-10)/2.f)
                                 };
  
    switch (indicatorViewPosition)
    {
        case EBTActivityIndicatorViewPositionTopMost:
        {
            
            alertView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[alertView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(alertView)];
            
             alertView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-24-[alertView(height)]" options:0 metrics:dictionary_Constant views:NSDictionaryOfVariableBindings(alertView)];
            
            
            
        }
            break;
        
            
        case EBTActivityIndicatorViewPositionTop:
        {
            alertView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-widthMargin-[alertView]-widthMargin-|" options:0 metrics:dictionary_Constant views:NSDictionaryOfVariableBindings(alertView)];
            
            alertView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-74-[alertView(height)]" options:0 metrics:dictionary_Constant views:NSDictionaryOfVariableBindings(alertView)];
            

        }
       
            break;
        
            
        case EBTActivityIndicatorViewPositionBottom:
        {
            
         
            alertView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-widthMargin-[alertView]-widthMargin-|" options:0 metrics:dictionary_Constant views:NSDictionaryOfVariableBindings(alertView)];
           
            alertView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[alertView(height)]-54-|" options:0 metrics:dictionary_Constant views:NSDictionaryOfVariableBindings(alertView)];
        }
            break;
        case EBTActivityIndicatorViewPositionMiddle:
        default:
        {
            
            alertView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-widthMargin-[alertView]-widthMargin-|" options:0 metrics:dictionary_Constant views:NSDictionaryOfVariableBindings(alertView)];
            
            alertView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-heightMargin-[alertView(height)]" options:0 metrics:dictionary_Constant views:NSDictionaryOfVariableBindings(alertView)];
        }
            break;
    }
    
    [self addConstraints:alertView_H];
    [self addConstraints:alertView_V];
    [self showIndicatorView];
    

}
@end
