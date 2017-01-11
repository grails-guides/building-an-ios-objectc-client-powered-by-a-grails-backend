//
//  AnnouncementFetcher.m
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GrailsFetcher.h"
#import "AnnouncementFetcherDelegate.h"

@interface AnnouncementFetcher : GrailsFetcher

- (id)initWithDelegate:(id<AnnouncementFetcherDelegate>)delegate;

- (void)fetchAnnouncement:(NSNumber *)primaryKey;

@end
