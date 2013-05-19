//
//  CommunityViewController.m
//  geeklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "CommunityViewController.h"

@implementation CommunityViewController
@synthesize datas;
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([[segue destinationViewController]data]==0)
	{
		[[segue destinationViewController] setDatas:[self datas]];
	}
}
@end
