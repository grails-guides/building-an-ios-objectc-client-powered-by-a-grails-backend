#import "GrailsFetcher.h"

@implementation GrailsFetcher

- (NSDictionary *)headers {
    return @{@"Accept-Version": kApiVersion};
}

@end
