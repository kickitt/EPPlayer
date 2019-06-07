//
//  RBServerManager.m
//  EPPlayer
//
//  Created by Roman Berezin on 6/1/19.
//  Copyright © 2019 Roman Berezin. All rights reserved.
//

#import "RBServerManager.h"
#import "AFNetworking/AFNetworking.h"

@interface RBServerManager()
@property (strong, nonatomic) AFHTTPSessionManager* sessionManager;

@end
@implementation RBServerManager

+ (RBServerManager*) sharedManager{
    
    static RBServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RBServerManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSURL* url = [NSURL URLWithString:@"http://portal.d-tv.tv/stalker_portal/server/load.php"];
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    return self;
}




- (void) getChannelsWithOffset:(NSInteger) offset limit:(NSInteger) limit onSuccess:(void(^)(NSArray* channels)) success onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure; {
    
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"itv",@"type",
                            @"get_all_channels",@"action",
                            @"1-xml",@"JsHttpRequest",nil];
    
    
    [self.sessionManager GET:@"get_all_channels"
                  parameters:params
                     headers:nil
                    progress:nil
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         NSLog(@"JSON: %@", responseObject);
                     }
                     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         NSLog(@"Error: %@", error);
                     }];
    
}



@end
