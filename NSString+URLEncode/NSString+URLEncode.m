//
//  NSString+URLEncode.m
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 31.07.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

- (NSString *)encode
{
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *) [self UTF8String];
    int sourceLen = strlen((const char *) source);
    for (int i = 0; i < sourceLen; ++i)
    {
        const unsigned char thisChar = source[i];
        if (thisChar == ' ')
        {
            [output appendString:@"+"];
        }
        else if (thisChar == '/')
        {
            [output appendString:@"%252F"];
        }
        else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                 (thisChar >= 'a' && thisChar <= 'z') ||
                 (thisChar >= 'A' && thisChar <= 'Z') ||
                 (thisChar >= '0' && thisChar <= '9'))
        {
            [output appendFormat:@"%c", thisChar];
        }
        else
        {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

@end
