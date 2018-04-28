//
//  UIView+FGLoading.m
//  FOREXZGApp
//
//  Created by  Anson Ng on 06/06/2017.
//  Copyright © 2017 TestWeb. All rights reserved.
//

#import "UIView+FGLoading.h"
#import <objc/runtime.h>

NSString * const fg_loadingViewString;

@implementation UIView (FGLoading)
- (void)fg_startLoading
{
    UIActivityIndicatorView *loadingView = [self fg_loadingView];
    [loadingView startAnimating];
    loadingView.hidden = NO;
}

- (void)fg_stopLoading
{
    UIActivityIndicatorView *loadingView = [self fg_loadingView];
    [loadingView stopAnimating];
    loadingView.hidden = YES;
}

- (UIActivityIndicatorView *)fg_loadingView
{
    UIActivityIndicatorView *loadingView = objc_getAssociatedObject(self, &fg_loadingViewString);
    if (!loadingView) {
        loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:loadingView];
        loadingView.center = self.center;
        objc_setAssociatedObject(self, &fg_loadingViewString, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return loadingView;
}
@end
