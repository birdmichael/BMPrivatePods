//
//  BMViewController.m
//  BMPrivatePods
//
//  Created by birdmichael on 09/16/2018.
//  Copyright (c) 2018 birdmichael. All rights reserved.
//

#import "BMViewController.h"
#import "UIColor+Modify.h"

@interface BMViewController ()

@end

@implementation BMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIView *v = [UIView new];
    [self.view addSubview:v];
    v.frame = CGRectMake(0, 0, 300, 300);
    UIColor *c = [UIColor redColor];
    
//    v.backgroundColor = [UIColor redColor];
    [UIView animateWithDuration:2 animations:^{
        [c darkenColor:0.1];
        v.backgroundColor = c;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
