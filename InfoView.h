//
//  InfoView.h
//  ACSProduct
//
//  Created by preet dhillon on 07/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "ModalController.h"
#import "EGOImageView.h"
@protocol infoViewDelagate <NSObject>

-(void)openEmail:(NSString *)string;

@end
@interface InfoView : UIView<UITableViewDelegate,UITableViewDataSource>
{
    
    
}

-(void)setAllImage:(NSArray *)arrayImages;

@property(retain)id<infoViewDelagate>delagate;

@property(retain)NSArray *arraySecTitle;
-(void)setContentInView:(NSMutableDictionary *)dict;

@property(retain)NSMutableDictionary *dictInfo;
@property(retain) IBOutlet UIScrollView *scrollImage;
@property(retain) IBOutlet UITableView *tableDesc;
@property(retain) IBOutlet UILabel *lableCost;
@property(retain) IBOutlet UILabel *lableDistance;
@end
