//
//  MicrosControllernav.m
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "MicrosControllernav.h"

@implementation MicrosControllernav
@synthesize datas;
@synthesize donneePerso;
@synthesize state;
-(void)viewDidLoad
{
	[super viewDidLoad];
	//[camera setContentMode:UIViewContentModeScaleToFill];
	//[ok setContentMode:UIViewContentModeScaleToFill];
	//[geoloc setContentMode:UIViewContentModeScaleToFill];
	[portrait setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://lorempixel.com/75/75/"]]]];
	portrait.layer.cornerRadius=40;
	portrait.layer.masksToBounds=YES;
	portrait.layer.borderColor=[[UIColor colorWithRed:0.60724314 green:0.57254902 blue:0.40784314 alpha:1]CGColor];
	portrait.layer.borderWidth=3.0f;
	[camera setFrame:CGRectMake(90, 197, 40, 51)];
	[ok setFrame:CGRectMake(150, 197, 40, 51)];
	[geoloc setFrame:CGRectMake(225, 197, 45, 51)];
	datas=[[NSMutableArray alloc]init];
	AddComment.layer.cornerRadius=6;
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
	AddComment.returnKeyType = UIReturnKeyDone;
    AddComment.layer.masksToBounds=YES;
    AddComment.layer.borderColor=[[UIColor colorWithRed:0.60724314 green:0.57254902 blue:0.40784314 alpha:1]CGColor];
    AddComment.layer.borderWidth= 1.0f;
	while ((key=[iterator nextObject])!=Nil) {
		
		NSLog(@"%@\n",key);
		temp=[variableInfo objectForKey:key];
		courante=[[AllData alloc]initWithSender:[temp objectForKey:@"Sender"] Title:[temp objectForKey:@"Titre"] Comment:[temp objectForKey:@"Comment"] Coordinate:CGPointMake([[[[temp objectForKey:@"Coordinate"]componentsSeparatedByString:@" "]objectAtIndex:0]floatValue], [[[[temp objectForKey:@"Coordinate"]componentsSeparatedByString:@" "]objectAtIndex:1]floatValue]) PhotoURL:[temp objectForKey:@"PhotoURL"]Date:[temp objectForKey:@"date"]];
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
	return [datas count]*2;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	if([indexPath indexAtPosition:1]%2==0)
	{
		cell.backgroundColor = [UIColor colorWithRed:0.6627451 green:0.86247451 blue:0.49019608 alpha:1];
	}
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if([indexPath indexAtPosition:1]%2==0)
	{
		UITableViewCell * cellTitre=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Titre"];
		[cellTitre.textLabel setText:[[datas objectAtIndex:([indexPath indexAtPosition:1])/2]senders]];
		[cellTitre.detailTextLabel setText:[NSString stringWithFormat:@"%@",[[datas objectAtIndex:([indexPath indexAtPosition:1])/2]date]]];
		//[cellTitre.textLabel setBackgroundColor:[UIColor colorWithRed:0.6627451 green:0.86247451 blue:0.49019608 alpha:1]];
		//cellTitre.backgroundColor = [UIColor colorWithRed:0.6627451 green:0.86247451 blue:0.49019608 alpha:1];
		[cellTitre.textLabel setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
		[cellTitre.detailTextLabel setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
		[cellTitre setFrame:CGRectMake(0, 0, 320, 50)];
		return cellTitre;
	}
	else{
		UITableViewCell * cellDonnee=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Donnee"];
		[cellDonnee setFrame:CGRectMake(0, 0, 320, 100)];
		[cellDonnee.imageView setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[datas objectAtIndex:([indexPath indexAtPosition:1])/2]photoURL]]]]];
		cellDonnee.textLabel.numberOfLines=4;
		cellDonnee.textLabel.font=[UIFont fontWithName:@"Arial" size:14.0f];
		[cellDonnee.textLabel setText:[[datas objectAtIndex:([indexPath indexAtPosition:1])/2]comment]];
		UIButton * button =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
		[button addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
		[button setTitleColor:[UIColor colorWithRed:0.6627451 green:0.86247451 blue:0.49019608 alpha:0]  forState:UIControlStateNormal];
		[button setTitle:[NSString stringWithFormat:@"%d",(([indexPath indexAtPosition:1])/2)] forState:UIControlStateNormal];
		[button setBackgroundColor:[UIColor colorWithRed:0.6627451 green:0.86247451 blue:0.49019608 alpha:1]];
		cellDonnee.accessoryView=button;
		
		return cellDonnee;
	}
	/*
	MicrosCell *cell = (MicrosCell *)[tableView dequeueReusableCellWithIdentifier:@"MicrosCell"];
	
	cell.textLabel.text=[(AllData *)[datas objectAtIndex:[indexPath indexAtPosition:1]]title];
	if(!cell)
	{
		NSArray *topLevelObjects=[[NSBundle mainBundle]loadNibNamed:@"MicrosCell" owner:nil options:nil];
		for (id currentObject in topLevelObjects) {
			cell=(MicrosCell *)currentObject;
			break;
		}
	}
	NSURL *url = [NSURL URLWithString:[[datas objectAtIndex:[indexPath indexAtPosition:1]]photoURL]];
	NSLog(@"%@",[[datas objectAtIndex:[indexPath indexAtPosition:1]]photoURL]);
	NSData *data2 = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data2];
	[cell.photo setImage: img];
	[[cell sender] setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
	[cell.date setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
	[cell.Comment setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
	[cell.sender setText:[[datas objectAtIndex:[indexPath indexAtPosition:1]]sender]];
	[cell.date setText:@"11-23-12"];//[[datas objectAtIndex:[indexPath indexAtPosition:1]]objectForKey:@"Date"]];
	[cell.Comment setText:[[datas objectAtIndex:[indexPath indexAtPosition:1]]comment]];
	
	[cell.bouton addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
	return (UITableViewCell *)cell;
	 */
	
}
-(void)tapped:(id)sender;
{
	state=[[[(UIButton *)sender titleLabel]text]intValue];
	NSLog(@"etat=%d\n",state);
	[self performSegueWithIdentifier:@"details" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([[segue identifier] isEqualToString:@"details"]){
		controller=[segue destinationViewController];
		[(DetailsViewController *)[segue destinationViewController] setDatas:datas];
		[(DetailsViewController *)[segue destinationViewController] setButtonNumber:state];
		[(DetailsViewController *)[segue destinationViewController] useAllData];
		//[(DetailsViewController *)[segue destinationViewController]setCommentaire:[[datas objectAtIndex:state]comment]];
		//[(DetailsViewController *)[segue destinationViewController]setTitre:[[datas objectAtIndex:state]senders]];
		//[(DetailsViewController *)[segue destinationViewController]setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[datas objectAtIndex:state]photoURL]]]]];
		//[(DetailsViewController *)[segue destinationViewController]setDatas:[self datas]];
		
		
	}
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
	
	
    if([text isEqualToString:@"\b"]){
        return YES;
    }else if([[textView text] length] > 140){
		
        return NO;
    }
	
    return YES;
}
-(IBAction)camera:(id)sender
{
	
}
-(IBAction)ok:(id)sender
{
	
}
-(IBAction)geoloc:(id)sender
{
	
}
- (void)keyboardWillShow:(NSNotification *)aNotification
{
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
	
	
}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
	
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
    UITouch *touch = [[event allTouches] anyObject];
    if ([AddComment isFirstResponder] && [touch view] != AddComment) {
        [AddComment resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

@end
