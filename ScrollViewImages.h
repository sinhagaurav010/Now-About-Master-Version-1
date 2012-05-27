//
//  ScrollViewImages.h
//  ACSProduct
//
//  Created by preet dhillon on 16/10/11.
//  Copyright (c) 2011 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol buttonPressed <NSObject>

-(void)selectSubCat:(NSInteger)index;

@end


@interface ScrollViewImages : UIScrollView
{

}


@property(retain)NSMutableArray *arrayButtons;
@property(retain)id<buttonPressed>delegatePress;
-(void)setButtons:(NSMutableArray *)arrayButton;

@end
