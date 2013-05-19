//
//  ViewController.m
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self performSegueWithIdentifier:@"Facebook" sender:self];
	
}


@end
