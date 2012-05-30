//
//  Global.h
//  City Guide
//
//  Created by Gaurav Sinha on 27/07/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

//1 cat 0 feat  catInd PUB	
//

/*string Lat = Request.Form["Latitude"].ToString();
string Long = Request.Form["Longitude"].ToString();
string ProximityDistance = Request.Form["Distance"].ToString();
string CategoryId = Request.Form["Category"].ToString().Trim();
string CatInd = Request.Form["CatInd"].ToString().Trim();
 */

#import "UserLocationFinder.h"
//http://sanganan.com/venueimages/pub2.png
#define BASEURL @"http://acsdev.co.uk/"

#define SANGANABACOFFICE @"http://sanganan.com/backofficeservice.aspx"
//#define IMAGEURL @"http://sanganan.com/%@"

#define IMAGEURL @"http://acsdev.co.uk/%@"

#define BASELAT @"Latitude"
#define BASELONG @"Longitude"
#define BASEDIS @"Distance"
#define BASECAT @"Category"
#define BASEIND @"CatInd"


#define TESTING 1
#define TITLEFAV @"Favourites"
#define TITLENEARBY @"NearBy"

#define FIELDADD @"Address"
#define FIELDCOST @"Cost"
#define FIELDDEAL @"Deal"
#define FIELDDEALDES @"DealDesc"
#define FIELDDEALEXP @"DealExpires"
#define FIELDDESC @"Desc"
#define FIELDEMAIL @"Email"
#define FIELDIMAGES @"Images"
#define FIELDIMAGE @"Image"
#define FIELDLISTTYPE @"ListType"
#define FIELDNAME @"Name"
#define FIELDPHONE @"Phone"
#define FIELDTYPE @"Type"
#define FIELDURL @"URL"
#define FIELDLAT @"Lat"
#define FIELDLONG @"Long"

#define TYPECAT @"Cat"
#define TYPEFEAT @"Feat"

#define kiInfonormal @"Info.png"
#define kiInfoSel @"InfoH.png"

#define kiMapnormal @"Map.png"
#define kiMapSel @"MapH.png"

#define kiDealnormal @"Deal.png"
#define kiDealSel @"DealH.png"


#define kiFavNormal @"Add to Favourites.png"
#define kiFavSel @"A Favourite.png"





#define COLORCELL      [UIColor colorWithRed:0.444 green:0.444 blue:0.444 alpha:1.0];


#define TESTMODE 0


#define KsDISPLAYOPTION @"Info", @"Deal",@"Map" ,@"VIPCard",nil

#define KsDINNING @"All", @"CaféandTea",@"English" ,@"Chinese", @"Indian",@"Italian", @"Mexican", @"French", @"Other",nil
#define KsNIGHTLIFE @"BarsandLounges",@"NightClubs",@"Other",nil
#define KsSHOPPING @"Clothes and Accessories",@"Children",@"Food and Wine",@"Home and Décor",@"Other",nil
#define KsBEATSPA @"Tanning",@"Beauty and Skin",@"Hair Salons",@"Nail Salons",@"Spas and Massage",@"Other",nil
#define KsARTSANDENTER @"Live Music",@"Cinemas",@"Theatres",@"Museums",@"Galleries",@"Ticketing",@"Other",nil
#define KsHealthFitness @"Gymnasiums",@"Sports and Clubs",@"Health Clinics",@"Yoga and Dance",@"Other",nil
#define KsAccomodation @"Bed and Breakfast",@"Hotels",@"Boutique Hotel",@"Serviced Apartments",@"Other",nil
#define KsService @"Automobile",@"Building",@"Decorating",@"Other",nil
#define KsTravel @"Taxis",@"Coaches",@"Flights",@"Ferries",@"Other",nil
#define KsPubs @"Gastro Pub",@"Live Sport",@"Live Music",@"Other",nil
#define KsFlorists @"Other",nil
#define KsClubsandGroups @"Other",nil






//fb169613193103512
NSMutableArray *arrayNearBy;

//NSMutableArray *arrayPointsOfMap;

//#define  AppIDAPI @"169613193103512"
//#define  AppSecret @"1e9a80bb2863ebba2b38de5a9751ffb0"
//308790145802337

#define  AppIDAPI @"308790145802337"
#define  AppSecret @"7e6f3e235b183cb2b24b69d414f09616"

#define SAVEFAV @"FavACS"

BOOL isSaveToFav; 

/////Radius for NearBy
#define RADIUS 20000
#define TITTLELIST @"List"
#define HOMETITLE @"Home"

#define CATEGORY_FEED_URL @""
#define TAGFEED_URL @""

#define RADSAVED @"RADSAVED"
#define RADSAVEDSAT @"RADSAVEDSATUS"


#define URLDATA @"http://acsdev.co.uk/BackOfficeService.aspx"

#define IMAGEDATAACS @"imagedata"

#define VENUE_FEED_URL @""
#define IMAGE_GLOBAL_URL @""
#define VENUE_LOGO_GLOBAL_URL @""
#define DELAS_FEED_URL @""

// This file Contains the global values 
#define CATEGORY_TABLE_NAME @"CategoryList"
#define TAG_TABLE_NAME @"TagList"
#define VENUE_LIST_TABLE @"VenueList"
#define DEAL_TABLE @"DealTable"
#define METRO_TABLE @"MetroTable"

#define NAVIGATION_BAR_COLOR [[UIColor alloc] initWithRed:0.40 green:0.42 blue:0.48 alpha:1.0]
#define LATSOURCE 51.502858
#define LONGSOURCE -0.150223
#define WEBLINK_VISIT @"Do you want to leave this application to open this website?"

#define MAP_VISIT @"Do you want to leave this application to open this location in map?"

#define DIAL_A_NUMBER @"Do you want to dial this number ? "
#define KM @"km"


#define BARBUTTON(TITLE, SELECTOR) 	[[[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR] autorelease]
#define SYSBARBUTTON(ITEM, SELECTOR) [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:ITEM target:self action:SELECTOR] autorelease]
BOOL isInternetConnect;

NSInteger radius;
#define MAPTITLE @"Map"

#define MIL @"mil"
#define DISTANCE_METER @"2"
#define FONT [UIFont fontWithName:@"Helvetica"  size:14];

#define CHANGEMEASUNIT @"MEASURINGUNOTCHANGED"

NSMutableArray *arrayAllData;
//////////
BOOL KMselect;

BOOL isChangeInMeasuringUnit;
#define LINKMAPURL @"http://maps.google.com/maps?saddr=%@,%@&daddr=%@,%@"

#define LINKMAPADD @"http://maps.google.com/maps?q=%@"


NSMutableArray *sortingArray;
NSMutableString *listQueryString;

UserLocationFinder *locationUser;

NSString *latString ,*longtString;

NSMutableArray *imageArray;
NSMutableDictionary *imageDictionary;

BOOL isFilterOfMap;

NSMutableDictionary *filterDict;
NSMutableArray *dealsAllData;// Contains deals Tab all data
NSMutableArray *globalZoneArray;

//=============================================
// Global Array that contains all the values from the database
NSMutableArray *allDataArray;
BOOL isAllValueLoaded;
BOOL isGPS_On;

NSMutableArray *catDataArray,*tagDataArray;

//////////////////////////////////////////////
// Boolean that is used to check that used has made application purchase or not
