//
//  UIImage+Color.m
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 29.07.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    UIGraphicsBeginImageContext(CGSizeMake(1, 1));
    UIBezierPath *rPath = [UIBezierPath bezierPathWithRect:CGRectMake(0., 0., 1., 1.)];
    [color setFill];
    [rPath fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
