#import "AnnouncementsFetcher.h"
#import "AnnouncementsFetcherDelegate.h"
#import "AnnouncementBuilder.h"

static NSInteger FAST_TIME_INTERVAL = 5.0;
static NSString *kAnnouncementsResourcePath = @"announcements";

@interface AnnouncementsFetcher () <NSURLSessionDelegate>

@property (nonatomic) NSURLSession *session;

@property ( nonatomic, weak) id<AnnouncementsFetcherDelegate> delegate;

@property ( nonatomic, strong) AnnouncementBuilder *builder;

@end

@implementation AnnouncementsFetcher

- (id)initWithDelegate:(id<AnnouncementsFetcherDelegate>)delegate {
    if(self = [super init]) {
        NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:configuration
                                                     delegate:self
                                                delegateQueue:[NSOperationQueue mainQueue]];
        
        self.delegate = delegate;
        self.builder = [[AnnouncementBuilder alloc] init];
    }
    return self;
}

- (void)fetchAnnouncements {
    
    [self fetchAnnouncementsWithCompletionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error) {
            if ( self.delegate ) {
                [self.delegate announcementsFetchingFailed];
            }
            return;
        }
        
        NSInteger statusCode = [((NSHTTPURLResponse*)response) statusCode];
        if(statusCode != 200) {
            if ( self.delegate ) {
                [self.delegate announcementsFetchingFailed];
            }
            return;
        }
        
        NSString *objectNotation = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSError *builderError;
        NSArray *announcements = [self.builder announcementsFromJSON:objectNotation error:&builderError];
        if(builderError) {
            if ( self.delegate ) {
                [self.delegate announcementsFetchingFailed];
            }
            return;
        }
        if ( self.delegate ) {
            [self.delegate announcementsFetched:announcements];
        }
        
    }];
}

- (void)fetchAnnouncementsWithCompletionHandler:(void (^)(NSData * data, NSURLResponse * response, NSError * error))completionHandler {
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:[self announcementsURLRequest] completionHandler:completionHandler];
    [dataTask resume];
}

- (NSURLRequest *)announcementsURLRequest {
    NSString *urlStr = [[kServerUrl stringByAppendingString:@"/"] stringByAppendingString:kAnnouncementsResourcePath];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url
                                                              cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                                          timeoutInterval:FAST_TIME_INTERVAL];
    [urlRequest setHTTPMethod:@"GET"];
    
    [[self headers] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL * stop) {
        [urlRequest setValue:obj forHTTPHeaderField:key];
    }];
    return urlRequest;
}

- (void)fetchAnnouncement:(NSNumber *)primaryKey {
    
}


#pragma mark - NSURLSessionDelegate

- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error {
    
}

/* If implemented, when a connection level authentication challenge
 * has occurred, this delegate will be given the opportunity to
 * provide authentication credentials to the underlying
 * connection. Some types of authentication will apply to more than
 * one request on a given connection to a server (SSL Server Trust
 * challenges).  If this delegate message is not implemented, the
 * behavior will be to use the default handling, which may involve user
 * interaction.
 */
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler {
    
}


- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session NS_AVAILABLE_IOS(7_0) {
    
}

@end
