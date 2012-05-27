//
//  ScrollViewImages.m
//  ACSProduct
//
//  Created by preet dhillon on 16/10/11.
//  Copyright (c) 2011 dhillon. All rights reserved.
//

#import "ScrollViewImages.h"

@implementation ScrollViewImages

@synthesize delegatePress,arrayButtons;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setButtons:(NSMutableArray *)arrayButton
{
    self.arrayButtons = [[NSMutableArray alloc] init];
    [self setContentSize:CGSizeMake([arrayButton count]*100, self.frame.size.height)];
    int incX = 0;
    for(int i= 0;i<[arrayButton  count];i++)
    {
        UIButton *sampleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [sampleButton setFrame:CGRectMake(incX, 0, 70, 40)];
        sampleButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [sampleButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [sampleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];

        [sampleButton setTitle:[arrayButton objectAtIndex:i] forState:UIControlStateNormal];
        [sampleButton setTag:i];
//        [sampleButton setBackgroundImage:[[UIImage imageNamed:@"redButton.png"] stretchableImageWithLeftCapWidth:10.0 topCapHeight:0.0] forState:UIControlStateNormal];
        [sampleButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sampleButton];
        [self.arrayButtons  addObject:sampleButton];
        incX += 100;
    }
}

-(void)buttonPressed:(id)sender
{
    UIButton *buttonPress = (UIButton *)sender;  
    
    buttonPress.selected = 1;
    
    for(int i=0;i<[self.arrayButtons  count];i++)
    {
        if(i!=[buttonPress tag])
        {
            UIButton *buttonUnpress = [self.arrayButtons  objectAtIndex:i];
            buttonUnpress.selected = 0;
        }
    }
    [delegatePress selectSubCat:[buttonPress tag]];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
