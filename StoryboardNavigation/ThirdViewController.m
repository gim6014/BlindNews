//
//  ThirdViewController.m
//  StoryboardNavigation
//
//  Created by 김사랑 on 2014. 1. 26..
//  Copyright (c) 2014년 김사랑. All rights reserved.
//

#import "ThirdViewController.h"
#import "FirstViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController
@synthesize itemlist;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     itemlist=[[NSMutableArray alloc]initWithObjects:@"주요뉴스",@"속보",@"정치",@"사회",@"스포츠",@"연예", nil];
     num=0;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [itemlist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text=[itemlist objectAtIndex:indexPath.row];
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier]isEqualToString:@"SecondeTableIdentifier"])
    {
        FirstViewController *viewController=[segue destinationViewController];
        NSIndexPath *currentIndexPath=[self.tableView indexPathForSelectedRow];
        
      
        //buffer=newsdata[currentindex];
        
               //[NSString stringWithFormat:@"Row %d has been selected",currentIndexPath.row];
        num=currentIndexPath.row;
        viewController.check = @"category";
        switch (num) {
            case 0:
                viewController.urldata=@"http://myhome.chosun.com/rss/www_section_rss.xml";
                
                break;
                
            case 1:
                viewController.urldata=@"http://www.chosun.com/site/data/rss/rss.xml";
                
                break;
                
            case 2:
                viewController.urldata=@"http://www.chosun.com/site/data/rss/politics.xml";
                
                break;
                
            case 3:
                viewController.urldata=@"http://www.chosun.com/site/data/rss/national.xml";
               
                break;
                
            case 4:
                viewController.urldata=@"http://www.chosun.com/site/data/rss/sports.xml";
                
                break;
                
            case 5:
                viewController.urldata=@"http://www.chosun.com/site/data/rss/ent.xml";
                
                break;
                
            default:
                break;
        }
        
    }
    
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (void)dealloc {
   [super dealloc];
    [_categoryurl release];
    
}
@end