SELECT 
    Prices.product_id, 
    -- COALESCE function: If the result of the average price calculation is NULL, return 0 instead.
    COALESCE(ROUND(SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units), 2), 0) AS average_price
FROM 
    Prices
-- Join Prices table with UnitsSold table to get related records
LEFT JOIN 
    UnitsSold
ON 
    -- Matching the product_id from both tables (Prices and UnitsSold)
    Prices.product_id = UnitsSold.product_id
    -- Ensuring the purchase date of the unit sold is between the start and end date of the price validity
    AND Prices.start_date <= UnitsSold.purchase_date 
    AND Prices.end_date >= UnitsSold.purchase_date 
GROUP BY 
    Prices.product_id;  -- Grouping results by product_id to calculate average price per product
