//
//  RuntimeTestViewController.m
//  RACDemo
//
//  Created by wangzhaomin on 16/8/25.
//  Copyright © 2016年 FC. All rights reserved.
//

#import "RuntimeTestViewController.h"
#import "SMStudent.h"
#import <objc/message.h>
#import "NSObject+Demo.h"

@interface RuntimeTestViewController ()
@property (nonatomic, strong) NSObject *student;
@end

@implementation RuntimeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	
	_student = [[NSObject alloc] init];
	RMLog(@"%@", _student);
	SEL studentMethod = NSSelectorFromString(@"initWithTitle:Names:Frame:");
//	_student = [[SMStudent alloc] performSelector:studentMethod withObject:@"nihao" withObject:@[@123] withObject:nil];
//	_student = [[SMStudent alloc] performSelector:studentMethod withObject:@"nihao" withObject:@[@123]];
//	_student = (((id, SEL, NSString*, NSArray*))objc_msgSend)(_student, @selector(initWithTitle:Names:Frame:), @"nihao", @[@123]);
//	RMLog(@"%@", _student);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	RMLog(@"%@", self);
}

@end
