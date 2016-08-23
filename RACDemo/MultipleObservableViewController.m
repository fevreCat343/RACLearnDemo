//
//  MultipleObservableViewController.m
//  RACDemo
//
//  Created by wangzhaomin on 16/8/23.
//  Copyright © 2016年 FC. All rights reserved.
//

#import "MultipleObservableViewController.h"
#import "PuttingFireRecord.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MultipleObservableViewController ()
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) PuttingFireRecord *record;
@end

@implementation MultipleObservableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

	
	_record = [[PuttingFireRecord alloc] init];
	_record.serious_1 = @"0123";
	_record.serious_0 = @"0123";
	
	
	_selectButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 40)];
	[_selectButton setTitle:@"点我" forState:UIControlStateNormal];
	[_selectButton setBackgroundColor:[UIColor blueColor]];
	[self.view addSubview:_selectButton];
	
	[[RACSignal combineLatest:@[[RACObserve(self.record, serious_0) ignore:nil],
								[RACObserve(self.record, serious_1) ignore:nil],
								[RACObserve(self.record, serious_2) ignore:nil],
								[RACObserve(self.record, serious_3) ignore:nil],
								[RACObserve(self.record, serious_4) ignore:nil],
								[RACObserve(self.record, serious_5) ignore:nil]]]
	 flattenMap:^RACStream *(id value) {
		 NSLog(@"%@", value);
		 return nil;
	 }];
	
	[[RACObserve(self.record, serious_0) ignore:nil] subscribeNext:^(id x) {
		NSLog(@"%@", x);
	}];
	
	@weakify(self);
	[[_selectButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
		@strongify(self);
		self.record.serious_0 = @"1234";
	}];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
