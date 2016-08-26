//
//  MultipleObservableViewController.m
//  RACDemo
//
//  Created by wangzhaomin on 16/8/23.
//  Copyright © 2016年 FC. All rights reserved.
//

#import "MultipleObservableViewController.h"
#import "PuttingFireRecord.h"
#import "RuntimeTestViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MultipleObservableViewController ()
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) PuttingFireRecord *record;
@property (nonatomic, strong) UITextField *inputField;
@end

@implementation MultipleObservableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];
	
	_record = [[PuttingFireRecord alloc] init];
	_record.serious_1 = @"0123";
	_record.serious_0 = @"0123";
	
	
	_selectButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 40)];
	[_selectButton setTitle:@"点我" forState:UIControlStateNormal];
	[_selectButton setBackgroundColor:[UIColor blueColor]];
	[self.view addSubview:_selectButton];
	
	_inputField = [[UITextField alloc] initWithFrame:CGRectMake(100, 280, 80, 40)];
	_inputField.layer.borderWidth = 0.75f;
	_inputField.layer.borderColor = [UIColor blueColor].CGColor;
	[self.view addSubview:_inputField];
	
	@weakify(self);
	[[_inputField rac_textSignal] subscribeNext:^(id x) {
		@strongify(self)
		self.record.serious_2 = x;
	}];
	
//	[[RACSignal combineLatest:@[[RACObserve(self.record, serious_0) ignore:nil],
//								[RACObserve(self.record, serious_1) ignore:nil],
//								[RACObserve(self.record, serious_2) ignore:nil],
//								[RACObserve(self.record, serious_3) ignore:nil],
//								[RACObserve(self.record, serious_4) ignore:nil],
//								[RACObserve(self.record, serious_5) ignore:nil]]]
//	 flattenMap:^RACStream *(id value) {
//		 NSLog(@"%@", value);
//		 return nil;
//	 }];
	
	RAC(self.record, serious_sum) = [[[RACSignal merge:@[[RACObserve(self.record, serious_0) ignore:nil],
						[RACObserve(self.record, serious_1) ignore:nil],
						[RACObserve(self.record, serious_2) ignore:nil],
						[RACObserve(self.record, serious_3) ignore:nil],
						[RACObserve(self.record, serious_4) ignore:nil],
						[RACObserve(self.record, serious_5) ignore:nil]]]
	 filter:^BOOL(id value) {
		 NSString *inputContent = value;
		 return inputContent.length > 0;
	 }] map:^id(id value) {
		 @strongify(self);
		 NSString *valueString = value;
		 NSNumber *newNumber = [NSNumber numberWithInteger:[valueString integerValue]];
		 NSNumber *oldNumber = [NSNumber numberWithInteger:[self.record.serious_sum integerValue]];
		 NSString *newString = [NSString stringWithFormat:@"%@", @([oldNumber integerValue] + [newNumber integerValue])];
		 return newString;
	 }];
	
	[[RACObserve(self.record, serious_0) ignore:nil] subscribeNext:^(id x) {
		NSLog(@"%@", x);
	}];
	
	[RACObserve(self.record, serious_sum) subscribeNext:^(id x) {
		NSLog(@"%@😂😂😂, merge是可以同时监听多个信号的", x);
	}];
	
	[[_selectButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
		@strongify(self);
		self.record.serious_0 = @"1234";
		[self.navigationController pushViewController:[[RuntimeTestViewController alloc] init] animated:YES];
	}];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
