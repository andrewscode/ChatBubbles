//
//  ChatBubbleCell.h
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatBubbleInfo.h"
#import "ChatDataItem.h"




@interface ChatBubbleCell : UITableViewCell


@property (nonatomic,retain) IBOutlet UIImageView *bubbleView;
@property (nonatomic,retain) IBOutlet UILabel *chatText, *name;

// keep a copy of the item for local use
@property (nonatomic,retain) ChatDataItem *item;

+(void)sizeItem:(ChatDataItem *)item withFrame:(CGRect)frame;

+(void)initBubbleImages:(NSArray *)lBubbleImages;   

+(NSString *)cellIdentifier;

-(void)populateView:(ChatDataItem *)item;


@end
