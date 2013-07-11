//
//  ALCache.m
//  Classified Platform
//
//  Created by Иваненко Дмитрий on 08.07.13.
//  Copyright (c) 2013 Artox Lab. All rights reserved.
//

#import "ALCache.h"
#import <FMDB/FMDatabase.h>


NSString *const DatabaseFileName = @"Cache.sqlite";


@implementation ALCache
{
    FMDatabase *_database;
}

+ (id)sharedInstance
{
    __strong static id sharedObject = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        sharedObject = [[self alloc] init];
        [sharedObject initDatabase];
    });

    return sharedObject;
}

- (void)initDatabase
{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dbPath = [documentsPath stringByAppendingPathComponent:DatabaseFileName];

    self->_database = [FMDatabase databaseWithPath:dbPath];

    [self->_database open];

    [self createTable];
}

- (void)createTable
{
    [self->_database executeUpdate:@"CREATE TABLE IF NOT EXISTS `cache_data` (`name` text primary key, `value` text, `expire_date` integer)"];
}

- (void)setValue:(NSString *)value forName:(NSString *)name withCacheDuration:(NSTimeInterval)secs
{
    NSDate *expireDate = [NSDate dateWithTimeIntervalSinceNow:secs];

    NSDictionary *params = @{
            @"name" : name,
            @"value" : value,
            @"expire_date" : [expireDate timeIntervalSince1970]
    };
    [self->_database executeUpdate:@"INSERT OR REPLACE INTO `cache_data` VALUES (:name, :value, :expire_date)" withParameterDictionary:params];
}

- (NSString *)valueForName:(NSString *)name
{
    NSDictionary *params = @{
            @"name" : name
    };
    FMResultSet *s = [self->_database executeQuery:@"SELECT * FROM `cache_data` WHERE `name` = :name" withParameterDictionary:params];
    while ([s next])
    {
        if ([s intForColumn:@"expire_date"] >= [[NSDate date] timeIntervalSince1970])
        {
            return [s stringForColumn:@"value"];
        }
    }

    return nil;
}

- (void)dealloc
{
    [self->_database close];
}

@end
