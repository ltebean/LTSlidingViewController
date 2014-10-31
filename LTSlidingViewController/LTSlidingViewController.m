//
//  LTSlidingContainerViewController.m
//  PageViewControllerTest
//
//  Created by ltebean on 14/10/31.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "LTSlidingViewController.h"
#import "LTSlidingView.h"
#import "LTSlidingViewZoomTransition.h"
#import "LTSlidingViewCoverflowTransition.h"

@interface LTSlidingViewController ()
@property(nonatomic,strong) LTSlidingView* slidingView;

@end

@implementation LTSlidingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(LTSlidingView*) slidingView
{
    if(!_slidingView){
        _slidingView = [[LTSlidingView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
        _slidingView.animator = [[LTSlidingViewCoverflowTransition alloc]init];
        [self.view addSubview:_slidingView];
    }
    return _slidingView;
}



-(void) addChildViewController:(UIViewController *)childController
{
    [self.slidingView addView:childController.view];
    [super addChildViewController:childController];
}



@end
