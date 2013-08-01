//
//  UILabel+AutoResize.m
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 01.08.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import "UILabel+AutoResize.h"

@implementation UILabel (AutoResize)

- (void)autoResizeForHeight
{
    CGSize textSize = [self.text sizeWithFont:self.font
                            constrainedToSize:CGSizeMake(self.frame.size.width, INT_MAX)
                                lineBreakMode:self.lineBreakMode];
    
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            self.frame.size.width,
                            textSize.height);
    
    [self setNeedsDisplay];
}

- (void)autoResizeForWidth
{
    CGSize textSize = [self.text sizeWithFont:self.font
                            constrainedToSize:CGSizeMake(INT_MAX, self.frame.size.height)
                                lineBreakMode:self.lineBreakMode];
    
    self.frame = CGRectMake(self.frame.origin.x,
                            self.frame.origin.y,
                            textSize.width,
                            self.frame.size.height);
    
    [self setNeedsDisplay];
}

@end
