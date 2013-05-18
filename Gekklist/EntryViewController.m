//
//  EntryViewController.m
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "EntryViewController.h"
//#import <OAuthConsumer/OAuthConsumer.h>

@implementation EntryViewController
-(void)viewDidLoad
{
	[super viewDidLoad];
	[indicator stopAnimating];
	[indicator setHidesWhenStopped:YES];
}

-(IBAction)bouton:(id)sender
{
	[indicator startAnimating];
	[self performSelector:@selector(toNavWorld) withObject:nil afterDelay:2];
}
-(void)toNavWorld
{
	[self performSegueWithIdentifier:@"ToNavWorld" sender:self];
}
@end
