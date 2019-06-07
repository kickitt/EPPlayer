//
//  ViewController.m
//  EPPlayer
//
//  Created by Roman Berezin on 6/1/19.
//  Copyright © 2019 Roman Berezin. All rights reserved.
//

#import "ViewController.h"
#import "RBServerManager.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray* channelsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.channelsArray = [NSMutableArray array];
    [self getChannelsFromServer];
}

#pragma mark - API

- (void) getChannelsFromServer {
    
    [[RBServerManager sharedManager]
     getChannelsWithOffset:[self.channelsArray count]
     limit:20
     onSuccess:^(NSArray * _Nonnull channels) {
        [self.channelsArray addObjectsFromArray:channels];
        [self.tableView reloadData];
    }
    
     onFailure:^(NSError * _Nonnull error, NSInteger statusCode) {
        NSLog(@"error = %@, code = %ld", [error localizedDescription], (long)statusCode);
     }];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.channelsArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identifier = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

@end
