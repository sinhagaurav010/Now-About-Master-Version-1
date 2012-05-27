//
//  ListViewController.h
//  ACSProduct
//
//  Created by gaurav on 09/10/11.
//  Copyright 2011 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListCell.h"
#import "Global.h"
#import "MultipleDownload.h"
#import "DetailsViewController.h"
#import "ModalController.h"
#import "UserLocationFinder.h"
#import "CustomTableCell.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "MBProgressHUD.h"
#import "ScrollViewImages.h"
#import <QuartzCore/QuartzCore.h>
#import "XMLReader.h"
#import "EGORefreshTableHeaderView.h"
@interface ListViewController : UIViewController<ASIHTTPRequestDelegate,buttonPressed,EGORefreshTableHeaderDelegate> {
    IBOutlet UITableView *tableList;
    EGORefreshTableHeaderView *_refreshHeaderView;

    NSMutableArray *arrayList;
    NSMutableArray *arrayImages;
    BOOL kmsel;
    BOOL _reloading;

}

- (void)doneLoadingTableViewData;
-(void)dataFromServer;

@property(retain)IBOutlet ScrollViewImages *scrllSubCat;
@property(nonatomic,retain)    MultipleDownload   *downloads;
@property(nonatomic,retain)    NSMutableArray   *urls;
@property(retain)NSString *stringCat;
@property(retain)NSString *stringCatInd;

@property(retain)NSString *stringSub;
@property(retain)NSString *stringTitle;
@property(assign)BOOL isFromHome;
@property(retain)  NSMutableArray *arrayList;
@end
