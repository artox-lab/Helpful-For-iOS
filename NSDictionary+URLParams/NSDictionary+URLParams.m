//
//  NSDictionary+URLParams.m
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 31.07.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import "NSDictionary+URLParams.h"
#import "NSString+URLEncode.h"

@implementation NSDictionary (URLParams)

- (NSString *)dictionaryToURLParams
{
    NSEnumerator *enumerator = [self keyEnumerator];
    id key;
    NSMutableString *urlParams = [NSMutableString new];
    
    while ((key = [enumerator nextObject]) != nil)
    {
        NSObject *paramValue = self[key];
        
        if ([paramValue isKindOfClass:[NSString class]])
        {
            paramValue = [(NSString *) paramValue encode];
        }
        
        [urlParams appendFormat:@"%@/%@/", key, paramValue];
    }
    
    return urlParams;
}

@end
