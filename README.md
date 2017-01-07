# 活动指示器可以分别显示在屏幕的顶部 、最顶部、 中部、顶部等四个位置。移除指示器支持回调
#使用pod指令添加类库到项目中:
```
  pod 'EBTActivityIndicatorView'
```

#显示指示器方法:
 顶部:
 [EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionTop withContent:@"顶部活动指示器测试"];
 
 最顶部:
 [EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionTopMost withContent:@"最顶部活动指示器测试"];

中间:
[EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionMiddle withContent:@"中间活动指示器测试"];

底部:
  [EBTActivityIndicatorView showActivityIndicatorView:EBTActivityIndicatorViewPositionBottom withContent:@"底部活动指示器测试"];
  
#移除指示器
 [EBTActivityIndicatorView dismissActivityIndicatorView:^{
        
        NSLog(@"移除指示器");
    }];





#演示效果图
![Image](https://github.com/KBvsMJ/EBTActivityViewDemo-/blob/master/demogif/1.gif)
