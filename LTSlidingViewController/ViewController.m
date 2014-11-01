//
//  ViewController.m
//  LTSlidingViewController
//
//  Created by ltebean on 14/10/31.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "ViewController.h"
#import "LTSlidingViewCoverflowTransition.h"
#import "LTSlidingViewZoomTransition.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.animator = [[LTSlidingViewCoverflowTransition alloc]init];


    UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    UIViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    UIViewController *vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
