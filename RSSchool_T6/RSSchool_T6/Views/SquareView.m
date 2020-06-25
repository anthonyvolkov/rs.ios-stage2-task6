//
//  SquareView.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "SquareView.h"

@implementation SquareView

- (void)animate {
    [UIView animateWithDuration:1 animations:^{
        self.center = CGPointMake(self.center.x, self.center.y + self.frame.size.width * 0.1);
    }];
    [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        self.center = CGPointMake(self.center.x, self.center.y - self.frame.size.width * 0.1);
    }completion:^(BOOL finished){
        if (finished) {
            [self animate];
        }
    }];
}

@end
