//
//  MicrosControllernav.h
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"
#import "TableNewsMicros.h"
#import "MicrosCell.h"

@interface MicrosControllernav : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
{
	IBOutlet UIButton * camera;
	IBOutlet UIButton * ok;
	IBOutlet UIButton * geoloc;
	IBOutlet UITextView * AddComment;
	IBOutlet UITableView * tablevue;
	DetailsViewController * controller;
	IBOutlet UIImageView * portrait;
	
	
	
}
@property (nonatomic,copy)NSMutableArray * datas;
@property (nonatomic,copy)AllData * donneePerso;
@property (readonly)int state;
-(IBAction)camera:(id)sender;
-(IBAction)ok:(id)sender;
-(IBAction)geoloc:(id)sender;

@end
