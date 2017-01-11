//
//  AnnouncementBuilder.h
//  IntranetClient
//
//  Created by Sergio del Amo on 10/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ElementBuilder.h"

@class Announcement;

extern NSString *kAnnouncementBuilderErrorDomain;

enum {
    kAnnouncementBuilderInvalidJSONError,
    kAnnouncementBuilderMissingDataError,
};

@interface AnnouncementBuilder : ElementBuilder

- (NSArray *)announcementsFromJSON:(NSString *)objectNotation
                             error:(NSError **)error;

- (Announcement *)announcementFromJSON:(NSString *)objectNotation
                                 error:(NSError **)error;

@end
