//
//  DBConnection.m
//  TestMasterPrep
//
//  Created by batch 1 on 24/09/13.
//  Copyright (c) 2013 batch 1. All rights reserved.
//

#import "DBConnection.h"
#import "DataClass.h"
//#import "DataClass2.h"
//#import "myclass.h"

static DBConnection *shareinstance=nil;
static sqlite3 *DB=nil;
static sqlite3_stmt *statement;
//static NSString *dbpath=nil;
NSString *dbpath;

@implementation DBConnection

+(DBConnection*)getshared
{
    if (!shareinstance) {
        shareinstance=[[super allocWithZone:NULL]init];
        [shareinstance connectdb];
    }
    return shareinstance;

}

-(void)connectdb
{   //to copy database from bundle to local library
    
    NSString *pathsToReources = [[NSBundle mainBundle] resourcePath];
	NSString *yourOriginalDatabasePath = [pathsToReources stringByAppendingPathComponent:@"Task1103.sqlite"];
	NSArray *pathsToDocuments = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [pathsToDocuments objectAtIndex: 0];
    
    dbpath = [documentsDirectory stringByAppendingPathComponent:@"Task1103.sqlite"];
	
    
    
    NSFileManager *fmgr=[NSFileManager defaultManager];
    if (![fmgr isReadableFileAtPath:dbpath])
    {
        if ([fmgr copyItemAtPath: yourOriginalDatabasePath toPath: dbpath error: NULL] != YES)
			NSAssert2(0, @"Fail to copy database from %@ to %@", yourOriginalDatabasePath, dbpath);
    }
    
    
    // get path of database from local library
    
    //NSArray *dirPaths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *dir = dirPaths[0];
    //dbpath=[[NSString alloc]initWithString:[dbpath stringByAppendingPathComponent:@"Task1103.sqlite"]];

}


-(BOOL)InsertData: (NSString *) strName : (NSString *) strAddress : (NSString *) strPhone
{
    
    const char *DBpath =[dbpath UTF8String];
    if (sqlite3_open(DBpath, &DB)==SQLITE_OK)
    {
        NSString *qry=[NSString stringWithFormat:@"INSERT INTO contactDetail (Name, Address, Phone ) VALUES (\"%@\", \"%@\", \"%@\")",strName, strAddress, strPhone];
        const char *decode_insert=[qry UTF8String];
        sqlite3_prepare_v2(DB, decode_insert, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
            
        {
            return YES;
        }
        else
        {
            return NO;
        }
        sqlite3_finalize(statement);
        sqlite3_close(DB);

    }
    
    return NO;
    sqlite3_finalize(statement);
    sqlite3_close(DB);


}

-(BOOL)UpdateData: (NSString *) strName : (NSString *) strAddress : (NSString *) strPhone  
{
    const char *DBpath =[dbpath UTF8String];
    if (sqlite3_open(DBpath, &DB)==SQLITE_OK)
    {
        NSString *qry=[NSString stringWithFormat:@"UPDATE contactDetail SET Address = \"%@\", Phone = \"%@\" WHERE Name = \"%@\"", strAddress, strPhone,strName];
        const char *decode_insert=[qry UTF8String];
        sqlite3_prepare_v2(DB, decode_insert, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
            
        {
            return YES;
        }
        else
        {
            return NO;
        }
        sqlite3_finalize(statement);
        sqlite3_close(DB);
        
    }
    
    return NO;
    sqlite3_finalize(statement);
    sqlite3_close(DB);
    

}

-(BOOL)delData : (NSString *) strName : (NSString *) strAddress : (NSString *) strPhone
{
    const char *DBpath =[dbpath UTF8String];
    if (sqlite3_open(DBpath, &DB)==SQLITE_OK)
    {
        NSString *qry=[NSString stringWithFormat:@"DELETE FROM contactDetail WHERE Name=\"%@\" Address=\"%@\" Phone=\"%@\"",strName, strAddress, strPhone];
        const char *decode_insert=[qry UTF8String];
        sqlite3_prepare_v2(DB, decode_insert, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
            
        {
            return YES;
        }
        else
        {
            return NO;
        }
        sqlite3_finalize(statement);
        sqlite3_close(DB);
        
    }
    
    return NO;
    sqlite3_finalize(statement);
    sqlite3_close(DB);
    
    

}

- (NSMutableArray *)findByName: (NSString *) strName
{
    
    const char *DBpath =[dbpath UTF8String];
    NSMutableArray *arrData=[[NSMutableArray alloc] init];
    if (sqlite3_open(DBpath, &DB)==SQLITE_OK)
    {
        NSString *qry=[NSString stringWithFormat:@"SELECT Name, Address, Phone FROM contactDetail WHERE Name = \"%@\"",strName];
        
        const char *decode_qry=[qry UTF8String];
        sqlite3_prepare_v2(DB, decode_qry, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(DB,decode_qry, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *nameField = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                
                NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                NSString *phoneField = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                
                
               
                DataClass *shrObj =[[DataClass alloc] init];
                
                shrObj.strDCName=nameField;
                shrObj.strDCAddress=addressField;
                shrObj.strDCPhone=phoneField;
                
                
                [arrData addObject:shrObj];
                
                
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
       return arrData;
    }
    return nil;
    
}

- (NSMutableArray *)SelectAllData
{
    const char *DBpath =[dbpath UTF8String];
    NSMutableArray *arrData=[[NSMutableArray alloc] init];
    if (sqlite3_open(DBpath, &DB)==SQLITE_OK)
    {
        NSString *qry=[NSString stringWithFormat:@"SELECT Name, Address, Phone FROM contactDetail"];
        
        const char *decode_qry=[qry UTF8String];
        sqlite3_prepare_v2(DB, decode_qry, -1, &statement, NULL);
        
        if (sqlite3_prepare_v2(DB,decode_qry, -1, &statement, NULL) == SQLITE_OK)
        {
            
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSString *nameField = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
                
                NSString *addressField = [[NSString alloc] initWithUTF8String:(const char *) sqlite3_column_text(statement, 1)];
                
                NSString *phoneField = [[NSString alloc]initWithUTF8String:(const char *)sqlite3_column_text(statement, 2)];
                
                
                
                DataClass *shrObj =[[DataClass alloc] init];
                
                shrObj.strDCName=nameField;
                shrObj.strDCAddress=addressField;
                shrObj.strDCPhone=phoneField;
                
                
                [arrData addObject:shrObj];
                
                
            }
            
            sqlite3_finalize(statement);
        }
        sqlite3_close(DB);
        return arrData;
    }
    return nil;
    

}




@end
