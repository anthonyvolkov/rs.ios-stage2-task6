//
//  TriangleView.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "TriangleView.h"
#import "UIColor+CustomColors.h"

@implementation TriangleView

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, self.triangleColor.CGColor);
    
    int sides = 3;
    double size = self.bounds.size.height;
    CGPoint center = CGPointMake(self.bounds.size.height/2, self.bounds.size.width/2);
    
    double radius = size / 2.0;
    double theta = 2.0 * M_PI / sides;
    
    CGContextMoveToPoint(context, center.x, center.y-radius);
    for (NSUInteger k = 1; k < sides; k++) {
        float x = radius * sin(k * theta);
        float y = radius * cos(k * theta);
        CGContextAddLineToPoint(context, center.x + x, center.y - y);
    }
    CGContextClosePath(context);

    CGContextFillPath(context);

}

- (void)animate {
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        [self setTransform:CGAffineTransformRotate(self.transform, M_PI_2)];
    }completion:^(BOOL finished){
        if (finished) {
            [self animate];
        }
    }];
}



//- (void)addNotifications {
//    NSLog(@"start animation again");
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
//}
//
//- (void)applicationWillEnterForeground {
//    [self animate];
//}

@end
