# plsql-window-functions-giramata-sheilla
Step1: problem  definition

  Business context
A retail company in Rwanda that sells  food and beverages product  through physical stores  and an online channel. the work is for the sales and marketing department to improve product range,regional promotions,customer loyalty.


  Data challenge

 when working with team  we  found out that The company has transactional sales data accross the stores and online but it is not  summarized for decision making.there's not summarized report about product  performance and  month-to-month sales is messy  so  we are going  to calculate rise of increase,calculate customer aggregates so that  we can rank the products and audience segmentation to targeted marketing.



  Expected outcome

  
the goal is to turn  raw sales data into clear ,practical insights that the business can act on ,  tracking monthly sales totals, growth from one month to the next,  and calculating three months averages to give a management team a clear picture,
And this will make decision-making  a lot easier , and help in improving promotions .

step2:Success Criteria


To measure success we will use 5 sql window functions to make 5 clear goals:


1.Top 5 products per region and quarter

  .Function: RANK()
  
   .Purpose:  Ranking functions to find top N customers by revenue

  
2.Running monthly sales totals

   .Function: SUM() OVER()
   
   .Purpose: Aggregate functions for running totals and trends

3. Month-over-month growth

   .Function:LAG()/LEAD()
   
   .Purpose: Navigation functions for growth calculations

   
4.Customer quartiles

  .Function:NTILE(4)
   
   .Purpose: Distribution functions for customer segmentation

   
5.3-month moving average of sales

   .Function: AVG() OVER()
   
   .Purpose : it will help to calculate aggregate of a specified row

STEP3: Database Schema

 I created  relational schema that linked three  tables which are  customers , products 
 
 transactions they are connected  through foreign keys.

  TABLES:

1.CUSTOMERS

purpose: customer information

key columns:

.customer_id (pk)

.name

.region

Example row: (1001, 'John Doe', 'Kigali')


2.PRODUCTS

PURPOSE: product catalog 

key columns: 

product_id (PK)

name 

category

example row : (2001, 'Coffee Beans', 'Beverages')

3.TRANSACTIONS

Purpose: Sales records

Key columns: 
transaction_id (PK)

customer_id (FK)  references customers(customer_id)

product_id(FK) references products(product_id)

sale_date

amount

example row: (3001, 1001, 2001, '2024-01-15', 25000)
















