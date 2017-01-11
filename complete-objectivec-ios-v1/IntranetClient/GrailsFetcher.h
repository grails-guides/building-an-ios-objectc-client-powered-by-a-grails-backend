#import <Foundation/Foundation.h>

static NSString *kServerUrl = @"http://192.168.1.41:8080";
static NSString *kApiVersion = @"1.0";

@interface GrailsFetcher : NSObject

- (NSDictionary *)headers;

@end
