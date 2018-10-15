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
#import "BMCFunctionsHeader.h"


@interface BMViewController (){
    NSMutableArray *_a;
}

@end

@implementation BMViewController

- (void)viewDidLoad
{
 
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 30 , 30);
    btn.backgroundColor = [UIColor redColor];
    btn.bm_badgeValue = @"0";
    static NSUInteger text = 0;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        text++;
        btn.bm_badgeValue= BMString(@(text), nil);
    }];
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
