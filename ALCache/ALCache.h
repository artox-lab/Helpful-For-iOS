//
//  ALCache.h
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 08.07.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ALCache : NSObject

+ (id)sharedInstance;

- (void)setValue:(NSString *)value forName:(NSString *)name withCacheDuration:(int)cacheDuration;

- (NSString *)valueForName:(NSString *)name;

@end
