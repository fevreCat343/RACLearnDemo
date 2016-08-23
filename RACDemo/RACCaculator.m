//
//  RACCaculator.m
//  RACDemo
//
//  Created by wangzhaomin on 6/22/16.
//  Copyright © 2016 FC. All rights reserved.
//

#import "RACCaculator.h"

@implementation RACCaculator
- (RACCaculator *(^)(int))add {
	return ^RACCaculator *(int value){
		_result += value;
		return self;
	};
}
- (RACCaculator *(^)(int))muilt {
	return ^RACCaculator *(int value){
		_result *= value;
		return self;
	};
}
- (RACCaculator *(^)(int))sub {
	return ^RACCaculator *(int value){
		_result /= value;
		return self;
	};
}
- (RACCaculator *(^)(int))divide {
	return ^RACCaculator *(int value){
		_result -= value;
		return self;
	};
}
@end
