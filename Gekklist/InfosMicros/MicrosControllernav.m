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
@synthesize datas;
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
	datas=[[NSMutableArray alloc]init];
	
	[[self navigationController] setNavigationBarHidden:YES animated:YES];
	NSMutableDictionary *
	variableInfo=[[NSMutableDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Information" ofType:@"plist"]];
	NSEnumerator *iterator=[variableInfo keyEnumerator];
	NSString * key;
	AllData * courante;
	ReplyData * reply;
	int imax;
	int i;
	id temp;
	while ((key=[iterator nextObject])!=Nil) {
		
		NSLog(@"%@\n",key);
		temp=[variableInfo objectForKey:key];
		courante=[[AllData alloc]initWithSender:[temp objectForKey:@"Sender"] Title:[temp objectForKey:@"Titre"] Comment:[temp objectForKey:@"Comment"] Coordinate:CGPointMake([[[[temp objectForKey:@"Coordinate"]componentsSeparatedByString:@" "]objectAtIndex:0]floatValue], [[[[temp objectForKey:@"Coordinate"]componentsSeparatedByString:@" "]objectAtIndex:1]floatValue]) PhotoURL:[temp objectForKey:@"PhotoURL"]];
		imax=[[temp objectForKey:@"Replys"]count];
		i=0;
		while (i<imax) {
			reply=[[ReplyData alloc]initWith:[[[temp objectForKey:@"Replys"]objectAtIndex:i]objectForKey:@"Sender"]
									 Comment:[[[temp objectForKey:@"Replys"]objectAtIndex:i]objectForKey:@"Comment"]
									PhotoURL:[[[temp objectForKey:@"Replys"]objectAtIndex:i]objectForKey:@"PhotoURL"]];
			[[courante reply]addObject:reply];
			i++;
		}
		[datas addObject:courante];
		
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
	return [datas count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell * cell= [[UITableViewCell alloc]initWithStyle:3 reuseIdentifier:@"News"];
	cell.textLabel.text=[(AllData *)[datas objectAtIndex:[indexPath indexAtPosition:1]]title];
	UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(160, 0, 60, 60)];
	
	NSURL *url = [NSURL URLWithString:[[datas objectAtIndex:[indexPath indexAtPosition:1]]photoURL]];
	NSLog(@"%@",[[datas objectAtIndex:[indexPath indexAtPosition:1]]photoURL]);
	NSData *data2 = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data2];
	[cell.imageView setImage: img];
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
		[controller setCommentaire:[[datas objectAtIndex:state]comment]];
		
		[(DetailsViewController *)[segue destinationViewController]setDatas:[self datas]];
		
	}
}
-(void)getInfo
{
	
}


@end
