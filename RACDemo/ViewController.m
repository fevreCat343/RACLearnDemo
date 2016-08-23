//
//  ViewController.m
//  RACDemo
//
//  Created by wangzhaomin on 6/22/16.
//  Copyright © 2016 FC. All rights reserved.
//

#import "ViewController.h"
/**
 屏幕宽高
 */
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width

@interface ViewController ()
@property (nonatomic, strong) UIScrollView *mainScroll;
@property (nonatomic, strong) UIView *paddingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
	
	_mainScroll = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	_mainScroll.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
	[self.view addSubview:_mainScroll];
	
	_paddingView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	_paddingView.backgroundColor = [UIColor colorWithRed:125/255.0 green:234/255.0 blue:221/255.0 alpha:1.0];
	[_mainScroll addSubview:_paddingView];
	
	UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 40)];
	[button addTarget:self action:@selector(changeFrame) forControlEvents:UIControlEventTouchUpInside];
	[button setTitle:@"改变大小" forState:UIControlStateNormal];
	[button setBackgroundColor:[UIColor blueColor]];
	[_paddingView addSubview:button];
	
}

- (void)changeFrame {
	_paddingView.frame = CGRectMake(0, 0, 500, 1000);
	_mainScroll.contentSize = CGSizeMake(500, 1000);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
