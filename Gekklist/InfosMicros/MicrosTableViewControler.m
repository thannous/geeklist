//
//  MicrosTableViewControler.m
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "MicrosTableViewControler.h"

@implementation MicrosTableViewControler
@synthesize lesgens=_lesgens;
-(void)viewDidLoad
{
	[super viewDidLoad];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
	[_lesgens addObject:@"Dilbert"];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [_lesgens count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell * cell= [tableView
							 dequeueReusableCellWithIdentifier:@"News"];
	
	cell.textLabel.text = [_lesgens objectAtIndex:[indexPath indexAtPosition:1]];
	return cell;
}
@end
