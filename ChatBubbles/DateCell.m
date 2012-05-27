//
//  DateCell.m
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-27.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DateCell.h"


@implementation DateCell

@synthesize dateLabel = _dateLabel, item = _item;

+(NSString *)cellIdentifier
{
    static NSString *ident = @"DateCell";
    return ident;
    
}

+(void)sizeItem:(DateItem *)item withFrame:(CGRect)frame
{
    item.height = 25;
}


-(void)populateView:(DateItem *)item 
{
    self.item = item;
    self.dateLabel.text = self.item.dateStr;
}

-(void)dealloc
{
    [_item release];
    [_dateLabel release];
    [super dealloc];
}


@end
