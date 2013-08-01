//
//  UILabel+AutoResize.h
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 01.08.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoResize)

- (void)trimFreeSpace;
- (void)autoResizeForHeight;
- (void)autoResizeForWidth;

@end
