//
//  SplashScreenViewController.m
//  ACSProduct
//
//  Created by gaurav on 07/10/11.
//  Copyright 2011 dhillon. All rights reserved.
//

#import "SplashScreenViewController.h"


@implementation SplashScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    radius = 50;
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController pushViewController:tabBarController
                                         animated:YES];

    // [self.navigationController pushViewController:tabBarController
    //                   animated:YES];
    
    //isInternetConnect = 0;
    
   
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)fromLocalDataBase:(id)sender
{
    NSString *filePath	= [[NSBundle mainBundle]pathForResource:@"ACSData" ofType:@"xml"];
	NSString *fileContents= [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"filecontents=%@",fileContents);
	NSData  *comicVideoXmlfileData= [fileContents dataUsingEncoding:NSUTF8StringEncoding];
    
    [self parseData:comicVideoXmlfileData];
}

-(IBAction)fromServer:(id)sender
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Loading...";
    
    
    modal = [[ModalController alloc] init];
    modal.delegate = self;
    [modal sendTheRequestWithPostString:nil withURLString:URLDATA];
}


-(void)parseData:(NSData*)dataXML
{
    NSDictionary *_xmlDictionaryData = [[XMLReader dictionaryForXMLData:dataXML error:nil] retain];
    NSLog(@"%@",_xmlDictionaryData);
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    
    if([[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"])
    {
        if([[[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"] isKindOfClass:[NSArray class]])
            arrayAllData = [[NSMutableArray alloc] initWithArray:[[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"]];
        
        else
        {
            arrayAllData = [[NSMutableArray alloc] init];
            [arrayAllData addObject:[[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"]];
        }
    }
    
    [self.navigationController pushViewController:tabBarController
                                         animated:YES];
    arrayNearBy = [[NSMutableArray alloc] init];
    
    for(int i=0;i<[arrayAllData  count];i++)
    {
        if((int)[ModalController  calDistancebetWithLat:[locationUser.strUserLat doubleValue] with:[locationUser.strUserLong doubleValue] with:[[[arrayAllData objectAtIndex:i ]objectForKey:@"Lat"]doubleValue] with:[[[arrayAllData objectAtIndex:i ]objectForKey:@"Long"]doubleValue]]<50)
        {
            [arrayNearBy addObject:[arrayAllData objectAtIndex:i]];
        }
    }

}
-(void)getdata
{
    [self parseData:modal.dataXml];
}

-(void)getError
{
    //isInternetConnect = 1;
    
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    
   
    [ModalController showTheAlertWithMsg:@"Error" 
                               withTitle:@"Error in Network"
                            inController:self];
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
