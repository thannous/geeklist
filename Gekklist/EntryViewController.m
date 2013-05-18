//
//  EntryViewController.m
//  Gekklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "EntryViewController.h"

@implementation EntryViewController
-(void)viewDidLoad
{
	[super viewDidLoad];
	[indicator stopAnimating];
	[indicator setHidesWhenStopped:YES];
	//OAConsumer *consumer = [[OAConsumer alloc] initWithKey:@"mykey" secret:@"mysecret"];
	
    //NSURL *url = [NSURL URLWithString:@"http://example.com/get_request_token"];
	/*
    OAMutableURLRequest *request = [[OAMutableURLRequest alloc] initWithURL:url
                                                                   consumer:consumer
                                                                      token:nil   // we don't have a Token yet
                                                                      realm:nil   // our service provider doesn't specify a realm
                                                          signatureProvider:nil]; // use the default method, HMAC-SHA1
	
    [request setHTTPMethod:@"POST"];
	
    OADataFetcher *fetcher = [[OADataFetcher alloc] init];
	
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(requestTokenTicket:didFinishWithData:)
                  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];*/
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
