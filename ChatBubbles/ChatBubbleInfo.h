//
//  ChatBubbleInfo.h
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-27.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatBubbleInfo : NSObject

@property (nonatomic,retain) UIImage *image;
@property (nonatomic,assign) float topPadding,leftPadding,bottomPadding,rightPadding;
@property (nonatomic,assign) float topMargin,leftMargin,bottomMargin,rightMargin;
@property (nonatomic,assign) float maxWidth;
@property (nonatomic,assign) BOOL alignLeft;
@property (nonatomic,retain) UIFont *font;

-(void)setMargins:(float)top right:(float)right bottom:(float)bottom left:(float) left;
-(void)setPadding:(float)top right:(float)right bottom:(float)bottom left:(float) left;


@end

