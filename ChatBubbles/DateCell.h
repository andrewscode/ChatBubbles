//
//  DateCell.h
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-27.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatDataItem.h"

@interface DateCell : UITableViewCell

@property (nonatomic,retain) IBOutlet UILabel *dateLabel;
@property (nonatomic,retain) DateItem *item;

+(void)sizeItem:(DateItem *)item withFrame:(CGRect)frame;
-(void)populateView:(DateItem *)item ;
+(NSString *)cellIdentifier;

@end
