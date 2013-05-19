//
//  GeeklistManager.m
//  GeeklistLib
//
//  Created by James Petersen on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GeeklistManager.h"
#import "SBJson.h"
//#import "GeeklistCommon.h"
#define kConsumerKey	          @"H169_GXY1NVcEwF6PlfLqJXdlto"
#define kConsumerSecret		      @"VuOz0izW0YtWxPVsmpgV8Z9wpP5jVo0umyzlI7M7EzA"

static GeeklistManager *_instance;

@interface GeeklistManager (Private)
- (NSString *)responseType:(NSString *)postType;
- (void)dataGET:(NSString *)type withParams:(NSMutableDictionary *)param;
- (void)dataPOST:(NSString *)type withParams:(NSMutableDictionary *)param;
@end

@implementation GeeklistManager
@synthesize fetchURL;
@synthesize consumer, accessToken, dataJSON;
@synthesize twitterConsumer, twitterToken;


+ (GeeklistManager *)sharedInstance
{
	@synchronized(self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

- (void)authorize {
    if (self.consumer == nil)
        self.consumer = [[OAConsumer alloc] initWithKey:kConsumerKey
                                                 secret:kConsumerSecret];
    
    OAMutableURLRequest *request;
    OADataFetcher *fetcher;
    
    NSURL *url = [NSURL URLWithString:@"http://api.geekli.st/v1/oauth/request_token"];
    
    request = [[[OAMutableURLRequest alloc] initWithURL:url
                                               consumer:self.consumer
                                                  token:nil
                                                  realm:nil
                                      signatureProvider:nil] autorelease];
    [request setHTTPMethod:@"POST"];
    
    OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_callback" value:@"oob"];
    NSArray *params = [NSArray arrayWithObject:p0];
    [request setParameters:params];
    
    fetcher = [[[OADataFetcher alloc] init] autorelease];
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(requestTokenTicket:didFinishWithData:)
                  didFailSelector:@selector(requestTokenTicket:didFailWithError:)];
    
    [p0 release];
}

#pragma mark Generate Data Sources

- (void)dataPOST:(NSString *)type withParams:(NSMutableDictionary *)param {
    if (self.accessToken != nil) {
        OAMutableURLRequest *request;
        OADataFetcher *fetcher;
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.geekli.st/v1/%@", type]];
        
        request = [[[OAMutableURLRequest alloc] initWithURL:url
                                                   consumer:self.consumer
                                                      token:self.accessToken
                                                      realm:nil
                                          signatureProvider:nil] autorelease];
        
        [request setHTTPMethod:@"POST"];
        
        NSMutableArray *params = [[NSMutableArray alloc] initWithCapacity:0];        
        
        for (int i=0; i < [[param allKeys] count]; i++) {
            OARequestParameter *x1 = [[OARequestParameter alloc] initWithName:[[param allKeys] objectAtIndex:i] value:[[param allValues] objectAtIndex:i]];
            [params addObject:x1];
            [x1 release];
        }
        
        [request setParameters:params];        
        
        fetcher = [[[OADataFetcher alloc] init] autorelease];
        [fetcher fetchDataWithRequest:request
                             delegate:self
                    didFinishSelector:@selector(objectRequestTokenTicket:didFinishWithData:)
                      didFailSelector:@selector(objectRequestTokenTicket:didFailWithError:)];
        [params release];
    }
}

- (void)dataGET:(NSString *)type withParams:(NSMutableDictionary *)param {
    if (self.accessToken != nil) {
        OAMutableURLRequest *request;
        OADataFetcher *fetcher;
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.geekli.st/v1/%@", type]];
        
        request = [[[OAMutableURLRequest alloc] initWithURL:url
                                                   consumer:self.consumer
                                                      token:self.accessToken
                                                      realm:nil
                                          signatureProvider:nil] autorelease];
        
        [request setHTTPMethod:@"GET"];
        
        NSMutableArray *params = [[NSMutableArray alloc] initWithCapacity:0];        
        
        for (int i=0; i < [[param allKeys] count]; i++) {
            OARequestParameter *x1 = [[OARequestParameter alloc] initWithName:[[param allKeys] objectAtIndex:i] value:[[param allValues] objectAtIndex:i]];
            [params addObject:x1];
            [x1 release];
        }
        
        [request setParameters:params];        
        
        fetcher = [[[OADataFetcher alloc] init] autorelease];
        [fetcher fetchDataWithRequest:request
                             delegate:self
                    didFinishSelector:@selector(objectRequestTokenTicket:didFinishWithData:)
                      didFailSelector:@selector(objectRequestTokenTicket:didFailWithError:)];
        [params release];
    }
}

- (void)generateCardList
{
    if (self.accessToken != nil) {
        [self dataGET:@"user/cards" withParams:nil];
    }
}

- (void)generateUserDetailsWith:(NSString *)gklstHandle {
    if (self.accessToken != nil) {
        [self dataGET:[NSString stringWithFormat:@"users/%@", gklstHandle] withParams:nil];
    }
}

- (NSString *)responseType:(NSString *)postType
{
    NSString *sendType = @"";
    
    if ([postType isEqualToString:@"micros"]) {
        sendType = @"status";
    } else if ([postType isEqualToString:@"cards"]) {
        sendType = @"headline";
    }
    
    return sendType;
}


#pragma mark Output Data Sources

- (NSMutableArray *)JSONData
{
    return self.dataJSON;
}



#pragma mark Request Token Tickets

- (void)objectRequestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
    
    if (TARGET_IPHONE_SIMULATOR) {
        NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@", response);
    }

    if (ticket.didSucceed) {
        NSString *responseBody = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        self.dataJSON = [responseBody JSONValue];
        [responseBody release];
    }
}



- (void)requestTokenTicket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
    
    if (ticket.didSucceed) {
        OAMutableURLRequest *request;
        NSString *responseBody = [[NSString alloc] initWithData:data
                                                       encoding:NSUTF8StringEncoding];
        
        if (self.accessToken != nil) {
            [self.accessToken release];
            self.accessToken = nil;
        }
        
        self.accessToken = [[OAToken alloc] initWithHTTPResponseBody:responseBody];
        [responseBody release];
        
        NSURL *url = [NSURL URLWithString:@"http://api.geekli.st/v1/oauth/authorize"];
        
        request = [[[OAMutableURLRequest alloc] initWithURL:url
                                                   consumer:self.consumer
                                                      token:self.accessToken
                                                      realm:nil
                                          signatureProvider:nil] autorelease];
        
        
        OARequestParameter *p0 = [[OARequestParameter alloc] initWithName:@"oauth_token"
                                                                    value:self.accessToken.key];
        NSArray *params = [NSArray arrayWithObject:p0];
        [request setParameters:params];
        //[request prepare];
        [p0 release];
    }
}

- (void)objectRequestTokenTicket:(OAServiceTicket *)ticket didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}


@end
