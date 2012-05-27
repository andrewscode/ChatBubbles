//
//  ChatDataItem.m
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChatDataItem.h"


@implementation ChatDataItem

@synthesize height = _height, chatText = _chatText, name = _name, type = _type;
@synthesize textWidth = _textWidth, textHeight = _textHeight;
@synthesize frameWidth = _frameWidth;

-(void) dealloc 
{
    [_chatText release];
    [_name release];
    [super dealloc];
}

+(id)itemWithText:(NSString *)chatText name:(NSString *)name type:(int)type
{
    ChatDataItem *item = [[[ChatDataItem alloc] init] autorelease];
    item.chatText = chatText;
    item.name = name;
    item.type = type;
    
    return item;
}

@end


@implementation DateItem

@synthesize dateStr = _dateStr, height = _height;

-(void)dealloc 
{
    [_dateStr release];
    [super dealloc];
}


+(id)itemWithDate:(NSString *)date
{
    DateItem *item = [[[DateItem alloc] init] autorelease];
    item.dateStr = date;
    return item;
    
}

@end
