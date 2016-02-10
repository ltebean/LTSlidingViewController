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
    
    self.animator = [LTSlidingViewCoverflowTransition new];
//    self.animator = [LTSlidingViewZoomTransition new];

    UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    UIViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    UIViewController *vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    
    [self addChildViewController:vc1];
    [self addChildViewController:vc2];
    [self addChildViewController:vc3];

}



- (void)didScrollToPage:(NSInteger)page
{
    NSLog(@"did scroll to page:%ld", (long)page);
}


@end
