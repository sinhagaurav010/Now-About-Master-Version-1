//
//  DealView.m
//  ACSProduct
//
//  Created by Rohit Dhawan on 14/05/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "DealView.h"

@implementation DealView

@synthesize webOfferView;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setview:(NSString *)string
{
        
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    CGColorRef topColor = [[UIColor colorWithRed:((float)252)/256 green:((float)248)/256 blue:((float)249)/256 alpha:1.0] CGColor];
    CGColorRef bottomColor = [[UIColor colorWithRed:((float)195)/256 green:((float)195)/256 blue:((float)195)/256 alpha:1.0] CGColor];
    gradient.colors = [NSArray arrayWithObjects:(id)topColor, (id)bottomColor, nil];
    
    
    
    [self.layer insertSublayer:gradient atIndex:0];

    
    [webOfferView loadHTMLString:string
                         baseURL:nil];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
