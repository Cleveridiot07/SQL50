SELECT 
    -- Calculate the percentage of deliveries where the `order_date` matches the `customer_pref_delivery_date`
    ROUND(
        (SUM(IF(order_date = customer_pref_delivery_date, 1, 0)) * 100) / COUNT(delivery_id),
        2
    ) AS immediate_percentage
FROM  
    Delivery
WHERE 
    -- Consider only the first delivery for each customer based on the earliest `order_date`
    (customer_id, order_date) IN (
        -- Subquery to find the earliest `order_date` for each customer
        SELECT 
            customer_id, 
            MIN(order_date) 
        FROM 
            Delivery
        GROUP BY 
            customer_id
    );
