//
//  ElementBuilderProtocol.h
//  IntranetClient
//
//  Created by Sergio del Amo on 10/01/2017.
//  Copyright © 2017 OCI. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ElementBuilderPr <NSObject>

- (id)newElementWithDictionary:(NSDictionary *)dict
                         error:(NSError **)error
          invalidJSONErrorCode:(NSInteger)invalidJSONErrorCode
          missingDataErrorCode:(NSInteger)missingDataErrorCode
                   errorDomain:(NSString *)errorDomain;

@end
