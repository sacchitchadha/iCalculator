//
//  ViewController.m
//  simple calculator 2
//
//  Created by Sacchit Chadha  on 10/05/16.
//  Copyright © 2016 Sacchit Chadha . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    prev = 0;
    curr = 0;
    firstValue = true;
    lastOperator = [NSMutableString stringWithFormat: @""];
    tempString = [NSMutableString stringWithFormat: @""];
    
    // This string is used for n - digit numbers
    currentOperator = [NSMutableString stringWithFormat:@""];
    [super viewDidLoad];
    // Setting up text field
    fieldOne = [[UITextField alloc] initWithFrame:CGRectMake(7.5,([[UIScreen mainScreen]bounds].size.height)*0.1,[[UIScreen mainScreen]bounds].size.width-15,([[UIScreen mainScreen]bounds].size.height)*0.1)];
    [fieldOne setBackgroundColor:[UIColor whiteColor]];
    [fieldOne setBorderStyle:UITextBorderStyleRoundedRect];
    [fieldOne setPlaceholder:@""];
    [fieldOne setTextAlignment:NSTextAlignmentRight];
    [self.view addSubview:fieldOne];
    // Using an array to store all the button strings of the calculator, this array can be modified as and when required
    arr = @[@"AC",@"+/-",@"%",@"/",@"7",@"8",@"9",@"x",@"4",@"5",@"6",@"-",@"1",@"2",@"3",@"+",@"0",@".",@"="];
    NSLog(@"Array Count : %ld",(unsigned long)arr.count);
    totalItems = arr.count;
    //This is predecided
    numberOfColumns = 4;
    arrayCounter = 0;
    
    // Calculating number of rows dynamically
    quotient = totalItems / numberOfColumns;
    remainder = totalItems % numberOfColumns;
    if (remainder != 0)
    {
        numberOfRows = quotient + 1;
    }
    else
    {
        numberOfRows = quotient;
    }
    buttonWidth = ([[UIScreen mainScreen]bounds].size.width) / numberOfColumns;
    NSLog(@"Width : %f",buttonWidth);
    buttonHeight = (([[UIScreen mainScreen]bounds].size.height) * 0.8) / numberOfRows;
    NSLog(@"height : %f",buttonHeight);
    for (int i = 0; i < numberOfRows; i++)
    {
        // Checking for whether remainder is zero or not. If remainder is zero then number of rows is equal to quotient. If not, number of rows = quotient + 1. This condition also dynamically sets up buttons on the view.
        if (i < quotient)
        {
            for (int j = 0; j < numberOfColumns; j++)
            {
                if (i == 0)
                {
                    button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth * j,(fieldOne.frame.origin.y + fieldOne.frame.size.height) + (buttonHeight * i) + 10,buttonWidth + 5, buttonHeight)];
                    [button setTitle:arr[arrayCounter] forState:UIControlStateNormal];
                    [button setTag:arrayCounter];
                    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
                    arrayCounter++;
                    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [button.titleLabel setFont:[UIFont systemFontOfSize:35]];
                    [button.layer setBorderColor:[UIColor blackColor].CGColor];
                    [button.layer setBorderWidth:0.8];
                    [button setBackgroundColor:[UIColor orangeColor]];
                    [self.view addSubview:button];
                }
                else
                {
                    button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth * j,(fieldOne.frame.origin.y + fieldOne.frame.size.height) + (buttonHeight * i) + 10,buttonWidth + 5, buttonHeight)];
                    [button setTitle:arr[arrayCounter] forState:UIControlStateNormal];
                    [button setTag:arrayCounter];
                    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
                    arrayCounter++;
                    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [button.titleLabel setFont:[UIFont systemFontOfSize:35]];
                    [button.layer setBorderColor:[UIColor blackColor].CGColor];
                    [button.layer setBorderWidth:0.8];
                    [button setBackgroundColor:[UIColor orangeColor]];
                    [self.view addSubview:button];
                }
            }
        }
        else
        {
            for (int j = 0; j < remainder; j++)
            {
                button = [[UIButton alloc]initWithFrame:CGRectMake(buttonWidth * j,(fieldOne.frame.origin.y + fieldOne.frame.size.height) + (buttonHeight * i) + 10,buttonWidth, buttonHeight - 10)];
                [button setTitle:arr[arrayCounter] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
                [button setTag:arrayCounter];
                arrayCounter++;
                [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                [button.titleLabel setFont:[UIFont systemFontOfSize:35]];
                [button.layer setBorderColor:[UIColor blackColor].CGColor];
                [button.layer setBorderWidth:0.8];
                [button setBackgroundColor:[UIColor orangeColor]];
                [self.view addSubview:button];
            }
            
        }
    }
}

