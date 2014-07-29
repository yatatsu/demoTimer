//
//  STKTimerView.m
//  SampleTimer
//
//  Created by kitagawa on 2014/07/29.
//  Copyright (c) 2014年 appirits. All rights reserved.
//

#import "STKTimerView.h"

@interface STKTimerView ()
{
    NSInteger _count;
}

@end

@implementation STKTimerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _count = 10;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect frame = self.bounds;
    CGContextSetLineWidth(context, 10);
    CGRectInset(frame, 5, 5);
    [[UIColor greenColor] set];
    UIRectFrame(frame);
    
    [self setCount];
    [self startTimer];
}

- (void)setCount
{
    self.numberLabel.text = [NSString stringWithFormat:@"%@", @(_count)];
    if (_count == 0) {
        self.numberLabel.textColor = self.stopColor;
    }
}

- (void)startTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerDidFire:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    if ([self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)timerDidFire:(NSTimer *)timer
{
    if (_count > 0) {
        _count--;
        [self setCount];
        [self setNeedsLayout];
    } else {
        [self stopTimer];
    }
}

@end
