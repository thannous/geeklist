//
//  AllData.h
//  geeklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReplyData.h"
@interface AllData : NSObject
@property (nonatomic,copy)NSString * photoURL;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * comment;
@property(nonatomic,assign)CGPoint Coordinate;
@property(nonatomic,copy)NSString * sender;
@property(nonatomic,readonly)NSMutableArray * reply;

-(id)init;
-(id)initWithSender:(NSString * )Sender;
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title;
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title Comment:(NSString *) Comment;
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title Comment:(NSString *)Comment Coordinate:(CGPoint)Coordinate;
-(id)initWithSender:(NSString *)Sender Title:(NSString *)Title Comment:(NSString *)Comment Coordinate:(CGPoint)Coordinate PhotoURL:(NSString *) PhotoURL;
-(NSUInteger)count;

@end
