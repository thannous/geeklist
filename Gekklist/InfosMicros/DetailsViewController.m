//
//  DetailsViewController.m
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "DetailsViewController.h"
#import "MicrosControllernav.h"
@implementation DetailsViewController
@synthesize image;
@synthesize titre;
@synthesize commentaire;
@synthesize datas,ButtonNumber;

-(void)viewDidLoad
{
	[super viewDidLoad];
	[scrollView scrollsToTop];
	InfoMicro.backgroundColor=[UIColor colorWithRed:0.02 green:0.7 blue:0.3 alpha:1];
	[[self navigationController] setNavigationBarHidden:NO animated:YES];
	InfoMicro.backgroundColor=[[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"header1.png"]];
	portrait.layer.masksToBounds=YES;
	portrait.layer.cornerRadius=40.0;
	portrait.layer.borderColor=[[UIColor colorWithRed:0.60724314 green:0.57254902 blue:0.40784314 alpha:1]CGColor];
	portrait.layer.borderWidth=3.0f;
	NSURL *url = [NSURL URLWithString:@"http://lorempixel.com/50/50/"];
	NSData *data2 = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data2];
	[portrait setImage:img];
	textField.returnKeyType = UIReturnKeyDone;
	NSLog(@"%@",[self datas]);
	UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touch)];
	[recognizer setNumberOfTapsRequired:1];
	[recognizer setNumberOfTouchesRequired:1];
	[scrollView addGestureRecognizer:recognizer];
	etat=YES;
	
}
-(void)touch
{
	if(!etat){
		[textField resignFirstResponder];
		//[UIView commitAnimations];
		//[scrollView scrollsToTop];
		//scrollView.contentOffset = CGPointMake(0,-textField.frame.origin.y+textField.frame.size.height+10);
		//NSLog(@"%lf\n",textField.frame.origin.y);
	}
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([[segue destinationViewController]data]==0)
	{
		[[segue destinationViewController] setDatas:[self datas]];
	}
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[self navigationController] setNavigationBarHidden:NO animated:YES];
    // listen for keyboard hide/show notifications so we can properly adjust the table's height
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
	Micros.text=[[datas objectAtIndex:[self ButtonNumber]]comment];
	[portrait setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[datas objectAtIndex:[self ButtonNumber]]photoURL]]]]];
	Nom.textColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];
	Nom.text=[[datas objectAtIndex:[self ButtonNumber]]title];
	EmmeteurName.text=[[datas objectAtIndex:[self ButtonNumber]]senders];
	Micros.layer.masksToBounds=YES;
    Micros.layer.borderColor=[[UIColor colorWithRed:0.60724314 green:0.57254902 blue:0.40784314 alpha:1]CGColor];
    Micros.layer.borderWidth= 1.0f;
	Micros.layer.cornerRadius=6;
	[self becomeFirstResponder];
	
	
	
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
	// the keyboard is showing so resize the table's height
	
	if(etat){
	CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration =
	[[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = self.view.frame;
    frame.size.height -= keyboardRect.size.height-self.navigationController.navigationBar.frame.size.height;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
	[scrollView scrollsToTop];
		NSLog(@"x:%lf\ty:%lf\n",scrollView.contentOffset.x,scrollView.contentOffset.y);
	scrollView.contentOffset = CGPointMake(0,textField.frame.origin.y+textField.frame.size.height-keyboardRect.size.height+10);
	NSLog(@"%lf\n",textField.frame.origin.y);
		etat=NO;
	}
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    // the keyboard is hiding reset the table's height
	/*CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration =
	[[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = self.view.frame;
    frame.size.height += keyboardRect.size.height;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];*/
	//[scrollView scrollsToTop];
	CGPoint bottomOffset = CGPointMake(0, 0);
	scrollView.frame=CGRectMake(0, 0, 320, 455);
	[textField resignFirstResponder];
	[scrollView setContentOffset:bottomOffset animated:YES];

	
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
    if ([textField isFirstResponder] && [touch view] != textField) {
        [textField resignFirstResponder];
		NSLog(@"fait");
    }
	else
	{
		NSLog(@"nofait");
	}
    [super touchesBegan:touches withEvent:event];
}
-(void)useAllData
{
	
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
	
	
    if([text isEqualToString:@"\b"]){
        return YES;
    }else if([[textView text] length] > 140){
		
        return NO;
    }
	
    return YES;
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	return [[[datas objectAtIndex:[self ButtonNumber]]reply] count]*2;
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
		
		[cellTitre.textLabel setText:[[[[datas objectAtIndex:ButtonNumber]reply]objectAtIndex:([indexPath indexAtPosition:1])/2]sender] ];
		
		
		[cellTitre.textLabel setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
		[cellTitre.detailTextLabel setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
		[cellTitre setFrame:CGRectMake(0, 0, 320, 50)];
		return cellTitre;
	}
	else{
		UITableViewCell * cellDonnee=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Donnee"];
		[cellDonnee setFrame:CGRectMake(0, 0, 320, 100)];
		[cellDonnee.imageView setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: [[[[datas objectAtIndex:ButtonNumber]reply]objectAtIndex:([indexPath indexAtPosition:1])/2]photoURL]			]]]];
		cellDonnee.textLabel.numberOfLines=4;
		cellDonnee.textLabel.font=[UIFont fontWithName:@"Arial" size:14.0f];
		[cellDonnee.textLabel setText:[[[[datas objectAtIndex:ButtonNumber]reply]objectAtIndex:([indexPath indexAtPosition:1])/2]comment]				];
		
		
		return cellDonnee;
	}
	
}
@end
