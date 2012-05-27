//
//  ChatBubbleCell.m
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ChatBubbleCell.h"



@implementation ChatBubbleCell

@synthesize chatText = _chatText, name = _name, bubbleView = _bubbleView;
@synthesize item = _item;

#define LOGCGRECT(c) NSLog(@"x: %.0f; y: %.0f; width: %.0f; height: %.0f", c.origin.x,c.origin.y,c.size.width,c.size.height)

#define LOGCGSIZE(a,c) NSLog(@"%@  width: %.0f; height: %.0f", a, c.width, c.height)

static NSArray *bubbleImages;


+(NSString *)cellIdentifier
{
    static NSString *ident = @"ChatBubbleCell";
    return ident;
}


+(void)initBubbleImages:(NSArray *)lBubbleImages
{
    bubbleImages = [lBubbleImages retain];

}



+(void)sizeItem:(ChatDataItem *)item withFrame:(CGRect)frame
{
    // cache the size of the frame Width and if it doesn't change, then we don't need to resize.
    // this handles both the initialize phase and a orientation change
    // Note* the frame to be passed in should be the bounds of the tableView
    if(frame.size.width == item.frameWidth) {
        return;
    }
    
    ChatBubbleInfo *bubbleInfo = [bubbleImages objectAtIndex:item.type];

    // figure out the max width we have for this chat bubble
    float chatBubbleMaxWidth;
    
    chatBubbleMaxWidth = bubbleInfo.maxWidth * frame.size.width;    // no bigger than the % of frame width
    
    // subtract margin
    if(bubbleInfo.alignLeft) {
        chatBubbleMaxWidth -= bubbleInfo.leftMargin;
    } else {
        chatBubbleMaxWidth -= bubbleInfo.rightMargin;
    }
    // substract padding.
    chatBubbleMaxWidth -= bubbleInfo.leftPadding + bubbleInfo.rightPadding;
    
    NSLog(@" max width: %.0f", bubbleInfo.maxWidth);
    NSLog(@"chatBubbleMaxWidth: %.0f", chatBubbleMaxWidth);
    // figure out the textsize constrained
    CGSize textSize = [item.chatText sizeWithFont:bubbleInfo.font constrainedToSize:CGSizeMake(chatBubbleMaxWidth, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    LOGCGSIZE(@"textSize", textSize);

    // add the extra padding and margin
    item.height = textSize.height + bubbleInfo.topPadding + bubbleInfo.bottomPadding + bubbleInfo.topMargin + bubbleInfo.bottomMargin;

    item.textWidth = MAX(textSize.width,  bubbleInfo.image.size.width);   // minimum width for the chat bubble image
    
    item.textHeight = textSize.height;

    // set our cached frame width
    item.frameWidth = frame.size.width;
    
}



-(void)populateView:(ChatDataItem *)item
{
    self.chatText.text = item.chatText;
    self.name.text = item.name;
    self.item = item;
    
    // we've got to reset its setNeedsDisplay to redraw the image.
    [self setNeedsDisplay];
    
}


- (void)drawRect:(CGRect)rect 
{
    
    ChatBubbleInfo *bubbleInfo = [bubbleImages objectAtIndex:self.item.type];

    // figure out the background image size
    self.bubbleView.image = bubbleInfo.image;

    // can't be bigger than our frame.
    float maxWidth = (rect.size.width - rect.origin.x);
    //    NSLog(@"maxWidth: %.0f", maxWidth);        
    
    // create the imageview rect with the padding
    CGRect bgRect;
    
    float width,height;

    width = self.item.textWidth + bubbleInfo.leftPadding + bubbleInfo.rightPadding;
    height = self.item.textHeight + bubbleInfo.topPadding + bubbleInfo.bottomPadding;
   
    // create the rect based on alignment
    if(bubbleInfo.alignLeft) {
        bgRect = CGRectMake(bubbleInfo.leftMargin
                                   , rect.origin.y + bubbleInfo.topMargin
                                   , width
                                   , height
                                   );
    } else {
        bgRect = CGRectMake(maxWidth - width - bubbleInfo.rightMargin
                            , rect.origin.y + bubbleInfo.topMargin
                            , width
                            , height
                            );
        
    }
    
    self.bubbleView.frame = bgRect;
    
    // now the uitextview  size is smaller than the background image, reuse the bgRect values
    CGRect textRect = bgRect;
    
    textRect.origin.x += bubbleInfo.leftPadding;
    textRect.origin.y += bubbleInfo.topPadding;
    textRect.size.width = self.item.textWidth;
    textRect.size.height = self.item.textHeight;
    
    self.chatText.frame = textRect;    
    
    // adjust alignment of the display name label
    if(bubbleInfo.alignLeft) {
        self.name.textAlignment = UITextAlignmentLeft;

    } else {
        self.name.textAlignment = UITextAlignmentRight;        
    }
    
    // let the super do the rest
    [super drawRect:rect];
    
    
}


-(void)dealloc
{
    [_bubbleView release];
    [_chatText release];
    [_name release];
    [_item release];
    
    [super dealloc];
}

@end


