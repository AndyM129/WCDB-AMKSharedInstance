//
//  WCTDatabase+AMKConstants.h
//  WCDB-AMKSharedInstance
//
//  Created by 孟昕欣 on 2019/11/11.
//

#import <Foundation/Foundation.h>

/// 数据库操作错误码
typedef NS_ENUM(NSInteger, WCTDatabaseErrorCode) {
    WCTDatabaseErrorCodeSuccess = 0,            //!< 成功
    WCTDatabaseErrorCodeIllegalParams = 1000,   //!< 非法参数
    WCTDatabaseErrorCodeCanNotOpen,             //!< 无法打开数据库
    WCTDatabaseErrorCodeIsNotOpened,            //!< 数据库未打开
    WCTDatabaseErrorCodeTableAlreadyExists,     //!< 数据库表已存在
    WCTDatabaseErrorCodeTableCreateFailed,      //!< 数据库表创建失败
    WCTDatabaseErrorCodeOperationFailed,        //!< 数据库操作失败
};

/// 数据库错误：域名
FOUNDATION_EXPORT NSString * const WCTDatabaseErrorDomain;

/// 数据库操作错误码描述
FOUNDATION_EXPORT NSString * WCTStringFromDatabaseErrorCode(WCTDatabaseErrorCode errorCode);

#pragma mark -

/// WCTDatabase相关扩展
@interface NSObject (WCTDatabase)
+ (NSString *)amk_wcdbTableName;    //!< 数据库表名
- (NSString *)amk_wcdbTableName;    //!< 数据库表名
@end
