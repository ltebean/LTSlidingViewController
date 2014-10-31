//
//  LTSlideView.m
//  PageViewControllerTest
//
//  Created by ltebean on 14/10/31.
//  Copyright (c) 2014年 ltebean. All rights reserved.
//

#import "LTSlidingView.h"

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
    
    UIView* sourceView =self.views[self.currentIndex];
    UIView* destView;
    
    int nextIndex = (offset - self.beginOffset)>0? self.currentIndex+1 :self.currentIndex-1;
    if(nextIndex>=0 && nextIndex<self.views.count){
        destView = self.views[nextIndex];
    }
    
    SlideDirection direction = (offset - self.beginOffset>0)?right:left;
    if(self.animator){
        [self.animator updateSourceView:sourceView destinationView:destView withPercent:percent direction:direction];
    }
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.beginOffset = self.scrollView.contentOffset.x;

    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat offset = self.scrollView.contentOffset.x;
    self.currentIndex = floor((offset - pageWidth / self.views.count) / pageWidth) + 1;
    
}



@end
