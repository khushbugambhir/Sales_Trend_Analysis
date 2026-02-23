
The objective of this task is to analyze monthly sales trends by calculating monthly revenue and order volume using SQL aggregation functions. A synthetic sales dataset was used for this analysis.

The dataset contains the following columns:
- order_id
- order_date
- amount
- product_id


## Analysis Performed
- Extracted year and month from order_date
- Calculated monthly revenue using SUM(amount)
- Calculated monthly order volume using COUNT(DISTINCT order_id)
- Sorted results using ORDER BY
- Identified top months based on sales

This task helped in understanding how to use GROUP BY, ORDER BY and Aggregate functions to analyze time-based sales trends in SQL.
