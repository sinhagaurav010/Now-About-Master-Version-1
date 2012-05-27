//
//  DealView.h
//  ACSProduct
//
//  Created by Rohit Dhawan on 14/05/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface DealView : UIView
{
}

@property(retain)    IBOutlet UIWebView *webOfferView;
-(void)setview:(NSString *)string;

@end
