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
    CGPoint _handOrigin; // 針の中心
    CGPoint _handPoint; // 針の先端
}

@end

@implementation STKTimerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.layer.cornerRadius = rect.size.width / 2;
    self.clipsToBounds = YES;
    
    [self.bgColor setFill];
    UIRectFill(rect);
    
    [super drawRect:rect];
}

- (void)animate
{
    // TODO...
}

- (void)drawHand:(CGRect)rect
{
    // TODO...
}

@end
