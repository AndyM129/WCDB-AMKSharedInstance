//
//  WCTDatabase+AMKSharedInstance.m
//  WCDB-AMKSharedInstance
//
//  Created by 孟昕欣 on 2019/11/11.
//

#ifdef __cplusplus
#import "WCTDatabase+AMKSharedInstance.h"

static NSString *kWCTDatabaseFilePath = nil;
static NSString *kWCTDatabasePassword = nil;

@implementation WCTDatabase (AMKSharedInstance)

#pragma mark - Init Methods

#pragma mark - Properties

+ (instancetype)amk_sharedInstance {
    static WCTDatabase *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSAssert(kWCTDatabaseFilePath, @"须先通过 +amk_setupWithFilePath:password: 方法设置数据库文件路径！");
        NSLog(@"Database Path: %@", kWCTDatabaseFilePath);
        
        database = [WCTDatabase.alloc initWithPath:kWCTDatabaseFilePath];
        database.tag = 1;
        if (kWCTDatabasePassword) {
            NSData *password = [kWCTDatabasePassword dataUsingEncoding:NSASCIIStringEncoding];
            [database setCipherKey:password];
        }
        
#       ifdef DEBUG
        // 开启Sql监控
        [WCTStatistics SetGlobalSQLTrace:^(NSString *sql) {
            //NSLog(@"[WCDB SQL] %@", sql); //@ANDY: 临时关闭调试输出
        }];
#       endif
        
    });
    return database;
}


#pragma mark - Public Methods

+ (WCTDatabaseErrorCode)amk_setupWithFileName:(NSString *)fileName password:(NSString *)password {
    if (!fileName || !fileName.length) {
        return WCTDatabaseErrorCodeIllegalParams;
    }
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:fileName];
    return [self.class amk_setupWithFilePath:filePath password:password];
}

+ (WCTDatabaseErrorCode)amk_setupWithFilePath:(NSString *)filePath password:(NSString *)password {
    if (!filePath || !filePath.length) {
        return WCTDatabaseErrorCodeIllegalParams;
    }
    
    kWCTDatabaseFilePath = filePath;
    kWCTDatabasePassword = password;
    return WCTDatabaseErrorCodeSuccess;
}

- (WCTDatabaseErrorCode)amk_createTableAndIndexesWithClass:(Class)cls {
    WCTDatabaseErrorCode errorCode = WCTDatabaseErrorCodeSuccess;
    if (!WCTDatabase.amk_sharedInstance.canOpen) {
        errorCode = WCTDatabaseErrorCodeCanNotOpen;
    } else if (!WCTDatabase.amk_sharedInstance.isOpened) {
        errorCode = WCTDatabaseErrorCodeIsNotOpened;
    } else if (![self createTableAndIndexesOfName:cls.amk_wcdbTableName withClass:cls]) {
        errorCode = WCTDatabaseErrorCodeTableCreateFailed;
    }
    return errorCode;
}

#pragma mark - Private Methods

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Networking

#pragma mark - Helper Methods

@end

#endif
