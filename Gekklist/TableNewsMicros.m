//
//  TableNewsMicros.m
//  geeklist
//
//  Created by Kévin Mondésir on 19/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "TableNewsMicros.h"

@implementation TableNewsMicros

@synthesize state;
@synthesize datas;
-(void)viewDidLoad
{
	[super viewDidLoad];
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
	return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	 MicrosCell * cell= [[MicrosCell alloc]init];
	cell.textLabel.text=[(AllData *)[datas objectAtIndex:[indexPath indexAtPosition:1]]title];
	
	NSURL *url = [NSURL URLWithString:[[datas objectAtIndex:[indexPath indexAtPosition:1]]photoURL]];
	NSLog(@"%@",[[datas objectAtIndex:[indexPath indexAtPosition:1]]photoURL]);
	NSData *data2 = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data2];
	[cell.photo setImage: img];
	[cell.sender setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
	[cell.date setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
	[cell.Comment setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
	[cell.sender setText:[[datas objectAtIndex:[indexPath indexAtPosition:1]]objectForKey:@"Sender"]];
	[cell.date setText:[[datas objectAtIndex:[indexPath indexAtPosition:1]]objectForKey:@"Date"]];
	[cell.Comment setText:[[datas objectAtIndex:[indexPath indexAtPosition:1]]objectForKey:@"Comment"]];
	
	[cell.bouton addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
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
