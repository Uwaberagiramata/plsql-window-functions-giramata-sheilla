# plsql-window-functions-giramata-sheilla
Step1: problem identification
  Business context
A retail company in Rwanda that sells  coffee Beans and bevarages product  through physical stores  and an online channel. the work is for the sales and marketing department to improve product range,regional promotions,customer loyalty.

  Data challenge

The company has transactional sales data accross the stores and online but it is not  summarized for decision making.there's not summarized report about product  perfomance and  month-to-month sales is messy  so  we are going  to calculate rise of increase,calculate customer aggregates so that  we can rank the products and audience segmentation to targeted marketing.

  Expected outcome
the goal is to turn  raw sales data into clear ,practical insights that the business can act on ,  tracking monthly sales totals, growth from one month to the next,  and calculating three months averages to give a management team a clear picture,
And this will make decision-making  alot easier , and help in improving promotions .

step2:Success Criteria
To measure success we will use 5 sql window functions to make 5 clear goals:
1.Top 5 products per region and quarter
  .Function: RANK()
  .Purpose: identify regional best-sellers  for promotions
2.Running monthly sales totals
   .Function: SUM() OVER()
   .Purpose: log sales to monitor performance
3. Month-over-month growth
   .Function:LAG()/LEAD()
   .Purpose:calculate sales growth or decline compared to the previous month
4.Customer quartiles
   .Function:NTILE(4)
   .Purpose: divide customers into groups (25%,50% etc) for targeted campaigns
5.3-month moving average of sales
   .Function: AVG() OVER()
   .Purpose : it will help to calculate aggregate of a specified row


