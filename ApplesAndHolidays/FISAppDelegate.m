//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}


-(NSArray *) pickApplesFromFruits: (NSArray *) fruits {
    
    NSMutableArray *appleBasket = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [fruits count]; i++) {
        if ([fruits[i] isEqualToString:@"apple"])
            [appleBasket addObject: @"apple"];
    }
    return appleBasket;
}


-(NSArray *) holidaysInSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    
    return [database[season]allKeys];
}


-(NSArray *) suppliesInHoliday: (NSString *) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    
    return database[season][holiday];
    
}

-(BOOL) holiday: (NSString *) holiday isInSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    
//        return whether or not the submitted "season" contains a key that matches the "holiday" argument
    
    return [[database[season]allKeys] containsObject:holiday];
    
}
-(BOOL) supply: (NSString *) supply isInHoliday: (NSString * ) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    
//    return whether or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string.
    
    //NSLog(@"%@", supply);
   // NSArray *test = database[season][holiday];
    //NSLog(@"%@", test);
    
    return [database[season][holiday]containsObject:supply];
}

-(NSDictionary *) addHoliday: (NSString *) holiday toSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    //    create a new key-value pair in the submitted "season" key's sub-dictionary that uses the submitted "holiday" as the key
    //    and sets up an empty mutable array as its value.

     database[season][holiday] = [[NSMutableArray alloc] init];
    return database;
}
-(NSDictionary *) addSupply:(NSString *) supply toHoliday: (NSString *) holiday inSeason: (NSString *) season inDatabase: (NSDictionary *) database {
    
    // insert the submitted "supply" argument into the mutable array of the submitted "holiday" key in the sub-dictionary of the submitted "season" key.
    
    [database[season][holiday] addObject:supply];
    
    return database;
}


@end