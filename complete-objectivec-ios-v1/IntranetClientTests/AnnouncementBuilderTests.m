#import <XCTest/XCTest.h>
#import "AnnouncementBuilder.h"
#import "Announcement.h"

@interface AnnouncementBuilderTests : XCTestCase
{
    AnnouncementBuilder *builder;
    NSString *announcementsJSON;
}
@end

@implementation AnnouncementBuilderTests

- (void)setUp {
    [super setUp];
    builder = [[AnnouncementBuilder alloc] init];
    announcementsJSON = [self fixture];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSError *error;
    XCTAssertNotNil(announcementsJSON);
    NSArray *announcements = [builder announcementsFromJSON:announcementsJSON error:&error];
    XCTAssertNil(error);
    XCTAssertEqual([announcements count], (NSUInteger)6, @"The builder should have parsed 6 announcements");
    
    for ( id obj in announcements ) {
        XCTAssertTrue([obj isKindOfClass:[Announcement class]]);
        Announcement *announcement = (Announcement *)obj;
        XCTAssertNotNil(announcement.title);
        XCTAssertNotNil(announcement.primaryKey);
        XCTAssertNotNil(announcement.body);
    }
}

#pragma mark - Private methods

- (NSString *)fixture {
    NSBundle *bundle =  [NSBundle bundleForClass:[AnnouncementBuilderTests class]];
    NSString *path = [bundle pathForResource:@"announcements" ofType:@"json" inDirectory:nil];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:path] options:@{} completionHandler:nil];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    
    return content;
}

@end