-(IBAction)buttonTapped:(id)sender
{
    UIButton *btn =(UIButton *)sender;
    if ([btn.titleLabel.text isEqual:@"AC"])
    {
        [self ACButton:nil];
    }
    /*else if ([btn.titleLabel.text isEqual:@"+/-"])
    {
        [self plusMinusButton:nil];
    }*/
    else if ([btn.titleLabel.text isEqual:@"%"])
    {
        [self moduloButton:nil];
    }
    else if ([btn.titleLabel.text isEqual:@"/"])
    {
        [self divisionButton:nil];
    }
    else if ([btn.titleLabel.text isEqual:@"7"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"8"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"9"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"x"])
    {
        [self multiplicationButton:nil];
    }
    else if ([btn.titleLabel.text isEqual:@"4"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"5"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"6"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"-"])
    {
        [self subtractionButton:nil];
    }
    else if ([btn.titleLabel.text isEqual:@"1"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"2"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"3"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"+"])
    {
        [self additionButton:nil];
    }
    else if ([btn.titleLabel.text isEqual:@"0"])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"."])
    {
        [self Button:btn.titleLabel.text];
    }
    else if ([btn.titleLabel.text isEqual:@"()"])
    {
        [self bracketButton:nil];
    }
    else if ([btn.titleLabel.text isEqual:@"="])
    {
        [self resultButton:nil];
    }
}

-(IBAction)ACButton:(id)sender
{
    firstValue = true;
    prev = 0;
    curr = 0;
    lastOperator = [NSMutableString stringWithFormat:@""];
    tempString = [NSMutableString stringWithFormat:@""];
    [fieldOne setText:@""];
}

/*(IBAction)plusMinusButton:(id)sender
 {
 if (firstValue == true)
 {
 prev = [[fieldOne text]floatValue];
 curr = 0;
 firstValue = false;
 }
 prev = -prev;
 }*/

-(IBAction)moduloButton:(id)sender
{
    if (firstValue == true)
    {
        prev = [[fieldOne text]floatValue];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@"%%"];
        tempString = [NSMutableString stringWithFormat:@""];
        firstValue = false;
    }
    else
    {
        if ([lastOperator  isEqual: @"+"])
        {
            prev = prev + curr;
            NSLog(@"ModuloPrev: %f",prev);
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"-"])
        {
            prev = prev - curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"*"])
        {
            prev = prev * curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"/"])
        {
            prev = prev / curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"%"])
        {
            NSMutableString *temp1 = [NSMutableString stringWithFormat:@"%f",prev];
            NSMutableString *temp2 = [NSMutableString stringWithFormat:@"%f",curr];
            int result = [temp1 intValue] % [temp2 intValue];
            prev = result;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }

        else if([lastOperator  isEqual: @""])
        {
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
            [fieldOne setText:@""];
        }
    }
}

