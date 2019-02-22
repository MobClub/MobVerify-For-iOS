//
//  MobVerifyDemoTests.m
//  MobVerifyDemoTests
//
//  Created by hower on 2018/12/28.
//  Copyright © 2018年 mob. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <MobVerify/MobVerify.h>

@interface MobVerifyDemoTests : XCTestCase

@end

#define MVLog(s, ...) NSLog(@"\n\n---------------------------------------------------\n %s[line:%d] \n %@ \n---------------------------------------------------\n", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])


@implementation MobVerifyDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


//云验证
- (void)testCloudVerify
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"testCloudVerify"];

    [MobVerify cloudVerifyWithPhoneNumber:@"18588558175" zone:@"86" template:@"1319972" result:^(NSError *error) {
        
        if(error)
        {
            
            //验证不通过，启用了短信验证
            if(error.code == 6119003)
            {
                MVLog(@"启用了短信验证");
            }
            else
            {
                XCTAssert(!error);
            }
            
        }
        
        [expectation fulfill];
        
    }];
    
    
    [self waitForExpectationsWithTimeout:60 handler:^(NSError *error) {
        
        MVLog(@"Over");
    }];
}


- (void)testCloudVerifyNoBlock
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"testCloudVerifyNoBlock"];
    
    [MobVerify cloudVerifyWithPhoneNumber:@"18588558175" zone:@"86" template:@"1319972" result:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:60 handler:^(NSError *error) {
        
        MVLog(@"Over");
    }];
}


- (void)testCloudVerifyNoTemplate
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"testCloudVerifyNoTemplate"];
    
    [MobVerify cloudVerifyWithPhoneNumber:@"18588558175" zone:@"86" template:nil result:^(NSError *error) {
        
        XCTAssert(error);
        [expectation fulfill];
        
    }];
    
    
    [self waitForExpectationsWithTimeout:60 handler:^(NSError *error) {
        
        MVLog(@"Over");
    }];
}

//短信验证
- (void)testCodeVerify
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"testCodeVerify"];
    //@"86"
    [MobVerify verifyWithCode:@"4502" phoneNumber:@"18588558175" zone:@"86" result:^(NSError *error) {
        
        XCTAssert(!error);

        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        
        MVLog(@"Over");
    }];
}


- (void)testCodeVerifyNoBlock
{
    XCTestExpectation *expectation = [self expectationWithDescription:@"testCodeVerifyNoBlock"];
    
    [MobVerify verifyWithCode:@"4502" phoneNumber:@"18588558175" zone:@"86" result:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [expectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        
        MVLog(@"Over");
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
