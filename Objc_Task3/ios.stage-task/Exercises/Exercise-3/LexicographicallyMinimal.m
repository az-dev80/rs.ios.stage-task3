#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *x = [[NSMutableString alloc] initWithString:@""];
    
    int i=0;
    int k = 0;
    while ( i < string1.length && k < string2.length) {
        unichar q1 = [string1 characterAtIndex:i];
        NSString *s1 = [[NSString alloc] initWithCharacters:&q1 length: 1];
        unichar q2 = [string2 characterAtIndex:k];
        NSString *s2 = [[NSString alloc] initWithCharacters:&q2 length: 1];
        NSComparisonResult result = [s1 compare:s2];
        if (result == 1){
            [x appendString: s2];
            string2 = [string2 substringFromIndex: 1];
        }
        else {
            [x appendString: s1];
            string1 = [string1 substringFromIndex: 1];
        }
    }
    if ([string1 length]){
        [x appendString: string1];
    }
    else{
        [x appendString: string2];
    }
    return x;
}

@end
