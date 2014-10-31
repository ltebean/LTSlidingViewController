//
//  LTSlidingViewZoomTransition.m
//  LTSlidingViewController
//
//  Created by Yu Cong on 14-10-31.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "LTSlidingViewZoomTransition.h"
#define zoom  0.88

@implementation LTSlidingViewZoomTransition

-(void) updateSourceView:(UIView*) sourceView destinationView:(UIView*) destView withPercent:(CGFloat)percent
{
    if(destView){
        CGFloat destViewZoom = zoom+(1-zoom)*percent;
        destView.transform=CGAffineTransformMakeScale(destViewZoom, destViewZoom);
    }
    CGFloat sourceViewZoom =1-(1-zoom)*percent;
    sourceView.transform=CGAffineTransformMakeScale(sourceViewZoom, sourceViewZoom);
    
}
@end
