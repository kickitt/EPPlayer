//
//  RBServerManager.h
//  EPPlayer
//
//  Created by Roman Berezin on 6/1/19.
//  Copyright © 2019 Roman Berezin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RBServerManager : NSObject


+ (RBServerManager*) sharedManager;

- (void) getChannelsWithOffset:(NSInteger) offset limit:(NSInteger) limit onSuccess:(void(^)(NSArray* channels)) success onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;


@end

NS_ASSUME_NONNULL_END
