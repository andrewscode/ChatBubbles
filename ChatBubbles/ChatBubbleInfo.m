//
//  ChatBubbleInfo.m
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-27.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChatBubbleInfo.h"


@implementation ChatBubbleInfo

@synthesize image = _image, alignLeft = _alignLeft, maxWidth = _maxWidth;
@synthesize topPadding = _topPadding, bottomPadding = _bottomPadding, leftPadding = _leftPadding, rightPadding = _rightPadding;
@synthesize topMargin = _topMargin, leftMargin = _leftMargin, bottomMargin = _bottomMargin, rightMargin = _rightMargin;
@synthesize font = _font;

-(void)dealloc
{
    [_image release];
    [_font release];
    [super dealloc];
}

-(void)setMargins:(float)top right:(float)right bottom:(float)bottom left:(float) left
{
    self.topMargin = top;
    self.rightMargin = right;
    self.bottomMargin = bottom;
    self.leftMargin = left;
    
}

-(void)setPadding:(float)top right:(float)right bottom:(float)bottom left:(float) left
{
    self.topPadding = top;
    self.rightPadding = right;
    self.bottomPadding = bottom;
    self.leftPadding = left;
    
}

@end

