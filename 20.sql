SELECT 
    -- Format the 'trans_date' field to display the year and month (YYYY-MM).
    DATE_FORMAT(trans_date, '%Y-%m') AS month, 
    
    -- Select the 'country' column to group results by country.
    country,
    
    -- Count the number of transactions (rows) for each combination of 'country' and 'month'.
    COUNT(id) AS trans_count,
    
    -- Count the number of 'approved' transactions (rows where 'state' equals 'approved').
    SUM(IF(state = 'approved', 1, 0)) AS approved_count,
    
    -- Sum the total 'amount' of all transactions for each group.
    SUM(amount) AS trans_total_amount,
    
    -- Sum the 'amount' for transactions that are 'approved' only. If 'state' is 'approved', it adds the amount; otherwise, it adds 0.
    SUM(IF(state='approved', amount, 0)) AS approved_total_amount

FROM 
    -- Specify the 'Transactions' table as the data source.
    Transactions 

-- Group the results first by 'country', then by 'month' (the formatted year-month value).
GROUP BY 
    country, 
    month;
