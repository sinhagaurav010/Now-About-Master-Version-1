//
//  FavoritesViewController.m
//  ACSProduct
//
//  Created by gaurav on 09/10/11.
//  Copyright 2011 dhillon. All rights reserved.
//

#import "FavoritesViewController.h"


@implementation FavoritesViewController

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
- (void)viewWillAppear:(BOOL)animated
{
    if(kmsel == 0 && KMselect != 0)
    {
        [tableFav reloadData];
        kmsel = 1;
    }
    else if(kmsel == 1 && KMselect !=1 )
    {
        [tableFav reloadData];
        kmsel = 0;
    }
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    
    
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidAppear:(BOOL)animated
{
if(isSaveToFav == 1)
{
    isSaveToFav = 0;
    arrayFavrites = [[NSMutableArray alloc] initWithArray:[ModalController getContforKey:SAVEFAV]];
    [tableFav reloadData];
}
}

-(void)edit
{
    tableFav.editing = YES;
    self.navigationItem.rightBarButtonItem =BARBUTTON(@"Done", @selector(Done));

}

-(void)Done
{
    tableFav.editing = NO;
    self.navigationItem.rightBarButtonItem =BARBUTTON(@"Edit", @selector(edit));    
}

-(void)reloadData:(NSNotificationCenter*)notification
{
    [tableFav   reloadData];
}
#pragma mark - View lifecycle


- (void)viewDidLoad
{
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData:) name:CHANGEMEASUNIT object:nil];
    
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor] ];

    arrayFavrites = [[NSMutableArray alloc] initWithArray:[ModalController getContforKey:SAVEFAV]];

    if([arrayFavrites count]>0)
    self.navigationItem.rightBarButtonItem =BARBUTTON(@"Edit", @selector(edit));
    
    [self.navigationItem setTitle:TITLEFAV];

    NSLog(@"%@",arrayFavrites);

    //[tableFav reloadData];

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
#pragma mark -
#pragma mark - UITableView delegates

- (void)tableView:(UITableView *)aTableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    [arrayFavrites removeObjectAtIndex:indexPath.row];
    [ModalController    saveTheContent:arrayFavrites withKey:SAVEFAV];
    [tableFav reloadData];
	// delete item
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// The number of sections is based on the number of items in the data property list.
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return [arrayFavrites count];	
	
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
//		cell = [[[NSBundle mainBundle] loadNibNamed:@"ListCell" owner:self options:nil] lastObject];
//		cell.backgroundColor=[UIColor whiteColor];
//		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        
//        cell.costLabel.text = [NSString stringWithFormat:@"$%@",[[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDCOST]];
//        cell.venueNameLabel.text = [[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDNAME];
//        cell.dealLabel.text = [[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDDEAL];
//        cell.distanceLabel.text = [NSString stringWithFormat:@"%@",[ModalController  calDistancebetWithLat:LATSOURCE with:LONGSOURCE with:[[[arrayFavrites objectAtIndex:indexPath.row ]objectForKey:@"Lat"]doubleValue] with:[[[arrayFavrites objectAtIndex:indexPath.row ]objectForKey:@"Long"]doubleValue]]];
//        
//        cell.imageMain.backgroundColor = [UIColor clearColor];
//        cell.imageMain.imageURL = [NSURL URLWithString:[NSString stringWithFormat:IMAGEURL,[[arrayFavrites objectAtIndex:indexPath.row]objectForKey:FIELDIMAGE]]] ;
//	}
//	   
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
	[cell settitle:[[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDNAME]];
    cell.subtitle.text = [[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDTYPE];
    [cell setCostLabelstr:[NSString stringWithFormat:@"£%@",[[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDCOST]]];
    cell.description.text = [NSString stringWithFormat:@"%@",[[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDDESC]];
    
    [cell setDistanceLabelstr:[NSString stringWithFormat:@"%@",[ModalController  calDistancebetWithLat:[locationUser.strUserLat doubleValue] with:[locationUser.strUserLong doubleValue] with:[[[arrayFavrites objectAtIndex:indexPath.row ]objectForKey:@"Lat"]doubleValue] with:[[[arrayFavrites objectAtIndex:indexPath.row ]objectForKey:@"Long"]doubleValue]]]];
    [cell setDealLabelstr:[[arrayFavrites objectAtIndex:indexPath.row] objectForKey:FIELDDEAL]];
    [cell setPhotoFromUrl:[NSString stringWithFormat:IMAGEURL,[[arrayFavrites objectAtIndex:indexPath.row]objectForKey:FIELDIMAGE]]];
    
    
    //cell.venueImage.image = [(UIImageView*)[arrayImages objectAtIndex:indexPath.row] image];
    return (UITableViewCell *)cell;

	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    DetailsViewController *detailController = [[DetailsViewController    alloc] initWithNibName:@"DetailsViewController_Nw" bundle:nil];
    
    detailController.hidesBottomBarWhenPushed = YES;

    detailController.dictInfo = [[NSMutableDictionary alloc] initWithDictionary:[arrayFavrites objectAtIndex:indexPath.row]];
    detailController.isFromFav = 1;
    [self.navigationController pushViewController:detailController
                                         animated:YES];
    [detailController release];
    
    //    NSMutableArray *arrayFilter = [[NSMutableArray alloc] init];
    //    
    //    for(int i=0;i<[arrayAllData count];i++)
    //    {
    //        if([[[arrayAllData objectAtIndex:i]objectForKey:FIELDTYPE] isEqualToString:[[commnArray objectAtIndex:indexPath.row]objectForKey:@"name"]] && [[[arrayAllData objectAtIndex:i]objectForKey:FIELDLISTTYPE] isEqualToString:self.strListType] )
    //        {
    //            [arrayFilter addObject:[arrayAllData objectAtIndex:i]];
    //        }
    //    }
    //    
    //    ListViewController *ListController = [[ListViewController alloc] init];
    //    ListController.arrayFavrites = [[NSMutableArray alloc] initWithArray:arrayFilter];
    //    [self.navigationController pushViewController:ListController animated:YES];
    //    [ListController release];
    //    
    //    NSLog(@"%@",arrayFilter);
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
