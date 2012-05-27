//
//  UIBarButtonItem+Extension.m
//  ACSProduct
//
//  Created by Rohit Dhawan on 14/05/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "Global.h"
@implementation UIBarButtonItem (Extension)


+ (UIBarButtonItem*)barItemWithImage:(UIImage*)image title:(NSString*)title target:(id)target action:(SEL)action
{
    NSLog(@"%s",__PRETTY_FUNCTION__);

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, image.size.width, image.size.height);
    button.titleLabel.textAlignment = UITextAlignmentCenter;
    
    [button setBackgroundImage:[UIImage imageNamed:kiFavNormal] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:kiFavSel] forState:UIControlStateSelected];
    button.selected = 0;
//    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    return [barButtonItem autorelease];    
}


@end
