//Write a program that will compute the total sales tax on a $95 purchase. Assume the state sales tax is 4 percent, and the county sales tax is 2 percent.
let STATE_SALES_TAX = 0.04;
let COUNTY_SALES_TAX = 0.02;
let TAX_TO_CHARGE = STATE_SALES_TAX + COUNTY_SALES_TAX;
let PURCHASE_PRICE =  95.0;
let totalSalesTax = PURCHASE_PRICE * TAX_TO_CHARGE;

print("Sales Tax: $\(totalSalesTax)")
print("Total Purchase Price: $\(totalSalesTax + PURCHASE_PRICE)")
