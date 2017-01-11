//
//  AnnouncementsFetcherDelegate.h
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AnnouncementsFetcherDelegate <NSObject>

- (void)announcementsFetchingFailed;

- (void)announcementsFetched:(NSArray *)announcements;


@end
