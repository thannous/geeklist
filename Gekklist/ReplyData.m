//
//  ReplyData.m
//  geeklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "ReplyData.h"

@implementation ReplyData
@synthesize sender=_sender;
@synthesize comment=_comment;
@synthesize photoURL=_photoURL;

-(id)init
{
	if(self=[super init])
	{
		
	}
	return self;
}
-(id)initWith:(NSString *)Sender
{
	if([self init])
	{
		_sender=[Sender copy];
	}
	return self;
}
-(id)initWith:(NSString *)Sender Comment:(NSString *)Comment
{
	if([self initWith:Sender])
	{
		_comment=[Comment copy];
	}
	return self;
}
-(id)initWith:(NSString *)Sender Comment:(NSString *)Comment PhotoURL:(NSString *)PhotoURL
{
	if([self initWith:Sender Comment:Comment])
	{
		_photoURL=[PhotoURL copy];
	}
	return self;
}
@end
