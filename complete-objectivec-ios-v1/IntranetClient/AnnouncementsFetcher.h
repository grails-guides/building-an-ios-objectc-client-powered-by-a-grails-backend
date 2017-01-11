//
//  AnnouncementsFetcher.m
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GrailsFetcher.h"

@protocol AnnouncementsFetcherDelegate;

@interface AnnouncementsFetcher : GrailsFetcher

- (id)initWithDelegate:(id<AnnouncementsFetcherDelegate>)delegate;

- (void)fetchAnnouncements;

- (void)fetchAnnouncement:(NSNumber *)primaryKey;

@end
