//
//  ViewController.m
//  TableViewEdit
//
//  Created by Cyrilshanway on 2014/12/25.
//  Copyright (c) 2014年 Cyrilshanway. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController
{
    NSMutableArray *dataSource;
    NSArray *detailDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataSource = [NSMutableArray arrayWithObjects: @"Message1", @"Message2", @"Message3",@"Message4", @"Message5", @"Message6",@"Message7", @"Message8", nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate
//delegate (都是optional)
//回傳多少個區段
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

//datasource delegate(require)
/*
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
 */
//回傳每個區段要顯示多少列
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataSource.count;
}
//不要做任何運算(畫面會卡住，運算，create)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *requestIdentifier = @"HelloCell";
    static NSString *requestIdentifier2 = @"HelloCell2";
    
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:requestIdentifier];
            
            //value2-textLabel和detailLabel會連在一起
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier];
            //cell.textLabel.textColor = [UIColor whiteColor];
            
            cell.textLabel.textColor = [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
            //預設白色，調整tableView的顏色-11/24
            cell.backgroundColor = [UIColor clearColor];
            //字型
            //cell.textLabel.font = [UIFont systemFontOfSize:20.f];//20.f
            cell.textLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:20.0f];//20.f
            
            
            //
            //cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
            cell.detailTextLabel.font = [UIFont fontWithName:@"apfino" size:14.0f];
            
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
            break;
        case 1:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:requestIdentifier2];
            
            //value2-textLabel和detailLabel會連在一起
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier2];
            //cell.textLabel.textColor = [UIColor whiteColor];
            
            cell.textLabel.textColor = [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
            //預設白色，調整tableView的顏色-11/24
            cell.backgroundColor = [UIColor clearColor];
            //字型
            //cell.textLabel.font = [UIFont systemFontOfSize:20.f];//20.f
            cell.textLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:20.0f];//20.f
            
            
            //
            //cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
            cell.detailTextLabel.font = [UIFont fontWithName:@"apfino" size:14.0f];
            
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
        }
            break;
            
        default:
            break;
    }
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:requestIdentifier];
    /*
     if (!cell) {
     //value2-textLabel和detailLabel會連在一起
     cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:requestIdentifier];
     //cell.textLabel.textColor = [UIColor whiteColor];
     
     cell.textLabel.textColor = [UIColor colorWithRed:241.0f/255.0f green:244.0f/255.0f blue:239.0f/255.0f alpha:1.0f];
     //預設白色，調整tableView的顏色-11/24
     cell.backgroundColor = [UIColor clearColor];
     //字型
     //cell.textLabel.font = [UIFont systemFontOfSize:20.f];//20.f
     cell.textLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-SemiBold" size:20.0f];//20.f
     
     
     //
     //cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
     cell.detailTextLabel.font = [UIFont fontWithName:@"apfino" size:14.0f];
     
     cell.selectionStyle = UITableViewCellSelectionStyleGray;
     
     }
     */
    cell.textLabel.text = dataSource[indexPath.row];
    //cell.detailTextLabel.text = detailDataSource[indexPath.row];
    
        return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    //從資料模型中刪除
    [dataSource removeObjectAtIndex:indexPath.row];
    
    //要求表格視圖重新刷新
    [tableView reloadData];
}
@end
