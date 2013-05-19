//
//  AllData.m
//  geeklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import "AllData.h"

@implementation AllData
@synthesize senders=_senders;
@synthesize photoURL=_photoURL;
@synthesize  comment=_comment;
@synthesize Coordinate=_Coordinate;
@synthesize title=_title;
@synthesize reply=_reply;
@synthesize date=_date;

-(id)init
{
	if(self=[super init]){
		_reply=[[NSMutableArray alloc]init];
	}
	return self;
}
-(id)initWithSender:(NSString *)Sender
{
	if ([self init]) {
		_senders=[Sender copy];
	}
	return self;
}
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title
{
	if([self initWithSender:Sender])
	{
		_title=[Title copy];
	}
	return self;
}
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title Comment:(NSString *)Comment
{
	if([self initWithSender:Sender Title:Title])
	{
		_comment=[Comment copy];
	}
	return self;
}
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title Comment:(NSString *)Comment Coordinate:(CGPoint)Coordinate
{
	if([self initWithSender:Sender Title:Title Comment:Comment])
	{
		_Coordinate=CGPointMake(Coordinate.x, Coordinate.y);
	}
	return self;
}
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title Comment:(NSString *)Comment Coordinate:(CGPoint)Coordinate PhotoURL:(NSString *)PhotoURL
{
	if ([self initWithSender:Sender Title:Title Comment:Comment Coordinate:Coordinate]) {
		_photoURL=[PhotoURL copy];
	}
	return self;
}
-(NSUInteger)count
{
	return [_reply count];
}
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title Comment:(NSString *)Comment Coordinate:(CGPoint)Coordinate PhotoURL:(NSString *) PhotoURL Date:(NSString *)date
{
	if ([self initWithSender:Sender Title:Title Comment:Comment Coordinate:Coordinate PhotoURL:PhotoURL]) {
		_date=[date copy];
	}
	return self;
}
@end
