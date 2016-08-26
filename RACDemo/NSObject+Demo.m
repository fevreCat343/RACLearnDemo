//
//  NSObject+Demo.m
//  
//
//  Created by wangzhaomin on 16/8/25.
//
//

#import "NSObject+Demo.h"

@implementation NSObject (Demo)
- (id) performSelector: (SEL) selector withObject: (id) p1
			withObject: (id) p2 withObject: (id) p3
{
	NSMethodSignature *sig = [self methodSignatureForSelector:selector];
	if (!sig)
		return nil;
	
	NSInvocation* invo = [NSInvocation invocationWithMethodSignature:sig];
	[invo setTarget:self];
	[invo setSelector:selector];
	[invo setArgument:&p1 atIndex:2];
	[invo setArgument:&p2 atIndex:3];
	[invo setArgument:&p3 atIndex:4];
	[invo invoke];
	if (sig.methodReturnLength) {
		id anObject;
		[invo getReturnValue:&anObject];
		return anObject;
	}
	return nil;
}
@end
