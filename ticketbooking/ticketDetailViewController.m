//
//  ticketDetailViewController.m
//  ticketbooking
//
//  Created by Student-002 on 14/10/17.
//  Copyright © 2017 kaamini. All rights reserved.
//

#import "ticketDetailViewController.h"
#import "allTicketsTableViewController.h"
#import "singletonViewController.h"

@interface ticketDetailViewController ()

@end

@implementation ticketDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _bookTicketBtn.enabled=YES;
    _nameLbl.text=_tname;
    if([_tprice isEqualToString:@"Ticket Booked"])
    {
        _priceLbl.text=[NSString stringWithFormat:@"%@",_tprice];
        _bookTicketBtn.enabled=NO;
        
    }else{
        _priceLbl.text=[NSString stringWithFormat:@"Rs. %@",_tprice];
         _bookTicketBtn.enabled=YES;
    }
    
}

- (IBAction)bookTicket:(id)sender {
    
    allTicketsTableViewController *atvc=[[allTicketsTableViewController alloc]init];
    singletonViewController *object=[singletonViewController makesingleton];
    [object.tempPriceArray replaceObjectAtIndex:_rowNo withObject:@"Ticket Booked"];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
