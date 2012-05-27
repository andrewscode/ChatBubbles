//
//  ViewController.h
//  ChatBubbles
//
//  Created by Andrew Schmidt on 2012-05-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatBubbleCell.h"
#import "DateCell.h"

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain) NSArray *messageList;
@property(nonatomic,assign) IBOutlet ChatBubbleCell *chatBubbleCell;
@property(nonatomic,assign) IBOutlet DateCell *dateCell;
@property(nonatomic,retain) IBOutlet UITableView *tableView;


-(id)initWithNibName:(NSString *)nibNameOrNil withBundleOrNil:(NSBundle *)bundle;
-(IBAction)reloadTable;

@end
