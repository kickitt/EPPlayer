//
//  AppDelegate.h
//  EPPlayer
//
//  Created by Roman Berezin on 6/1/19.
//  Copyright © 2019 Roman Berezin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

