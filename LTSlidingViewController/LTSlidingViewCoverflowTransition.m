//
//  LTSlidingViewFlipTransition.m
//  LTSlidingViewController
//
//  Created by Yu Cong on 14-10-31.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "LTSlidingViewCoverflowTransition.h"
#define finalAngel 30.0f
#define perspective 1.0/-600
@implementation LTSlidingViewCoverflowTransition

-(void) updateSourceView:(UIView*) sourceView destinationView:(UIView*) destView withPercent:(CGFloat)percent direction:(SlideDirection)direction
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = perspective;
    
    CGFloat angle =  finalAngel * M_PI / 180.0f*percent;
    if(direction == left){
        angle = -angle;
    }
    transform = CATransform3DRotate(transform, angle , 0.0f, 1.0f, 0.0f);
    sourceView.layer.transform = transform;
    
    if(destView){
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = perspective;
        CGFloat angle =  - finalAngel * M_PI / 180.0f * (1-percent);
        if(direction == left){
            angle = -angle;
        }
        transform = CATransform3DRotate(transform, angle , 0.0f, 1.0f, 0.0f);
        destView.layer.transform = transform;
    }
    
}
@end