-(IBAction)divisionButton:(id)sender
{
    if (firstValue == true)
    {
        prev = [[fieldOne text]floatValue];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@"/"];
        tempString = [NSMutableString stringWithFormat:@""];
        firstValue = false;
    }
    else
    {
        if ([lastOperator  isEqual: @"+"])
        {
            prev = prev + curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"/"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"-"])
        {
            prev = prev - curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"/"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"*"])
        {
            prev = prev * curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"/"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"/"])
        {
            prev = prev / curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"/"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"%"])
        {
            NSMutableString *temp1 = [NSMutableString stringWithFormat:@"%f",prev];
            NSMutableString *temp2 = [NSMutableString stringWithFormat:@"%f",curr];
            int result = [temp1 intValue] % [temp2 intValue];
            prev = result;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if([lastOperator  isEqual: @""])
        {
            lastOperator = [NSMutableString stringWithFormat:@"/"];
            tempString = [NSMutableString stringWithFormat:@""];
            [fieldOne setText:@""];
        }
    }
}

-(IBAction)additionButton:(id)sender
{
    
    if (firstValue == true)
    {
        prev = [[fieldOne text]floatValue];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@"+"];
        tempString = [NSMutableString stringWithFormat:@""];
        firstValue = false;
    }
    else
    {
        if ([lastOperator  isEqual: @"+"])
        {
            prev = prev + curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"+"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"-"])
        {
            prev = prev - curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"+"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"*"])
        {
            prev = prev * curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"+"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"/"])
        {
            prev = prev / curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"+"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"%"])
        {
            NSMutableString *temp1 = [NSMutableString stringWithFormat:@"%f",prev];
            NSMutableString *temp2 = [NSMutableString stringWithFormat:@"%f",curr];
            int result = [temp1 intValue] % [temp2 intValue];
            prev = result;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if([lastOperator  isEqual: @""])
        {
            lastOperator = [NSMutableString stringWithFormat:@"+"];
            tempString = [NSMutableString stringWithFormat:@""];
            [fieldOne setText:@""];
        }
    }
}


-(IBAction)subtractionButton:(id)sender
{
    if (firstValue == true)
    {
        prev = [[fieldOne text]floatValue];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@"-"];
        tempString = [NSMutableString stringWithFormat:@""];
        firstValue = false;
    }
    else
    {
        if ([lastOperator  isEqual: @"+"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev + curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"-"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"-"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev - curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"-"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"*"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev * curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"-"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"/"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev / curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"-"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"%"])
        {
            NSMutableString *temp1 = [NSMutableString stringWithFormat:@"%f",prev];
            NSMutableString *temp2 = [NSMutableString stringWithFormat:@"%f",curr];
            int result = [temp1 intValue] % [temp2 intValue];
            prev = result;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if([lastOperator  isEqual: @""])
        {
            lastOperator = [NSMutableString stringWithFormat:@"-"];
            tempString = [NSMutableString stringWithFormat:@""];
            [fieldOne setText:@""];
        }
    }
}

-(IBAction)multiplicationButton:(id)sender
{
    if (firstValue == true)
    {
        prev = [[fieldOne text]floatValue];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@"*"];
        tempString = [NSMutableString stringWithFormat:@""];
        firstValue = false;
    }
    else
    {
        if ([lastOperator  isEqual: @"+"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev + curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"*"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"-"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev - curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"*"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"*"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev * curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"*"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"/"])
        {
            curr = [[fieldOne text] floatValue];
            prev = prev / curr;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"*"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if ([lastOperator  isEqual: @"%"])
        {
            NSMutableString *temp1 = [NSMutableString stringWithFormat:@"%f",prev];
            NSMutableString *temp2 = [NSMutableString stringWithFormat:@"%f",curr];
            int result = [temp1 intValue] % [temp2 intValue];
            prev = result;
            [fieldOne setText:@""];
            curr = 0;
            lastOperator = [NSMutableString stringWithFormat:@"%%"];
            tempString = [NSMutableString stringWithFormat:@""];
        }
        else if([lastOperator  isEqual: @""])
        {
            lastOperator = [NSMutableString stringWithFormat:@"*"];
            tempString = [NSMutableString stringWithFormat:@""];
            [fieldOne setText:@""];
        }
    }
}

