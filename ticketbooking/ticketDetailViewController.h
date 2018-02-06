//
//  ticketDetailViewController.h
//  ticketbooking
//
//  Created by Student-002 on 14/10/17.
//  Copyright © 2017 kaamini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ticketDetailViewController : UIViewController

@property(nonatomic,retain)NSString *tname,*tprice;
@property NSInteger rowNo;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UIButton *bookTicketBtn;
@property(nonatomic,retain)NSMutableArray *namearray,*priceArray;

- (IBAction)bookTicket:(id)sender;

@end
