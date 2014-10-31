//
//  LTSlideView.m
//  PageViewControllerTest
//
//  Created by ltebean on 14/10/31.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "LTSlidingView.h"
#define zoom 0.88

@interface LTSlidingView()<UIScrollViewDelegate>
@property(nonatomic,strong) NSMutableArray* views;
@property(nonatomic,strong) UIScrollView* scrollView;
@property(nonatomic) CGFloat beginOffset;
@property int currentIndex;

@end

@implementation LTSlidingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

-(void) setup
{
    self.views = [NSMutableArray array];
    

}

-(UIScrollView*) scrollView
{
    if(!_scrollView){
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
        [self addSubview:_scrollView];
        _scrollView.delegate=self;
        _scrollView.pagingEnabled=YES;
    }
    return _scrollView;
}

-(void) addView:(UIView*) view
{
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    
    view.frame = CGRectMake(width*self.views.count, 0, width, height);
    [self.scrollView addSubview:view];
    [self.views addObject:view];
    self.scrollView.contentSize=CGSizeMake(width*self.views.count, height);
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat offset = self.scrollView.contentOffset.x;

    CGFloat percent = MIN(1,fabs((offset - self.beginOffset)/pageWidth));
    
    int nextIndex = (offset - self.beginOffset)>0? self.currentIndex+1 :self.currentIndex-1;
    if(nextIndex>=0 && nextIndex<self.views.count){
        UIView* nextView = self.views[nextIndex];
        CGFloat nextViewZoom = zoom+(1-zoom)*percent;
        nextView.transform=CGAffineTransformMakeScale(nextViewZoom, nextViewZoom);
    }
    
    UIView *currentView = self.views[self.currentIndex];
    CGFloat currentViewZoom =1-(1-zoom)*percent;
    currentView.transform=CGAffineTransformMakeScale(currentViewZoom, currentViewZoom);
   
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.beginOffset = self.scrollView.contentOffset.x;

    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat offset = self.scrollView.contentOffset.x;
    self.currentIndex = floor((offset - pageWidth / self.views.count) / pageWidth) + 1;
    for (int i = 0; i<self.views.count; i++) {
        if(i!=self.currentIndex){
            UIView * view = self.views[i];
            view.transform = CGAffineTransformMakeScale(zoom, zoom);
        }
    }
   
}

@end
