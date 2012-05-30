//
//  ListViewController.m
//  ACSProduct
//
//  Created by gaurav on 09/10/11.
//  Copyright 2011 dhillon. All rights reserved.
//

/*
 PUB   PUBS NULL 1
 DISC  DISCO NULL 1
 MONU  MONUMENT NULL 1
 ART   ART & CULTURE NULL 1
 */

/*
 <Lists><List><ListType>Cat</ListType><Type>PUBS </Type><Name>PUBS1</Name><Lat>52.7898100</Lat><Long>-1.5654210</Long><Address>26 Aston Drive, Newhall</Address><Email>Paul.cantrill@acs-ltd.uk.com</Email><Phone>7958548890</Phone><URL>www.acs-ltd.uk.com</URL><Cost>100</Cost><Desc>Where it all happens, the centre of the universe.</Desc><Deal>Offer</Deal><DealDesc>Promotional Offer</DealDesc><DealExpires>2011-11-11T00:00:00</DealExpires><Miles>5.248484479945753e+003</Miles><Image></Image></List>
 
 <ListType>Cat</ListType><Name>PUBS2</Name><Long>-1.5654210</Long><Email>Paul.cantrill@acs-ltd.uk.com</Email><URL>www.acs-ltd.uk.com</URL><Desc>Where it all happens, the centre of the universe.</Desc><DealDesc>Promotional Offer</DealDesc><Miles>5.248484479945753e+003</Miles>
 
 <List><ListType>Cat</ListType><Type>PUBS </Type><Name>PUBS3</Name><Lat>52.7898100</Lat><Long>-1.5654210</Long><Address>26 Aston Drive, Newhall</Address><Email>Paul.cantrill@acs-ltd.uk.com</Email><Phone>7958548890</Phone><URL>www.acs-ltd.uk.com</URL><Cost>100</Cost><Desc>Where it all happens, the centre of the universe.</Desc><Deal>Offer</Deal><DealDesc>Promotional Offer</DealDesc><DealExpires>2011-11-11T00:00:00</DealExpires><Miles>5.248484479945753e+003</Miles><Image></Image></List>
 
 
 
 
 <ListType>Cat</ListType><Name>PUBS4</Name><Long>-1.5654210</Long><Email>Paul.cantrill@acs-ltd.uk.com</Email><URL>www.acs-ltd.uk.com</URL><Desc>Where it all happens, the centre of the universe.</Desc><DealDesc>Promotional Offer</DealDesc><Miles>5.248484479945753e+003</Miles>
 
 <List><ListType>Cat</ListType><Type>PUBS </Type><Name>PUBS5</Name><Lat>52.7898100</Lat><Long>-1.5654210</Long><Address>26 Aston Drive, Newhall</Address><Email>Paul.cantrill@acs-ltd.uk.com</Email><Phone>7958548890</Phone><URL>www.acs-ltd.uk.com</URL><Cost>100</Cost><Desc>Where it all happens, the centre of the universe.</Desc><Deal>Offer</Deal><DealDesc>Promotional Offer</DealDesc><DealExpires>2011-11-11T00:00:00</DealExpires><Miles>5.248484479945753e+003</Miles><Image></Image></List>
 
 </Lists>
 */
#import "ListViewController.h"


@implementation ListViewController
@synthesize arrayList,stringTitle,stringSub,stringCatInd,isFromHome,downloads,urls,stringCat,scrllSubCat;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) didFinishDownload:(NSNumber*)idx {
    //for(int i=0;i<[arrayImages count];i++)
    //{
    NSLog(@"imageget");
    
    UIImageView *viewImage = [arrayImages objectAtIndex:[idx intValue]];
    viewImage.image = [UIImage imageWithData:[downloads dataAtIndex:[idx intValue]]];
    
    
    //}
    //    if([idx intValue]==0)
    //    {
    //    
    //        imageV1.image = [UIImage imageWithData:[downloads dataAtIndex:[idx intValue]]];
    //
    //    }
    //    if([idx intValue]==1)
    //    {
    //        
    //        imageV2.image = [UIImage imageWithData:[downloads dataAtIndex:[idx intValue]]];
    //        
    //    }
    //[arrayAlbums addObject:[[[downloads dataAsStringAtIndex: [idx intValue]] JSONValue]copy]];
	//NSLog(@"%d download: %@", [idx intValue], [downloads dataAsStringAtIndex: [idx intValue]]);
    
}

