//
//  NSDictionary+Merge.h
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 08.07.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDictionary (Merge)

+ (NSDictionary *)dictionaryByMerging:(NSDictionary *)dict1 with:(NSDictionary *)dict2;

- (NSDictionary *)dictionaryByMergingWith:(NSDictionary *)dict;

@end
