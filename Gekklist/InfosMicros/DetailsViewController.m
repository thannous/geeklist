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
-(void)viewDidLoad
{
	[super viewDidLoad];
	[scrollView scrollsToTop];
	InfoMicro.backgroundColor=[UIColor colorWithRed:0.02 green:0.7 blue:0.3 alpha:1];
	[[self navigationController] setNavigationBarHidden:NO animated:YES];
	InfoMicro.backgroundColor=[[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"header1.png"]];
	portrait.layer.masksToBounds=YES;
	portrait.layer.cornerRadius=30.0;
	NSURL *url = [NSURL URLWithString:@"http://lorempixel.com/50/50/"];
	NSData *data2 = [NSData dataWithContentsOfURL:url];
	UIImage *img = [[UIImage alloc] initWithData:data2];
	[portrait setImage:img];
	
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	[self setData:[(MicrosControllernav *)sender data]];
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
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
	// the keyboard is showing so resize the table's height
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
	scrollView.contentOffset = CGPointMake(0,textField.frame.origin.y+textField.frame.size.height-keyboardRect.size.height+10);
	NSLog(@"%lf\n",textField.frame.origin.y);
}
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    // the keyboard is hiding reset the table's height
	CGRect keyboardRect = [[[aNotification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration =
	[[[aNotification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = self.view.frame;
    frame.size.height += keyboardRect.size.height;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    self.view.frame = frame;
    [UIView commitAnimations];
	[scrollView scrollsToTop];
	
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
@end
