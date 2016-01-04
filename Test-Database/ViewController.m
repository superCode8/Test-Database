//
//  ViewController.m
//  Test-Database
//
//  Created by xixing1 on 16/1/5.
//  Copyright © 2016年 superCode. All rights reserved.
//

#import "ViewController.h"
#import <FMDB/FMDatabase.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSString *document = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)[0];
    NSString *documentPath = [document stringByAppendingString:@"mySQL.sqlite"];
    
    FMDatabase *database = [FMDatabase databaseWithPath:documentPath];
    if ([database open]) {
        
        [self useFMDatabase:database];

        [database close];
    }
    
    

}

- (void)useFMDatabase:(FMDatabase*)database
{
    //创建表
    NSString *createTable = @"create table if not exits Users(id integer primary key,name text,age integer,sex boolean)";
    [database executeQuery:createTable];
    
    //插入记录
    NSString *insertData = @"insert into Users(name,age,sex)values(?,?,?)";
    [database executeQuery:insertData,@"helloworld",@18,@YES];
    [database executeQuery:insertData,@"star",@20,@YES];
    [database executeQuery:insertData,@"lucky",@22,@NO];
    
    //更新记录
    NSString *updateData = @"update Users set name = ok where age = 20";
    [database ];
    
    //删除记录
    //查找记录
    //删除记录
    //删除表

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SQL
//    create table if not exits users(id integer primary key,name text,age integer,height double,is_married boolean)

//        insert into users(name,age,height,is_married)values('helloworld','18','1.70',0)
//        select name,age from users
//        select * from users
//        select name from users where age < 18 and is_married = 1

//        update users set is_married = 1 where id = 2

//        delete from users

//        drop table users

@end
