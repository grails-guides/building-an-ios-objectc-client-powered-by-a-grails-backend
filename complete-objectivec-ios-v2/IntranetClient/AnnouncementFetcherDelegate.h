
//
//  AnnouncementFetcherDelegate.h
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Announcement;

@protocol AnnouncementFetcherDelegate <NSObject>

- (void)announcementFetchingFailed;

- (void)announcementFetched:(Announcement *)announcement;

@end
