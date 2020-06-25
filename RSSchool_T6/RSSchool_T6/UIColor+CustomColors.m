//
//  UIColor+CustomColors.m
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)


+ (UIColor *) colorFromHexCode:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                        [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                        [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                        [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


+ (UIColor *)customBlackColor {
    return [UIColor colorFromHexCode: @"0x101010"];
}      // black <0x101010>
+ (UIColor *)customWhiteColor {
    return [UIColor colorFromHexCode: @"0xFFFFFF"];
}      // white <0xFFFFFF>
+ (UIColor *)customRedColor {
    return [UIColor colorFromHexCode: @"0xEE686A"];
}      // red <0xEE686A>
+ (UIColor *)customBlueColor {
    return [UIColor colorFromHexCode: @"0x29C2D1"];
}      // blue <0x29C2D1>
+ (UIColor *)customGreenColor {
    return [UIColor colorFromHexCode: @"0x34C1A1"];
}      // green <0x34C1A1>
+ (UIColor *)customYellowColor {
    return [UIColor colorFromHexCode: @"0xF9CC78"];
}      // yellow <0xF9CC78>
+ (UIColor *)customYellowHighlightedColor {
    return [UIColor colorFromHexCode: @"0xFDF4E3"];
}      // yellowHighlighted <0xFDF4E3>
+ (UIColor *)custombGrayColor {
    return [UIColor colorFromHexCode: @"0x707070"];
}      // gray <0x707070>


@end
