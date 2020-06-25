//
//  UIColor+CustomColors.h
//  RSSchool_T6
//
//  Created by anthony volkov on 6/24/20.
//  Copyright © 2020 anthony volkov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CustomColors)

+ (UIColor *) colorFromHexCode:(NSString *)hexString;

+ (UIColor *)customBlackColor;      // black <0x101010>
+ (UIColor *)customWhiteColor;      // white <0xFFFFFF>
+ (UIColor *)customRedColor;      // red <0xEE686A>
+ (UIColor *)customBlueColor;      // blue <0x29C2D1>
+ (UIColor *)customGreenColor;      // green <0x34C1A1>
+ (UIColor *)customYellowColor;      // yellow <0xF9CC78>
+ (UIColor *)customYellowHighlightedColor;      // yellowHighlighted <0xFDF4E3>
+ (UIColor *)custombGrayColor;      // gray <0x707070>


@end

NS_ASSUME_NONNULL_END
