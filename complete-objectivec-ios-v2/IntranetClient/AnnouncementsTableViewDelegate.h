//
//  AnnouncementsTableViewDelegate.m
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *kAnnouncementTappedNotification = @"AnnouncementTappedNotification";

@interface AnnouncementsTableViewDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, strong) NSArray *announcements;

@end
