//
//  NSObject+Demo.h
//  
//
//  Created by wangzhaomin on 16/8/25.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (Demo)
- (id) performSelector: (SEL) selector withObject: (id) p1
			withObject: (id) p2 withObject: (id) p3;
@end
