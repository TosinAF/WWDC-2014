//
//  TATransition.m
//  WWDC
//
//  Created by Tosin Afolabi on 14/04/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "TATransition.h"

@implementation TATransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *project = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];

    project.view.alpha = 0.0;

    CGRect frame = containerView.bounds;
    project.view.frame = frame;
    [containerView addSubview:project.view];

    [UIView animateWithDuration:0.8 animations:^{
        project.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}


@end
