//
//  MicrosControllernav.m
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "MicrosControllernav.h"

@implementation MicrosControllernav
@synthesize state;
@synthesize data;
-(void)viewDidLoad
{
	[super viewDidLoad];
	_lesgens=[[NSMutableArray alloc]init];
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
	data=[[NSMutableArray alloc]init];
	
	[[self navigationController] setNavigationBarHidden:YES animated:YES];
	NSMutableDictionary *
	variableInfo=[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Information" ofType:@"plist"]];
	NSEnumerator *iterator=[variableInfo keyEnumerator];
	NSEnumerator *iterator2;
	NSString * key;
	NSString * key2;
	AllData * courante;
	ReplyData * reply;
	while ((key=[iterator nextObject])!=Nil) {
		courante=[[AllData alloc]init];
		iterator2=[(NSDictionary *)[variableInfo objectForKey:key]keyEnumerator];
		while ((key2=[iterator2 nextObject])!=Nil) {
			[courante addChild:[[Donnee alloc]initWithName:key2 AndValue:[[variableInfo objectForKey:key] objectForKey:key2]]];
		}
		[_donnees addObject:courante];
	}
	
}
-(void)viewWillAppear:(BOOL)animated
{
	[[self navigationController] setNavigationBarHidden:YES animated:YES];
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
	UITableViewCell * cell= [[UITableViewCell alloc]initWithStyle:2 reuseIdentifier:@"News"];
	cell.textLabel.text=[_lesgens objectAtIndex:[indexPath indexAtPosition:1]];
	UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(160, 0, 60, 60)];
	[cell setAccessoryView:button];
	[button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
	return cell;
}
-(void)tapped:(id)sender;
{
	state=[[[(UIButton *)sender titleLabel]text]intValue];
	[self performSegueWithIdentifier:@"details" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([[segue identifier] isEqualToString:@"details"]){
		controller=[segue destinationViewController];
		[controller setCommentaire:[_lesgens objectAtIndex:state]]  ;
		
		
	}
}
-(void)getInfo
{
	
}


@end
