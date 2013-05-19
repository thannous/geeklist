//
//  TableNewsMicros.h
//  geeklist
//
//  Created by Kévin Mondésir on 19/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllData.h"
#import "DetailsViewController.h"
#import "MicrosCell.h"
@interface TableNewsMicros : UITableViewController
{
	IBOutlet UITableView * tablevue;
	DetailsViewController * controller;
}
@property (nonatomic,copy)NSMutableArray * datas;
@property (readonly)int state;
-(void)tapped:(id)sender;
-(void)getInfo;
@end
