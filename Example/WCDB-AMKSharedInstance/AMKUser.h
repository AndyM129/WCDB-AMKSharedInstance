//
//  AMKUser.h
//  WCDB-AMKSharedInstance_Example
//
//  Created by 孟昕欣 on 2019/11/11.
//  Copyright © 2019 AndyM129. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMKUser : NSObject
@property(nonatomic, strong, nullable) NSString *uid;
@property(nonatomic, strong, nullable) NSString *uname;
@property(nonatomic, assign) NSTimeInterval createtime;

/// 插入数据库
- (BOOL)insertIntoDatabase;

@end
