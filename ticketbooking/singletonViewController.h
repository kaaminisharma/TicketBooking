//
//  singletonViewController.h
//  ticketbooking
//
//  Created by Student-002 on 14/10/17.
//  Copyright © 2017 kaamini. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface singletonViewController : UIViewController

@property(nonatomic,retain)NSMutableArray *tempNameArray,*tempPriceArray;
+(singletonViewController *)makesingleton;
@end
