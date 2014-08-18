//
//  STKTimerView.m
//  SampleTimer
//
//  Created by kitagawa on 2014/07/29.
//  Copyright (c) 2014年 appirits. All rights reserved.
//

#import "STKTimerView.h"

static CGFloat kHandLengthMargin = 5.0f; // 円の端と針の隙間

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
//#if TARGET_INTERFACE_BUILDER
    [self.bgColor setFill];
//#endif
    UIRectFill(rect);
    [self drawHand:rect];
    [super drawRect:rect];
    [self.layer addAnimation:[self animate] forKey:nil];
}

- (CABasicAnimation *)animate
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.fromValue = [NSNumber numberWithDouble:0];
    animation.toValue = [NSNumber numberWithDouble:2 * M_PI];
    animation.valueFunction = [CAValueFunction functionWithName:kCAValueFunctionRotateZ];
    animation.duration = 1;
    animation.repeatCount = HUGE_VALF;
    return animation;
}

- (void)drawHand:(CGRect)rect
{
    _handOrigin = CGPointMake(self.bounds.origin.x + (self.bounds.size.width / 2),
                              self.bounds.origin.y + (self.bounds.size.height / 2));
    _handPoint = CGPointMake(_handOrigin.x, self.frame.origin.y + kHandLengthMargin);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3.0);
    CGContextSetStrokeColorWithColor(context, self.handColor.CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, _handOrigin.x, _handOrigin.y);
    CGContextAddLineToPoint(context, _handPoint.x, _handPoint.y);
    CGContextStrokePath(context);
}

@end
