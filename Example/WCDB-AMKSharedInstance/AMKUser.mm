//
//  AMKUser.m
//  WCDB-AMKSharedInstance_Example
//
//  Created by 孟昕欣 on 2019/11/11.
//  Copyright © 2019 AndyM129. All rights reserved.
//

#import "AMKUser.h"
#import <WCTDatabase+AMKSharedInstance.h>

@interface AMKUser (_WCDBTableCoding)<WCTTableCoding>
WCDB_PROPERTY(uid)
WCDB_PROPERTY(uname)
WCDB_PROPERTY(createtime)
@end

@implementation AMKUser

#pragma mark - Init Methods

- (void)dealloc {
    
}

- (instancetype)init {
    if (self = [super init]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            WCTDatabaseErrorCode errorCode = [WCTDatabase.amk_sharedInstance amk_createTableAndIndexesWithClass:self.class];
            NSLog(@"创建数据库表 `%@`: %@", self.amk_wcdbTableName, WCTStringFromDatabaseErrorCode(errorCode));
        });
    }
    return self;
}

#pragma mark - Properties
WCDB_IMPLEMENTATION(AMKUser)
WCDB_SYNTHESIZE(AMKUser, uid)
WCDB_SYNTHESIZE(AMKUser, uname)
WCDB_SYNTHESIZE(AMKUser, createtime)
WCDB_NOT_NULL(AMKUser, uid)
WCDB_PRIMARY(AMKUser, uid)

#pragma mark - Public Methods

- (BOOL)insertIntoDatabase {
    return [WCTDatabase.amk_sharedInstance insertObject:self into:self.amk_wcdbTableName];
}

#pragma mark - Private Methods

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Networking

#pragma mark - Helper Methods

@end
