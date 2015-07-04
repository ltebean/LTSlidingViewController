![LTSlidingViewController](https://cocoapod-badges.herokuapp.com/v/LTSlidingViewController/badge.png)

## Demo
![LTSlidingViewController](https://raw.githubusercontent.com/ltebean/LTSlidingViewController/master/image/zoom.gif)

![LTSlidingViewController](https://raw.githubusercontent.com/ltebean/LTSlidingViewController/master/image/coverflow.gif)

## Usage

Make your view controller extend LTSlidingViewController, in viewDidLoad:

```objective-c
self.animator = [[LTSlidingViewCoverflowTransition alloc] init]; // set the animator

UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
UIViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
UIViewController *vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    
[self addChildViewController:vc1];
[self addChildViewController:vc2];
[self addChildViewController:vc3];
```

Some useful methods you can call in your subclass controller:

```objective-c
- (void)scrollToPage:(NSInteger)page animated:(BOOL)animated;
- (void)removeAllChildViewControllers;
- (void)didScrollToPage:(NSInteger)page;
@end
```

And you can create custom transition by implementing LTSlidingViewTransition protocal:

```objective-c
@protocol LTSlidingViewTransition <NSObject>
- (void)updateSourceView:(UIView *)sourceView destinationView:(UIView *)destView withProgress:(CGFloat)progress direction:(SlideDirection)direction;
@end
```

See the example for details~ 