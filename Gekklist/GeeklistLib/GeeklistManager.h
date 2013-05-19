//
//  GeeklistManager.h
//  GeeklistLib
//
//  Created by James Petersen on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OAuthConsumer.h"

@interface GeeklistManager : NSObject {
    NSString *fetchURL;
    OAConsumer *consumer;
    OAConsumer *twitterConsumer;
    OAToken *twitterToken;
    OAToken *accessToken;
    NSMutableArray *dataJSON;
    
}

@property (nonatomic, retain) NSString *fetchURL;

@property (nonatomic, retain) OAConsumer *consumer;
@property (nonatomic, retain) OAConsumer *twitterConsumer;
@property (nonatomic, retain) OAToken *twitterToken;
@property (nonatomic, retain) OAToken *accessToken;
@property (nonatomic, retain) NSMutableArray *dataJSON;

+ (GeeklistManager *) sharedInstance;

- (void)authorize;
- (NSMutableArray *)JSONData;
- (void)generateUserDetailsWith:(NSString *)gklstHandle;
- (void)generateCardList;

@end
