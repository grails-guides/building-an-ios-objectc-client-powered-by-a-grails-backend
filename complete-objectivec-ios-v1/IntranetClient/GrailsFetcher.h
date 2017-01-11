#import <Foundation/Foundation.h>

static NSString *kServerUrl = @"http://192.168.1.41:8080"; // <1>
static NSString *kApiVersion = @"1.0"; // <2>
static NSString *kAnnouncementsResourcePath = @"announcements"; // <3>

@interface GrailsFetcher : NSObject

- (NSDictionary *)headers;

@end
