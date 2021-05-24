#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth: monthNumber];

    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
    if ([dateComponents isValidDateInCalendar: [NSCalendar currentCalendar]])
        {NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMMM"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_EN"];
    NSString *dateString = [dateFormatter stringFromDate:date];
        return dateString;}
    else return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSISO8601DateFormatter *dateFormatter = [[NSISO8601DateFormatter alloc] init];
    NSInteger dd = [[NSCalendar currentCalendar] component:NSCalendarUnitDay fromDate:[dateFormatter dateFromString:date]];
    return dd;
    //return 0;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:unitFlags fromDate:date];
    
    if ([comps isValidDateInCalendar: [NSCalendar currentCalendar]]){
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"E"];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
    }
    else return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *x = [NSDate now];
    return [[NSCalendar currentCalendar] component:NSCalendarUnitWeekOfYear fromDate: x] == [[NSCalendar currentCalendar] component:NSCalendarUnitWeekOfYear fromDate:date];
}

@end
