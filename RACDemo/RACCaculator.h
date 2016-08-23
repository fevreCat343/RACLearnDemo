//
//  RACCaculator.h
//  RACDemo
//
//  Created by wangzhaomin on 6/22/16.
//  Copyright © 2016 FC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RACCaculator : NSObject
@property (nonatomic, assign) int result;


- (RACCaculator *(^)(int))add;
- (RACCaculator *(^)(int))sub;
- (RACCaculator *(^)(int))muilt;
- (RACCaculator *(^)(int))divide;
@end
