//
//  BMViewController.m
//  BMPrivatePods
//
//  Created by birdmichael on 09/16/2018.
//  Copyright (c) 2018 birdmichael. All rights reserved.
//

#import "BMViewController.h"
#import "BMPrivatePodsHeader.h"
#import "UIButton+BMExtension.h"


@interface BMViewController (){
    NSMutableArray *_a;
}

@end

@implementation BMViewController

- (void)viewDidLoad
{
 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    btn.bm_badgeValue = @"1";;
    [self.view addSubview:btn];
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
