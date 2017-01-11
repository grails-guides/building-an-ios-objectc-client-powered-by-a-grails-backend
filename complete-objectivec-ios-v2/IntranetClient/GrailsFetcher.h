//
//  GrailsFetcher.m
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *kServerUrl = @"http://192.168.1.41:8080";
static NSString *kApiVersion = @"2.0";
static NSString *kAnnouncementsResourcePath = @"announcements";
static NSInteger FAST_TIME_INTERVAL = 5.0;

@interface GrailsFetcher : NSObject

@property (nonatomic, strong) NSURLSession *session;

- (NSURLRequest *)getURLRequestWithUrlString:(NSString *)urlString
                                 cachePolicy:(NSURLRequestCachePolicy)cachePolicy
                             timeoutInterval:(NSTimeInterval)timeoutInterval;

@end
