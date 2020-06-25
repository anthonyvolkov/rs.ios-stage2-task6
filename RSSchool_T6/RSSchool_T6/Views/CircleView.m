//
//  CircleView.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (void)animate {
    [UIView animateWithDuration:1 animations:^{
        [self setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    }];
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        [self setTransform:CGAffineTransformMakeScale(0.9, 0.9)];
    }completion:^(BOOL finished){
        if (finished) {
            [self animate];
        }
    }];
}

@end
