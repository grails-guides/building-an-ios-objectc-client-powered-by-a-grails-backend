//
//  GrailsFetcher.m
//  IntranetClient
//
//  Created by Sergio del Amo on 11/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import "GrailsFetcher.h"

@implementation GrailsFetcher

- (NSDictionary *)headers {
    return @{@"Accept-Version": kApiVersion};
}

@end
