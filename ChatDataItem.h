//
//  ChatDataItem.h
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>






@interface ChatDataItem : NSObject

@property (nonatomic,retain) NSString *chatText;
@property (nonatomic,retain) NSString *name;
@property (nonatomic,assign) float height, textWidth, textHeight, frameWidth;
@property (nonatomic,assign) int type;

+(id)itemWithText:(NSString *)chatText name:(NSString *)name type:(int)type;

@end


@interface DateItem : NSObject 

@property (nonatomic,retain) NSString *dateStr;
@property(nonatomic,assign) float height;

+(id)itemWithDate:(NSString *)date;

@end
