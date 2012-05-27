//
//  InfoView.m
//  ACSProduct
//
//  Created by preet dhillon on 07/04/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView
@synthesize lableDistance,lableCost,tableDesc,delagate,scrollImage,dictInfo,arraySecTitle;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setContentInView:(NSMutableDictionary *)dict
{
    arraySecTitle = [[NSMutableArray alloc] initWithObjects:@"Description",@"Detail", nil];
    self.dictInfo = [[NSMutableDictionary alloc] initWithDictionary:dict];
    self.lableCost = [dict objectForKey:FIELDCOST];
    [self.lableDistance setText:[NSString stringWithFormat:@"%@",[ModalController  calDistancebetWithLat:[locationUser.strUserLat doubleValue] with:[locationUser.strUserLong doubleValue] with:[[dict objectForKey:@"Lat"]doubleValue] with:[[dict  objectForKey:@"Long"]doubleValue]]]];
    
    tableDesc.delegate = self;
    tableDesc.dataSource = self;
    [tableDesc  reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"%d",[self.dictInfo count]);
	// The number of sections is based on the number of items in the data property list.
	return [self.arraySecTitle count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.arraySecTitle objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
    if(section == 0)
	return 1;	
    else
        return 4;
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:12.0];
        CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
       CGSize labelSize = [[self.dictInfo  objectForKey:FIELDDESC] sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        return labelSize.height + 50;
    }
    else
    return 32;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"here");
    if(indexPath.section == 1)
    switch (indexPath.row) {
        case 1:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" 
                                                            message:MAP_VISIT 
                                                           delegate:self 
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"NO",@"YES", nil];
            alert.tag = 1;
            [alert show];
            [alert release];
            break;
        }
        case 3:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" 
                                                            message:DIAL_A_NUMBER 
                                                           delegate:self 
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"NO",@"YES", nil];
            alert.tag = 3;
            [alert show];
            [alert release];
            break;
        }
        case 4:
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info" 
                                                            message:WEBLINK_VISIT 
                                                           delegate:self 
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"NO",@"YES", nil];
            alert.tag = 4;
            [alert show];
            [alert release];
        }
            break;
        case 2:
        {
            [delagate  openEmail:[dictInfo objectForKey:FIELDEMAIL]];
//            [self clickOn:[dictInfo objectForKey:FIELDEMAIL] withMessage:nil];
        }
            break;
            
        default:
            break;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{	
	NSLog(@"cell");
    
	// Retrieve or create a cell
	UITableViewCellStyle style =  UITableViewCellStyleDefault;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell ==  nil)
    {
        NSLog(@"chi");
        
        cell = [[[UITableViewCell alloc] initWithStyle:style reuseIdentifier:@"BaseCell"] autorelease];
        
        if(indexPath.section != 0)
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
        if(indexPath.section == 1)
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = [dictInfo objectForKey:FIELDNAME];
                break;
            case 1:
                cell.textLabel.text = [dictInfo objectForKey:FIELDADD];
                break;
            case 2:
                cell.textLabel.text = [dictInfo objectForKey:FIELDEMAIL];
                break;
            case 3:
                cell.textLabel.text = [dictInfo objectForKey:FIELDPHONE];
                break;
            case 4:
                cell.textLabel.text = [dictInfo objectForKey:FIELDURL];
                break;
            default:
                break;
        }
        else
        {
            cell.textLabel.text = [self.dictInfo  objectForKey:FIELDDESC];
        }
        
    }
    
    
    cell.textLabel.font = [UIFont systemFontOfSize:12];
    //	ListCell *cell = (ListCell *)[tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    //	if (!cell) 
    //	{
    //		cell = [[[NSBundle mainBundle] loadNibNamed:@"ListCell" owner:self options:nil] lastObject];
    //		cell.backgroundColor=[UIColor whiteColor];
    //		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //	}
    //	
    //    
    //    cell.costLabel.text = [NSString stringWithFormat:@"$%@",[[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDCOST]];
    //    cell.venueNameLabel.text = [[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDNAME];
    //    cell.dealLabel.text = [[arrayList objectAtIndex:indexPath.row] objectForKey:FIELDDEAL];
    //    cell.distanceLabel.text = @" ";
    //    
    //    cell.venueImage.image = [(UIImageView*)[arrayImages objectAtIndex:indexPath.row] image];
    return (UITableViewCell *)cell;
	
}

/*
 UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:15.0];
 CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
 labelSize = [self.stringDescSection4 sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
 
 return labelSize.height + 50;
 
 
 
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
