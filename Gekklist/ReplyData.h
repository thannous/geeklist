//
//  ReplyData.h
//  geeklist
//
//  Created by Kévin Mondésir on 18/05/13.
//  Copyright (c) 2013 GeekList. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReplyData : NSObject
@property (nonatomic,copy)NSString * sender;
@property (nonatomic,copy)NSString * comment;
@property (nonatomic,copy)NSString * photoURL;

-(id)init;
-(id)initWith:(NSString *)Sender;
-(id)initWith:(NSString *)Sender Comment:(NSString *) Comment;
-(id)initWith:(NSString *)Sender Comment:(NSString *) Comment PhotoURL:(NSString *)PhotoURL;
@end
