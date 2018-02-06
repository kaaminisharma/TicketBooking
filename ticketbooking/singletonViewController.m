//
//  singletonViewController.m
//  ticketbooking
//
//  Created by Student-002 on 14/10/17.
//  Copyright © 2017 kaamini. All rights reserved.
//

#import "singletonViewController.h"

singletonViewController *temp=nil;
@interface singletonViewController ()

@end

@implementation singletonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(singletonViewController *)makesingleton
{
    if(temp==nil)
    {
        temp=[[singletonViewController alloc]init];
        
        
        NSMutableArray *namearray=[[NSMutableArray alloc]initWithObjects:@"Goa",@"Mumbai",@"Pune",@"Mussourie",@"Darjeeling", nil];
        NSMutableArray *pricearray=[[NSMutableArray alloc]initWithObjects:@"1000",@"2000",@"3000",@"4000",@"5000", nil];
        [temp setTempNameArray:namearray];
        [temp setTempPriceArray:pricearray];
    }
    return temp;
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
