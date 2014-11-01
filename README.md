![LTSlidingViewController](https://raw.githubusercontent.com/ltebean/LTSlidingViewController/master/demo/zoom.gif)

![LTSlidingViewController](https://raw.githubusercontent.com/ltebean/LTSlidingViewController/master/demo/coverflow.gif)

## Usage

Make your view controller extend LTSlidingViewController, in viewDidLoad:

```objective-c
self.animator = [[LTSlidingViewCoverflowTransition alloc]init]; // set the animator

UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
UIViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
UIViewController *vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    
[self addChildViewController:vc1];
[self addChildViewController:vc2];
[self addChildViewController:vc3];
```

And you can create custom transition by implementing LTSlidingViewTransition protocal:

```objective-c
@protocol LTSlidingViewTransition <NSObject>
-(void) updateSourceView:(UIView*) sourceView destinationView:(UIView*) destView withPercent:(CGFloat)percent direction:(SlideDirection)direction;
@end
```

See the example for details~ 