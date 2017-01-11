//
//  AnnouncementsTableViewDataSource.m
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import "AnnouncementsTableViewDelegate.h"
#import "Announcement.h"

@implementation AnnouncementsTableViewDelegate

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ( [self.announcements count] > indexPath.row ) {
        id obj = self.announcements[indexPath.row];
        if ( [obj isKindOfClass:[Announcement class]]) {
            Announcement *announcement = (Announcement *)obj;
            [[NSNotificationCenter defaultCenter] postNotificationName:kAnnouncementTappedNotification object:announcement userInfo:nil];
        }
    }
}


@end
