SELECT customer_id, COUNT(customer_id) AS count_no_trans
-- Outer query: We are selecting the customer_id and counting the number of visits without transactions for each customer.

FROM 
    (SELECT
        Visits.customer_id,  -- We select the customer_id from the Visits table, which is the key to identifying the customer.
        Visits.visit_id AS visit_id,  -- We select the visit_id to identify the specific visit (though we won't use it in the outer query).
        Transactions.transaction_id,  -- We select the transaction_id from the Transactions table, to check if there is a transaction associated with the visit.
        Transactions.amount  -- We select the amount from the Transactions table, though we don't actually need it for the final result.
    FROM Visits
    LEFT JOIN Transactions  -- Perform a LEFT JOIN to include all visits, even those without transactions.
    ON Visits.visit_id = Transactions.visit_id  -- The join condition is based on matching visit_id between the Visits and Transactions tables.
    WHERE Transactions.transaction_id IS NULL)  AS subquery
    -- Subquery: Filters the visits to only include those without any matching transaction (i.e., where transaction_id is NULL).
    -- This ensures we only have visits with no associated transactions.
    
GROUP BY customer_id;  -- The outer query groups the results by customer_id to count the number of visits without transactions for each customer.
