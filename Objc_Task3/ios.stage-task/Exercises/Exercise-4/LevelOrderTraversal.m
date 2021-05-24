#import "LevelOrderTraversal.h"
int i = 0;
@interface BST : NSObject
 
@property NSNumber *number;
@property BST *links;
@property BST *rechts;
 
- (BST *)initWithValue:(NSNumber *)value;
- (BST *)createBST:(NSArray *) array;
- (NSMutableArray *)arrayFromBST;
 
@end

@implementation BST
 
- (BST *)initWithValue:(NSNumber *)value {
    self = [super init];
    if (self != nil) {
        self.number = value;
        self.links = NULL;
        self.rechts = NULL;
    }
    return self;
}

- (BST *)createBST:(NSArray *)array {
    if (array.count <= i || array[i] == [NSNull null]) {
        return nil;
    }
    BST *parent = [[BST alloc] initWithValue: array[i]];
    
    if ((array.count - 1) == i) {
        return parent;
    }
    i++;
    parent.links = [[BST alloc] createBST: array];
    i++;
    parent.rechts = [[BST alloc] createBST: array];
    return parent;
}

- (NSMutableArray *)arrayFromBST {
    NSMutableArray *result = [[NSMutableArray alloc] initWithObjects:[[NSMutableArray alloc] initWithObjects: self.number, nil], nil];
    if (self.links != nil) {
        NSArray *linksA = self.links.arrayFromBST;
        for (int k = 0; k < linksA.count; k++) {
            if (k < result.count - 1) [result[k + 1] addObjectsFromArray:linksA[k]];
            else [result addObject: linksA[k]];
        }
    }
    if (self.rechts != nil) {
        NSArray *rechtsA = self.rechts.arrayFromBST;
        for (int k = 0; k < rechtsA.count; k++) {
            if (k < result.count - 1) [result[k + 1] addObjectsFromArray:rechtsA[k]];
            else [result addObject: rechtsA[k]];
        }
    }
    return result;
}
 
@end

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    i = 0;
    BST *xTree = [[BST alloc] createBST:tree];
    if (xTree) {
        return [xTree arrayFromBST];
    }
    else return @[];
}