-(IBAction)Button:(id)sender
{
    NSLog(@"Button Title: %@",sender);
    if (firstValue == true)
    {
        tempString = [NSMutableString stringWithFormat:@"%@",sender];
        prev = [tempString floatValue];
        curr = 0;
        firstValue = false;
        [fieldOne setText:tempString];
        currentOperator = [NSMutableString stringWithFormat:@""];
    }
    else if ([currentOperator isEqual:@""] && [lastOperator isEqual:@""])
    {
        [tempString appendString:sender];
        //NSLog(@"Temp String : %@ & sender is : %@",tempString, sender);
        [fieldOne setText:tempString];
        prev = [tempString floatValue];
    }
    else
    {
        [tempString appendString:sender];
        //NSLog(@"Temp String : %@ & sender is : %@",tempString, sender);
        curr = [tempString floatValue];
        //NSLog(@"curr is : %f",curr);
        [fieldOne setText:tempString];
    }
}

-(IBAction)resultButton:(id)sender
{
    if ([lastOperator  isEqual: @""])
    {
        prev = [[fieldOne text] floatValue];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"The answer is %0.2f",prev] delegate:self cancelButtonTitle:@"Back" otherButtonTitles: nil];
        [alert show];
        curr = 0;
        [fieldOne setText:@""];
    }
    else if ([lastOperator isEqual:@"+"])
    {
        curr = [[fieldOne text] floatValue];
        prev = prev + curr;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"The answer is %0.2f",prev] delegate:self cancelButtonTitle:@"Back" otherButtonTitles: nil];
        [alert show];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@""];
        tempString = [NSMutableString stringWithFormat:@""];
    }
    else if ([lastOperator isEqual:@"-"])
    {
        curr = [[fieldOne text] floatValue];
        prev = prev - curr;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"The answer is %0.2f",prev] delegate:self cancelButtonTitle:@"Back" otherButtonTitles: nil];
        [alert show];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@""];
        tempString = [NSMutableString stringWithFormat:@""];
    }
    else if ([lastOperator isEqual:@"*"])
    {
        curr = [[fieldOne text] floatValue];
        prev = prev * curr;
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"The answer is %0.2f",prev] delegate:self cancelButtonTitle:@"Back" otherButtonTitles: nil];
        [alert show];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@""];
        tempString = [NSMutableString stringWithFormat:@""];
    }
    else if ([lastOperator isEqual:@"/"])
    {
        //NSLog(@"value of prev is %f",prev);
        curr = [[fieldOne text] floatValue];
        NSLog(@"curr is %f:",curr);
        prev = prev / curr;
        //NSLog(@"value of prev is %f",prev);
        //NSLog(@"value of curr is %f",curr);
        //NSLog(@"value of lastOperator is %@",lastOperator);
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"The answer is %0.2f",prev] delegate:self cancelButtonTitle:@"Back" otherButtonTitles: nil];
        [alert show];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@""];
        tempString = [NSMutableString stringWithFormat:@""];
    }
    else if ([lastOperator isEqual:@"%"])
    {
        curr = [[fieldOne text] floatValue];
        NSLog(@"prev is %f:",prev);
        NSLog(@"curr is %f:",curr);
        NSMutableString *temp1 = [NSMutableString stringWithFormat:@"%f",prev];
        NSMutableString *temp2 = [NSMutableString stringWithFormat:@"%f",curr];
        NSInteger result = [temp1 integerValue] % [temp2 integerValue];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[NSString stringWithFormat:@"The answer is %ld",(long)result] delegate:self cancelButtonTitle:@"Back" otherButtonTitles: nil];
        [alert show];
        curr = 0;
        [fieldOne setText:@""];
        lastOperator = [NSMutableString stringWithFormat:@""];
        tempString = [NSMutableString stringWithFormat:@""];
    }

}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
