//
//  ViewController.m
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "ChatBubbleInfo.h"
#import "ChatDataItem.h"

@implementation ViewController

@synthesize messageList = _messageList, chatBubbleCell = _chatBubbleCell, dateCell = _dateCell;
@synthesize tableView = _tableView;

-(id)initWithNibName:(NSString *)nibNameOrNil withBundleOrNil:(NSBundle *)bundle
{
    self = [super initWithNibName:nibNameOrNil bundle:bundle];
    if(self) {
        NSMutableArray *bubbleTypes = [NSMutableArray array];
        
        // load a temp copy of the chatabubblecell to get the font object.
        [[NSBundle mainBundle] loadNibNamed:@"ChatBubbleCell" owner:self options:nil];
        
        ChatBubbleCell *cell = self.chatBubbleCell;
        self.chatBubbleCell = nil;
        
        // create the green bubble info, with a right align
        ChatBubbleInfo *bubbleInfo = [[[ChatBubbleInfo alloc] init] autorelease];
        
        [bubbleInfo setPadding:5 right:15 bottom:10 left:10];
        [bubbleInfo setMargins:2 right:25 bottom:22 left:0];
        
        bubbleInfo.image = [[[UIImage imageNamed:@"green.png"] stretchableImageWithLeftCapWidth:24 topCapHeight:15] retain];
        bubbleInfo.alignLeft = NO;
        bubbleInfo.maxWidth = 0.85;
        bubbleInfo.font = cell.chatText.font;
        
        [bubbleTypes addObject:bubbleInfo];
            
        // create the grey bubble, with a left align.
        bubbleInfo = [[[ChatBubbleInfo alloc] init] autorelease];
        [bubbleInfo setPadding:5 right:10 bottom:10 left:15];
        [bubbleInfo setMargins:2 right:0 bottom:22 left:25];
        
        bubbleInfo.image = [[[UIImage imageNamed:@"grey.png"] stretchableImageWithLeftCapWidth:24 topCapHeight:15] retain];
        
        bubbleInfo.alignLeft = YES;
        bubbleInfo.maxWidth = 0.85;
        bubbleInfo.font = cell.chatText.font;        

        [bubbleTypes addObject:bubbleInfo];

        // set out bubble info  array
        [ChatBubbleCell initBubbleImages:bubbleTypes];
        
        // create some test messages
        NSMutableArray *messages = [NSMutableArray arrayWithObjects:
                                    [ChatDataItem itemWithText:@"Hey Hey Hey" name:@"Andrew" type:0],
                                    [ChatDataItem itemWithText:@"THis is a test of a really really long message and it's quite long. THis is a test of a really really long message and it's quite long. THis is a test of a really really long message and it's quite long" name:@"Brandon" type:1],
                                    [DateItem itemWithDate:@"Mon, Jun 4th"],
                                    [ChatDataItem itemWithText:@"Hey Hey Hey This is aanother long sentance and I'm testing out the green size." name:@"Andrew" type:0],                                                                        
                                    nil];
        // make some copies of the array to increase the total # of messages.
        NSMutableArray *fullMessages = [NSMutableArray array];
        for(int x = 0; x < 10; ++x) {
            [fullMessages addObjectsFromArray:messages];
        }
        self.messageList = fullMessages;
        
        
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.tableView = nil;
    

}

-(void)dealloc 
{
    [_messageList release];
    [_tableView release];
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;

}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.messageList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    id item = [self.messageList objectAtIndex:indexPath.row];

    // size the item depending on class
    
    if([item isKindOfClass:[ChatDataItem class]]) {
        [ChatBubbleCell sizeItem:item withFrame:self.view.bounds];

    } else if ([item isKindOfClass:[DateItem class]]) {
        [DateCell sizeItem:item withFrame:self.view.bounds];
    } else {
        // fatal error
        NSAssert(false, @"item in list does not correspond to any item class");
        return 0;
        
    }
    
    return [item height]; 
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    

    id item = [self.messageList objectAtIndex:indexPath.row];

    // dequeue the cell depending on the item's class and, in either case, populate the cell.
    if([item isKindOfClass:[ChatDataItem class]]) {
        ChatBubbleCell *cell = [tableView dequeueReusableCellWithIdentifier:[ChatBubbleCell cellIdentifier]];
        if(cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"ChatBubbleCell" owner:self options:nil];
            
            cell = self.chatBubbleCell;
            self.chatBubbleCell = nil;
        }
        [cell populateView:item];
        return cell;
    } else if([item isKindOfClass:[DateItem class]]) {
        DateCell *cell = [tableView dequeueReusableCellWithIdentifier:[DateCell cellIdentifier]];
        if(cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"DateCell" owner:self options:nil];
            
            cell = self.dateCell;
            self.dateCell = nil;
        }
        [cell populateView:item];
        return cell;
    } else {
        // fatal error
        NSAssert(false, @"item in list does not correspond to any item class");
        return nil;
    }
            

    

}

-(IBAction)reloadTable
{
    [self.tableView reloadData];
}


@end
