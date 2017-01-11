//
//  ElementBuilder.m
//  IntranetClient
//
//  Created by Sergio del Amo on 10/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElementBuilder : NSObject

- (NSArray *)arrayFromJSON:(NSString *)objectNotation
                       key:(NSString *)key
                     error:(NSError **)error
      invalidJSONErrorCode:(NSInteger)invalidJSONErrorCode
      missingDataErrorCode:(NSInteger)missingDataErrorCode
               errorDomain:(NSString *)errorDomain;

- (NSDictionary *)parseJSON:(NSString *)objectNotation
                      error:(NSError **)error
       invalidJSONErrorCode:(NSInteger)invalidJSONErrorCode
                errorDomain:(NSString *)errorDomain;
@end
