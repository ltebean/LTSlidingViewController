# ![LTSlidingViewController](https://raw.githubusercontent.com/ltebean/LTSlidingViewController/master/demo.gif)

## Usage

Make your view controller extend LTSlidingViewController, then add child view controllers by:

```objective-c
UIViewController *vc1 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
UIViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
UIViewController *vc3 = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    
[self addChildViewController:vc1];
[self addChildViewController:vc2];
[self addChildViewController:vc3];

```

See the example for details~ 