//
//  main.m
//  Stringz
//
//  Created by YASSER ALTAMIMI on 03/01/1440 AH.
//  Copyright © 1440 YASSER ALTAMIMI. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // create an NSError pointer to use if the writing failed
        // we don't init the pointer because it will be inited if there is a faileier
        NSError *errorWrite;
        
        // creating a mutable stirng to write to the file
        NSMutableString *writingtxt = [[NSMutableString alloc] init];
        
        // adding 10 lines to the string
        for (int i = 0; i < 10; i++) {
            [writingtxt appendString:@"Yasser is cool\n"];
        }
        
        // create a path
        NSString *path = @"/tmp/cool.txt";
        
        // writing it to the file and passing in the error pointer by refrence so the method can access it and write to it the error
        BOOL written = [writingtxt writeToFile:path
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&errorWrite];
        
        // logging writing has finished
        if (written) {
            NSLog(@"file has been created and saved in path: %@", path);
        } else {
            
            // if failed: we call localizedDescription on the error and log it to give us a simple prescrption of the error
            NSLog(@"failed to create the file: %@", [errorWrite localizedDescription]);
        }
        
        NSError *errorRead;
        
        // create the path to read from
        NSString *pathToBeRead = @"/etc/resolv.conf";
        
        // read that text and put it in a string
        NSString *read = [[NSString alloc] initWithContentsOfFile:pathToBeRead
                                                         encoding:NSUTF8StringEncoding
                                                            error:&errorRead];
        
        // success: Yes: log it, No: show error message
        if (read) {
            NSLog(@"the file in path: %@ contain: \n %@",pathToBeRead, read);
        } else {
            
            // we used the localizedFailureReason method to show reason of failiure
            NSLog(@"filed to read the file, %@", [errorRead localizedFailureReason]);
            
        }
        
        
    }
    return 0;
}
