-- Selects the columns `product_name` from the `Product` table, `year` and `price` from the `Sales` table
SELECT product_name, year, price
FROM Sales
-- Performs an INNER JOIN between the `Sales` table and the `Product` table
-- The join condition is that `product_id` in `Sales` matches `product_id` in `Product`
JOIN Product
ON Sales.product_id = Product.product_id;
-- This will return only the records where there is a matching `product_id` in both `Sales` and `Product`
-- If a `product_id` in `Sales` has no corresponding entry in `Product`, that row will be excluded from the results
