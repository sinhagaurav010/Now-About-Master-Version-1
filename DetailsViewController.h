//
//  DetailsViewController.h
//  ACSProduct
//
//  Created by preet dhillon on 16/10/11.
//  Copyright (c) 2011 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import <QuartzCore/QuartzCore.h>
#import "DealsInfoViewController.h"
#import "ModalController.h"
#import "SlideShowViewController.h"
#import "MapViewController.h"
#import <MessageUI/MessageUI.h>
#import "Facebook.h"
#import "FBLoginButton.h"
#import "MBProgressHUD.h"
#import "JSON.h"
#import "ACSProductAppDelegate.h"
//#import "UIBarButtonItem+Extension.h"
#import "DealView.h"
#import <Accounts/Accounts.h>
#import <Twitter/Twitter.h>
#import "ScrollViewImages.h"
#import "InfoView.h"

@interface DetailsViewController : UIViewController<MFMailComposeViewControllerDelegate,infoViewDelagate,FBSessionDelegate, FBRequestDelegate,FBDialogDelegate,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>
{
    IBOutlet FBLoginButton* _fbButton;

    IBOutlet UIView *viewForWebView;
    IBOutlet UIWebView *webViewInfo;
    NSMutableArray *arrayTableInfo;
    IBOutlet UITableView *tableInfo;
    NSMutableArray *arrayInfo;
    IBOutlet UIButton *buttonFav;
    IBOutlet UIButton *buttonEail;
    IBOutlet UIButton *buttonFaceBook;
    IBOutlet UIButton *buttonTwitter;
    NSArray* _permissions;

}


@property(retain)DealView *dealview;
@property(retain)IBOutlet UIButton *buttonMap;
@property(retain)IBOutlet UIButton *buttonInfo;
@property(retain)IBOutlet UIButton *buttonDeal;

-(IBAction)goTomap:(id)sender;
-(IBAction)goToDeal:(id)sender;
-(IBAction)goToOInfo:(id)sender;


@property(retain)InfoView *infoview;
-(IBAction)goToHome:(id)sender;

@property (retain, nonatomic) Facebook * facebook;

@property (retain, nonatomic) IBOutlet UIScrollView *scrollViewDet;

@property (retain, nonatomic) IBOutlet ScrollViewImages *scrllImages;

-(void)clickOn:(NSString *)stringEmailId withMessage:(NSString *)strMsg;

@property(assign)BOOL isFromFav;
-(IBAction)touchToAddFav:(id)sender;
-(IBAction)ShareFace:(id)sender;
-(void)ShareTwitter;
-(IBAction)EmailToFriend:(id)sender;

-(IBAction)touchForDeal:(id)sender;
-(IBAction)touchForMap:(id)sender;
@property(retain) NSString *stringTitle;
@property(retain) NSMutableDictionary *dictInfo;
@end
