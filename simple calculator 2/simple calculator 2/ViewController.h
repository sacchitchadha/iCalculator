//
//  ViewController.h
//  simple calculator 2
//
//  Created by Sacchit Chadha  on 10/05/16.
//  Copyright © 2016 Sacchit Chadha . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSInteger quotient;
    NSInteger remainder;
    NSInteger totalItems;
    NSInteger numberOfRows;
    int numberOfColumns;
    float buttonWidth;
    float buttonHeight;
    int arrayCounter;
    bool firstValue;
    float prev;
    float curr;
    NSMutableString *lastOperator, *currentOperator, *tempString;
    NSArray *arr;
    //UIWindow *mainWindow;
    //UIView *mainView;
    UITextField *fieldOne;
    UIButton *button;
}

-(IBAction)buttonTapped:(id)sender;
-(IBAction)ACButton:(id)sender;
-(IBAction)divisionButton:(id)sender;
-(IBAction)multiplicationButton:(id)sender;
-(IBAction)moduloButton:(id)sender;
-(IBAction)Button:(id)sender;
-(IBAction)decimalButton:(id)sender;
-(IBAction)bracketButton:(id)sender;
-(IBAction)plusMinusButton:(id)sender;



@end

