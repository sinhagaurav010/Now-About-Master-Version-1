//
//  SettingViewController.m
//  ACSProduct
//
//  Created by preet dhillon on 13/12/11.
//  Copyright (c) 2011 dhillon. All rights reserved.
//

#import "SettingViewController.h"
     
@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


-(IBAction)clickForMilesCriteria:(id)sender
{
    pickerDis.hidden = NO;
    
}

-(void)pressDoneForSel:(NSString *)stringSel withindex:(NSInteger)indexRow
{
    pickerDis.hidden = YES;
//    radius = [[arrayDistanceFilter objectAtIndex:indexRow ]intValue];
//    if(switchpostCode.on)
        [ModalController saveTheContent:[arrayDistanceFilter objectAtIndex:indexRow ]
                                withKey:RADSAVED];
//    else {
//        [ModalController saveTheContent:@"20000"
//                                withKey:RADSAVED];
//    }
//        
    NSLog(@"----[[arrayDistanceFilter objectAtIndex:indexRow ]intValue]--------%d",[[arrayDistanceFilter objectAtIndex:indexRow ]intValue]);
    //RADSAVEDSAT
}


-(IBAction)switchChangedPost:(id)sender
{
if(switchpostCode.on)
    [ModalController saveTheContent:@"y"
                            withKey:RADSAVEDSAT];
else {
    [ModalController saveTheContent:@"n"
                            withKey:RADSAVEDSAT];
}
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    if([[ModalController  getContforKey:RADSAVEDSAT] isEqualToString:@"y"])
        [switchpostCode setOn:YES];
    
    NSArray *arrayDistance = [NSArray arrayWithObjects:@"0-50",@"0-100",@"0-150",@"0-200",@"0-250", nil];
    arrayDistanceFilter = [[NSMutableArray alloc] initWithArray:[NSArray arrayWithObjects:@"50",@"100",@"150",@"200",@"250", nil]];
    
    NSMutableArray *arrayDis = [[NSMutableArray alloc] initWithArray:arrayDistance];

    
    pickerDis = [[ViewPickerTool alloc] initWithFrame:CGRectMake(0, 0, 320, 194)];
    [self.view addSubview:pickerDis];
    [pickerDis setClient:self];
    pickerDis.hidden = YES;
    [pickerDis addTheElement:arrayDis];
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
