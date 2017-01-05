//
//  EBTActivityIndicatorView.h
//  EBTActivityViewDemo
//
//  Created by ebaotong on 16/4/6.
//  Copyright © 2016年 com.csst. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,EBTActivityIndicatorViewPosition)
{
    
   EBTActivityIndicatorViewPositionTopMost = 0,    //最顶部
   EBTActivityIndicatorViewPositionTop,            //顶部
   EBTActivityIndicatorViewPositionMiddle,       //中间
   EBTActivityIndicatorViewPositionBottom       //底部


};
//类型定义活动指示器移除回调Block
typedef void(^EBTActivityIndicatorViewRemoveCompleteHandler)();

@interface EBTActivityIndicatorView : UIView
{
    EBTActivityIndicatorViewRemoveCompleteHandler removeCompleteHandler;
}
/**
 *  显示活动指示器
 *
 *  @param indicatorViewPosition 指示器要显示的位置
 *  @param descriptContent       描述文本内容
 */
+ (void)showActivityIndicatorView:(EBTActivityIndicatorViewPosition)indicatorViewPosition withContent:(NSString *)descriptContent;
/**
 *  移除活动指示器
 *
 *  @param completeHandler  block进行回调
 */
+ (void)dismissActivityIndicatorView:(EBTActivityIndicatorViewRemoveCompleteHandler)completeHandler;
@end