- (void) didFinishAllDownload {
    [tableList reloadData];
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
-(void)reloadData:(NSNotificationCenter*)notification
{
    [tableList   reloadData];
}
#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated
{
    if(kmsel == 0 && KMselect != 0)
    {
        [tableList reloadData];
        kmsel = 1;
    }
    else if(kmsel == 1 && KMselect !=1 )
    {
        [tableList reloadData];
        kmsel = 0;
    }
}
- (void)viewDidLoad
{
    
    
    tableList.backgroundView = nil;
    tableList.backgroundColor = [UIColor  clearColor];
    
    if (_refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *view = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - tableList.bounds.size.height, self.view.frame.size.width, tableList.bounds.size.height)];
        view.backgroundColor = [UIColor clearColor];
		view.delegate = self;
		[tableList addSubview:view];
		_refreshHeaderView = view;
		[view release];
		
	}

    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:CHANGEMEASUNIT object:nil];
    
    NSMutableArray *arraySub;
    
    
    if([self.stringTitle isEqualToString:@"Dining"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsDINNING];
    
    else if([self.stringTitle isEqualToString:@"Nightlife"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsNIGHTLIFE];
    
    else if([self.stringTitle isEqualToString:@"Beauty and Spa"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsBEATSPA];
    
    else if([self.stringTitle isEqualToString:@"Shopping"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsSHOPPING];
    
    else if([self.stringTitle isEqualToString:@"Arts and Entertainment"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsARTSANDENTER];
    
    else if([self.stringTitle isEqualToString:@"Health and Fitness"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsHealthFitness];
    
    else if([self.stringTitle isEqualToString:@"Accomodation"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsAccomodation];
    
    else if([self.stringTitle isEqualToString:@"Services"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsService];
    
    else if([self.stringTitle isEqualToString:@"Travel"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsTravel];
    
    else if([self.stringTitle isEqualToString:@"Pubs"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsPubs];
    
    else if([self.stringTitle isEqualToString:@"Florists"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsFlorists];
    
    else if([self.stringTitle isEqualToString:@"Clubs and Groups"])
        arraySub = [[NSMutableArray alloc] initWithObjects:KsClubsandGroups];

    
    
    
    
    [scrllSubCat setButtons:arraySub];
    
    scrllSubCat.delegatePress = self;
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor] ];
    
    //    if(self.isFromHome != 1)
    //    {
    //        self.stringTitle = TITTLELIST;
    //        arrayList = [[NSMutableArray alloc] initWithArray:arrayAllData];
    //    }
    //    
    
       
    [self.navigationItem setTitle:stringTitle];
    
    //    self.urls = [[NSMutableArray alloc]init];
    //    arrayImages = [[NSMutableArray alloc] init];
    //    for(int i=0;i<[arrayList count];i++)
    //    {
    //        UIImageView *imageViewList = [[UIImageView alloc] initWithFrame:CGRectMake(0,
    //                                                                                   1,
    //                                                                                   55,
    //                                                                                   43)];
    //        [arrayImages addObject:imageViewList];
    //         [self.urls addObject:[[[[arrayList objectAtIndex:i]objectForKey:FIELDIMAGES]objectForKey:FIELDIMAGE]objectAtIndex:0]];
    //    }
    //    
    
    //    self.downloads = [[MultipleDownload alloc] initWithUrls: urls];
    //    self.downloads.delegate = self;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Loading...";
    
    [self dataFromServer];
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

-(void)dataFromServer
{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:URLDATA]];
    
    if(TESTMODE)
        radius = 7000;
    
    [request setRequestMethod:@"POST"];
    [request setPostValue:locationUser.strUserLat forKey:BASELAT];
    [request setPostValue:locationUser.strUserLong forKey:BASELONG];
    [request setPostValue:[NSString stringWithFormat:@"%d",radius] forKey:BASEDIS];
    [request setPostValue:stringCatInd forKey:BASEIND];
    [request setPostValue:stringCat forKey:BASECAT];
    [request setDelegate:self];
    
    
    [request startAsynchronous];
    

}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    [self doneLoadingTableViewData];

    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
    NSLog(@"I have got data------->>>>>%@",[request responseString]);
    
    NSError *err;
    NSDictionary *_xmlDictionaryData = [[XMLReader dictionaryForXMLData:[request responseData] error:&err] retain];
        
    
    if([[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"])
    {
        if([[[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"] isKindOfClass:[NSArray class]])
            arrayList  = [[NSMutableArray alloc] initWithArray:[[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"]];
        
        else
        {
            arrayList = [[NSMutableArray alloc] init];
            [arrayList addObject:[[_xmlDictionaryData objectForKey:@"Lists"] objectForKey:@"List"]];
        }
    }
    else
    {
        [ModalController showTheAlertWithMsg:[NSString stringWithFormat:@"No Venue Found Within Radius %d",radius]
                                   withTitle:@"Info"
                                inController:self];
    }
    NSLog(@"%@",arrayList);
    
    [tableList reloadData];
}


- (void)requestFailed:(ASIHTTPRequest *)request
{
    [self doneLoadingTableViewData];

    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];

    [ModalController showTheAlertWithMsg:@"Error in network" withTitle:@"Failed" inController:self];        
}


#pragma mark -selectSubCat-

-(void)selectSubCat:(NSInteger)index
{
    NSLog(@"----->>>>>>>>>%d",index);
}

#pragma mark -
#pragma mark - UITableView delegates


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// The number of sections is based on the number of items in the data property list.
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [arrayList count];	
	
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{	
	
	// Retrieve or create a cell
	/*UITableViewCellStyle style =  UITableViewCellStyleDefault;
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BaseCell"];
     if (!cell)
     {
     cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"BaseCell"] autorelease];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     }
	 
	 */
	
    //	ListCell *cell = (ListCell *)[tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    //	if (!cell) 
    //	{
    //        NSLog(@"heres");
    //        //cell = [[ListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ListCell"];
    //		cell = [[[NSBundle mainBundle] loadNibNamed:@"ListCell" owner:self options:nil] lastObject] ;
    //		cell.backgroundColor=[UIColor whiteColor];
    //		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //        
    //        
    //        cell.costLabel.text = [NSString stringWithFormat:@"$%@",[[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDCOST]];
    //        cell.venueNameLabel.text = [[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDNAME];
    //        cell.dealLabel.text = [[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDDEAL];
    //        cell.distanceLabel.text = [NSString stringWithFormat:@"%.3fKm",[ModalController  calDistancebetWithLat:[locationUser.strUserLat doubleValue] with:[locationUser.strUserLong doubleValue] with:[[[arrayList objectAtIndex:indexPath.row ]objectForKey:@"Lat"]doubleValue] with:[[[arrayList objectAtIndex:indexPath.row ]objectForKey:@"Long"]doubleValue]]];
    ////        
    //       cell.imageMain.imageURL = [NSURL URLWithString:[[[[arrayList objectAtIndex:indexPath.row]objectForKey:FIELDIMAGES]objectForKey:FIELDIMAGE]objectAtIndex:0]];
    //	}
    //	
    
//    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    
    CustomTableCell *cell = (CustomTableCell *)[tableView dequeueReusableCellWithIdentifier:@"CustomTableCell"];
	if(cell == nil) 
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = (CustomTableCell *)[nib objectAtIndex:0];
        
        
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = cell.bounds;
        
        CGColorRef topColor = [[UIColor whiteColor] CGColor];
        CGColorRef bottomColor = [[UIColor colorWithRed:0.80 green:.80 blue:.80 alpha:1.0] CGColor];
        gradient.colors = [NSArray arrayWithObjects:(id)topColor, (id)bottomColor, nil];
            
        [cell.layer insertSublayer:gradient atIndex:0];
    }

//    cell.backgroundColor = COLORCELL
	[cell settitle:[[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDNAME]];
    cell.subtitle.text = stringTitle;
    [cell setCostLabelstr:[NSString stringWithFormat:@"£%@",[[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDCOST]]];
    cell.description.text = [NSString stringWithFormat:@"%@",[[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDDESC]];
    
    [cell setDistanceLabelstr:[NSString stringWithFormat:@"%@",[ModalController  calDistancebetWithLat:[locationUser.strUserLat doubleValue] with:[locationUser.strUserLong doubleValue] with:[[[arrayList objectAtIndex:indexPath.row ]objectForKey:@"Lat"]doubleValue] with:[[[arrayList objectAtIndex:indexPath.row ]objectForKey:@"Long"]doubleValue]]]];
    [cell setDealLabelstr:[[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDDEAL]];
    NSLog(@"%@",[NSString stringWithFormat:IMAGEURL,[[arrayList objectAtIndex:indexPath.row]objectForKey:FIELDIMAGE]]);
    [cell setPhotoFromUrl:[NSString stringWithFormat:IMAGEURL,[[arrayList objectAtIndex:indexPath.row]objectForKey:FIELDIMAGE]]];
    
    
    //cell.venueImage.image = [(UIImageView*)[arrayImages objectAtIndex:indexPath.row] image];
    return (UITableViewCell *)cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    DetailsViewController *detailController = [[DetailsViewController    alloc] initWithNibName:@"DetailsViewController_Nw" bundle:nil];
    
    detailController.dictInfo = [[NSMutableDictionary alloc] initWithDictionary:[arrayList objectAtIndex:indexPath.row]];
    detailController.isFromFav = 0;
    [self.navigationController pushViewController:detailController
                                         animated:YES];
    [detailController release];
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:tableList];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{	
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
    
    [self  dataFromServer];
    //	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}

////////Refreshing data code finish here

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
