//
//  WCTDatabase+AMKConstants.m
//  WCDB-AMKSharedInstance
//
//  Created by 孟昕欣 on 2019/11/11.
//

#import "WCTDatabase+AMKConstants.h"

NSString * const WCTDatabaseErrorDomain = @"com.tencent.wcdb.error";

NSString * WCTStringFromDatabaseErrorCode(WCTDatabaseErrorCode errorCode) {
    NSString *string = nil;
    switch (errorCode) {
        case WCTDatabaseErrorCodeSuccess: string = @"操作成功"; break;
        case WCTDatabaseErrorCodeIllegalParams: string = @"非法参数"; break;
        case WCTDatabaseErrorCodeCanNotOpen: string = @"数据库无法打开"; break;
        case WCTDatabaseErrorCodeIsNotOpened: string = @"数据库未打开"; break;
        case WCTDatabaseErrorCodeTableAlreadyExists: string = @"数据库表已经存在"; break;
        case WCTDatabaseErrorCodeTableCreateFailed: string = @"数据库表创建失败"; break;
        case WCTDatabaseErrorCodeOperationFailed: string = @"数据库操作失败"; break;
        default:string = @"未知错误"; break;
    }
    return string;
}

#pragma mark -

@implementation NSObject (WCTDatabase)

+ (NSString *)amk_wcdbTableName {
    return NSStringFromClass(self);
}

- (NSString *)amk_wcdbTableName {
    return self.class.amk_wcdbTableName;
}

@end
