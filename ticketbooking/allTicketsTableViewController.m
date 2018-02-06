//
//  allTicketsTableViewController.m
//  ticketbooking
//
//  Created by Student-002 on 14/10/17.
//  Copyright © 2017 kaamini. All rights reserved.
//

#import "allTicketsTableViewController.h"
#import "customTableViewCell.h"
#import "ticketDetailViewController.h"
#import "singletonViewController.h"

@interface allTicketsTableViewController ()

@end

@implementation allTicketsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"customTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
      self.ticketNameArray = [[singletonViewController makesingleton].tempNameArray mutableCopy];
      self.ticketPriceArray = [[singletonViewController makesingleton].tempPriceArray mutableCopy];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _ticketNameArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.imgview.image=[UIImage imageNamed:@"tourism"];
    cell.nameLbl.text=[_ticketNameArray objectAtIndex:indexPath.row];
    NSString *tickPrice=[NSString stringWithFormat:@"%@",[_ticketPriceArray objectAtIndex:indexPath.row]];
    
    if([tickPrice isEqualToString:@"Ticket Booked"])
    {
        cell.priceLbl.text=[NSString stringWithFormat:@"%@",tickPrice]; //NSLog(@"%ld",(long)indexPath.row);
    }else{
         cell.priceLbl.text=[NSString stringWithFormat:@"Rs. %@",tickPrice]; //
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.ticketNameArray = [[singletonViewController makesingleton].tempNameArray mutableCopy];
    self.ticketPriceArray = [[singletonViewController makesingleton].tempPriceArray mutableCopy];
    
    [self.tableView reloadData];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *s=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ticketDetailViewController *dvc=[s instantiateViewControllerWithIdentifier:@"ticketDetailViewController"];
    dvc.tprice=[_ticketPriceArray objectAtIndex:indexPath.row];
    dvc.tname=[_ticketNameArray objectAtIndex:indexPath.row];
    dvc.rowNo=indexPath.row;
    
    customTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.hidden=true;
    [self.navigationController pushViewController:dvc animated:YES];
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
