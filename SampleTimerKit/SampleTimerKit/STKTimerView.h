//
//  STKTimerView.h
//  SampleTimer
//
//  Created by kitagawa on 2014/07/29.
//  Copyright (c) 2014年 appirits. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@interface STKTimerView : UIView

@property (nonatomic, weak) IBOutlet UILabel *numberLabel;

@property (nonatomic, strong) IBInspectable UIColor *stopColor;
@property (nonatomic, strong) IBInspectable UIColor *activeColor;
@property (nonatomic, assign) IBInspectable NSInteger numberFontSize;

@property (nonatomic, strong) NSTimer *timer;

@end
