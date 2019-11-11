//
//  AMKViewController.m
//  WCDB-AMKSharedInstance
//
//  Created by AndyM129 on 11/11/2019.
//  Copyright (c) 2019 AndyM129. All rights reserved.
//

#import "AMKViewController.h"
#import "AMKUser.h"

@interface AMKViewController ()

@end

@implementation AMKViewController

#pragma mark - Life Circle

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"WCDB-AMKSharedInstance";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 300, 40);
    button.center = self.view.center;
    [button setTitle:@"创建对象 并插入数据库" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

#pragma mark - Properties

#pragma mark - Data & Networking

#pragma mark - Layout Subviews

#pragma mark - Public Methods

#pragma mark - Private Methods

- (void)didClickButton:(id)sender {
    AMKUser *user = [AMKUser.alloc init];
    user.createtime = NSDate.date.timeIntervalSince1970;
    user.uid = [NSString stringWithFormat:@"%.0f", user.createtime*1000];
    BOOL success = [user insertIntoDatabase];
    NSLog(@"插入数据库 %@", success?@"成功":@"失败");
}

#pragma mark - Notifications

#pragma mark - KVO

#pragma mark - Delegate

#pragma mark - Override

#pragma mark - Helper Methods

@end
