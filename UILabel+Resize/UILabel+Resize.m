//
//  UILabel+Resize.m
//
//  Created by Dmitry Ivanenko on 01/25/14.
//  Copyright (c) 2014 Artox Lab. All rights reserved.
//

#import "UILabel+Resize.h"

@implementation UILabel (Resize)

- (void)resizeVertical
{
    CGFloat width = self.frame.size.width;
    
    [self sizeToFit];
    
    CGSize expectedSize = [self textRectForBounds:self.frame limitedToNumberOfLines:self.numberOfLines].size;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, expectedSize.height);
}


- (void)resizeHorizontal
{
    CGFloat height = self.frame.size.height;
    
    [self sizeToFit];
    
    CGSize expectedSize = [self textRectForBounds:self.frame limitedToNumberOfLines:self.numberOfLines].size;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, expectedSize.width, height);
}

@end
