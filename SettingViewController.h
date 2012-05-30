//
//  SettingViewController.h
//  ACSProduct
//
//  Created by preet dhillon on 13/12/11.
//  Copyright (c) 2011 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewPickerTool.h"
#import "ModalController.h"

@interface SettingViewController : UIViewController
{
    IBOutlet UISwitch *switchpostCode;
    
    NSMutableArray *arrayDistanceFilter;
    ViewPickerTool *pickerDis;
}

-(IBAction)switchChangedPost:(id)sender;

-(IBAction)clickForMilesCriteria:(id)sender;

@end
