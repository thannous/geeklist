//
//  MicrosControllernav.h
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

@interface MicrosControllernav : UITableViewController
{
	IBOutlet UITableView * tablevue;
	DetailsViewController * controller;
}
@property (nonatomic,copy)NSMutableArray * lesgens;
@property (readonly)int state;
-(void)tapped:(id)sender;
-(void)getInfo;
@end
