//
//  UIColor+BMGradient.m
//  BMPrivatePods
//
//  Created by BirdMichael on 2018/9/16.
//

#import "UIColor+BMGradient.h"

@implementation UIColor (BMGradient)

#pragma mark - Gradient Color

+ (UIColor*)bm_gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withRange:(int)range {
    
    return [UIColor bm_gradientFromColor:c1 toColor:c2 direction:BMGradientDirectionVertical withRange:range];
    
}

+ (UIColor*)bm_gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 direction:(BMGradientDirection)direction withRange:(int)range {
    CGSize size = CGSizeMake(1, range);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    switch (direction) {
        case BMGradientDirectionVertical:
            CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
            break;
        case BMGradientDirectionHorizontal:
            CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(size.width, 0), 0);
            break;
            
        default:
            break;
    }
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
