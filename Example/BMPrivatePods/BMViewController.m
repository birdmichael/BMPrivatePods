//
//  BMViewController.m
//  BMPrivatePods
//
//  Created by birdmichael on 09/16/2018.
//  Copyright (c) 2018 birdmichael. All rights reserved.
//

#import "BMViewController.h"
#import "UIButton+BMExtension.h"
#import "BMCFunctionsHeader.h"
#import "BMCommonMacro.h"
#import "BMPrivatePodsHeader.h"


@interface BMViewController (){
    NSMutableArray *_a;
}

@end

@implementation BMViewController

- (void)viewDidLoad
{

    BMWeakify(self);
    
    

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
