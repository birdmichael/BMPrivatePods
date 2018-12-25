//
//  BMViewController.m
//  BMPrivatePods
//
//  Created by birdmichael on 09/16/2018.
//  Copyright (c) 2018 birdmichael. All rights reserved.
//

#import "BMViewController.h"
#import "BMCommonMacro.h"


@interface BMViewController (){
    NSMutableArray *_a;
}

@end

@implementation BMViewController

- (void)viewDidLoad
{

    
    

    [super viewDidLoad];

    BOOL isx = BM_IS_IPHONEX_All;
    NSLog(@"%@",BM_IS_IPHONEX_ALL);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
