//
//  WCTDatabase+AMKSharedInstance.h
//  WCDB-AMKSharedInstance
//
//  Created by 孟昕欣 on 2019/11/11.
//

#ifdef __cplusplus
#import <WCDB/WCDB.h>
#import "WCTDatabase+AMKConstants.h"

/// 数据库操作 相关扩展
@interface WCTDatabase (AMKSharedInstance)

/// 数据库操作单例
@property(nonatomic, strong, readonly, class) WCTDatabase *amk_sharedInstance;

/// 调试开关，默认NO
@property(nonatomic, assign) BOOL amk_debugEnable;

/// 初始化数据库配置：数据库文件名、密码
+ (WCTDatabaseErrorCode)amk_setupWithFileName:(NSString *)fileName password:(NSString *)password;

/// 初始化数据库配置：数据库文件路径、密码
+ (WCTDatabaseErrorCode)amk_setupWithFilePath:(NSString *)path password:(NSString *)password;

/// 创建指定类对应的数据库表
- (WCTDatabaseErrorCode)amk_createTableAndIndexesWithClass:(Class)cls;

@end

#endif
