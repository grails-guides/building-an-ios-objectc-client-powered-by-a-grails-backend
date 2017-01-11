//
//  Announcement.h
//  IntranetClient
//
//  Created by Sergio del Amo on 10/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Announcement : NSObject

@property (nonatomic, copy)NSNumber *primaryKey;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *body;

@end
