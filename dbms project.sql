-- Drop the database if it exists and create a new one
DROP DATABASE IF EXISTS project1;
CREATE DATABASE project1;
USE project1;

-- Create the website table
CREATE TABLE website (
    rating INT,
    no_of_reviews INT,
    url VARCHAR(150), 
    PRIMARY KEY(url)
);

-- Create the sellsGPU table
CREATE TABLE sellsGPU (
    Manufacturer_name VARCHAR(200),
    Product_name VARCHAR(150),
    Serial_number INT PRIMARY KEY,
    url VARCHAR(150),
    FOREIGN KEY (url) REFERENCES website(url)
);

-- Create the priceinfo table
CREATE TABLE priceinfo (
    Product_price INT,
    shipping_price INT,
    Discount INT,
    Serial_number INT,
    FOREIGN KEY (Serial_number) REFERENCES sellsGPU(Serial_number)
);

-- Set the delimiter to handle stored procedures
DELIMITER //

-- Procedure 1: Get the top 5 most expensive GPUs
CREATE PROCEDURE getTop5ExpensiveGPUs() 
BEGIN
    SELECT Product_name, Product_price
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    ORDER BY Product_price DESC
    LIMIT 5;
END //

-- Procedure 2: Get GPUs below $500
CREATE PROCEDURE getGPUsBelow500() 
BEGIN
    SELECT Product_name, Product_price
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    WHERE Product_price < 500;
END //

-- Procedure 3: Get the average GPU price
CREATE PROCEDURE getAverageGPUPrice() 
BEGIN
    SELECT AVG(Product_price) AS average_price
    FROM priceinfo;
END //

-- Procedure 4: Get the number of GPUs by manufacturer
CREATE PROCEDURE getNumberOfGPUsByManufacturer() 
BEGIN
    SELECT Manufacturer_name, COUNT(*) AS number_of_GPUs
    FROM sellsGPU
    GROUP BY Manufacturer_name;
END //

-- Procedure 5: Get discounted GPUs
CREATE PROCEDURE getDiscountedGPUs() 
BEGIN
    SELECT Product_name, Discount
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    WHERE Discount > 0;
END //

-- Procedure 6: Get the top 5 discounted GPUs
CREATE PROCEDURE getTop5DiscountedGPUs() 
BEGIN
    SELECT Product_name, Discount
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    ORDER BY Discount DESC
    LIMIT 5;
END //

-- Procedure 7: Get the price range by manufacturer
CREATE PROCEDURE getPriceRangeByManufacturer(IN manufacturer_name VARCHAR(200)) 
BEGIN
    SELECT Manufacturer_name, MIN(Product_price) AS min_price, MAX(Product_price) AS max_price
    FROM sellsGPU
    JOIN priceinfo ON sellsGPU.Serial_number = priceinfo.Serial_number
    WHERE Manufacturer_name = manufacturer_name
    GROUP BY Manufacturer_name;
END //

-- Procedure 8: Get the total number of GPUs
CREATE PROCEDURE getTotalGPUs() 
BEGIN
    SELECT COUNT(*) AS total_GPUs
    FROM sellsGPU;
END //

-- Procedure 9: Get the highest-rated GPU
CREATE PROCEDURE getHighestRatedGPU() 
BEGIN
    SELECT Product_name, rating
    FROM sellsGPU
    JOIN website ON sellsGPU.url = website.url
    ORDER BY rating DESC
    LIMIT 1;
END //

-- Procedure 10: Get the most reviewed GPU
CREATE PROCEDURE getMostReviewedGPU() 
BEGIN
    SELECT Product_name, no_of_reviews
    FROM sellsGPU
    JOIN website ON sellsGPU.url = website.url
    ORDER BY no_of_reviews DESC
    LIMIT 1;
END //

-- Procedure 11: Get GPUs with high rating (>4.5)
CREATE PROCEDURE getGPUsWithHighRating() 
BEGIN
    SELECT Product_name, rating
    FROM sellsGPU
    JOIN website ON sellsGPU.url = website.url
    WHERE rating > 4.5;
END //

-- Procedure 12: Get GPUs with low rating (<3)
CREATE PROCEDURE getGPUsWithLowRating() 
BEGIN
    SELECT Product_name, rating
    FROM sellsGPU
    JOIN website ON sellsGPU.url = website.url
    WHERE rating < 3;
END //

-- Procedure 13: Get price difference by manufacturer
CREATE PROCEDURE getPriceDifferenceByManufacturer() 
BEGIN
    SELECT Manufacturer_name, MAX(Product_price) - MIN(Product_price) AS price_difference
    FROM sellsGPU
    JOIN priceinfo ON sellsGPU.Serial_number = priceinfo.Serial_number
    GROUP BY Manufacturer_name;
END //

-- Procedure 14: Get average price difference by manufacturer
CREATE PROCEDURE getAvgPriceDifferenceByManufacturer() 
BEGIN
    SELECT AVG(MAX(Product_price) - MIN(Product_price)) AS avg_price_difference
    FROM sellsGPU
    JOIN priceinfo ON sellsGPU.Serial_number = priceinfo.Serial_number
    GROUP BY Manufacturer_name;
END //

-- Procedure 15: Get GPUs above average price
CREATE PROCEDURE getGPUsAboveAvgPrice() 
BEGIN
    SELECT Product_name, Product_price
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    WHERE Product_price > (SELECT AVG(Product_price) FROM priceinfo);
END //

-- Procedure 16: Get average discount
CREATE PROCEDURE getAverageDiscount() 
BEGIN
    SELECT AVG(Discount) AS average_discount
    FROM priceinfo;
END //

-- Procedure 17: Get percentage of GPUs on discount
CREATE PROCEDURE getPercentageOfGPUsOnDiscount() 
BEGIN
    SELECT (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sellsGPU)) AS percentage_on_discount
    FROM priceinfo
    WHERE Discount > 0;
END //

-- Procedure 18: Get GPUs with 100+ reviews
CREATE PROCEDURE getGPUsWith100PlusReviews() 
BEGIN
    SELECT Product_name, no_of_reviews
    FROM sellsGPU
    JOIN website ON sellsGPU.url = website.url
    WHERE no_of_reviews >= 100;
END //

-- Procedure 19: Get the top 5 cheapest GPUs
CREATE PROCEDURE getCheapestGPUs() 
BEGIN
    SELECT Product_name, Product_price
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    ORDER BY Product_price ASC
    LIMIT 5;
END //

-- Procedure 20: Get the most expensive GPUs by manufacturer
CREATE PROCEDURE getMostExpensiveGPUsByManufacturer(IN manufacturer_name VARCHAR(200)) 
BEGIN
    SELECT Product_name, Product_price
    FROM sellsGPU
    JOIN priceinfo ON sellsGPU.Serial_number = priceinfo.Serial_number
    WHERE Manufacturer_name = manufacturer_name
    ORDER BY Product_price DESC
    LIMIT 5;
END //

-- Procedure 21: Get GPUs with free shipping
CREATE PROCEDURE getGPUsWithFreeShipping() 
BEGIN
    SELECT Product_name, Product_price, shipping_price
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    WHERE shipping_price = 0;
END //

-- Procedure 22: Get GPUs in a specific price range
CREATE PROCEDURE getGPUsInPriceRange(IN min_price INT, IN max_price INT) 
BEGIN
    SELECT Product_name, Product_price
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    WHERE Product_price BETWEEN min_price AND max_price;
END //

-- Procedure 23: Get the manufacturer with the most GPUs
CREATE PROCEDURE getManufacturerWithMostGPUs() 
BEGIN
    SELECT Manufacturer_name, COUNT(*) AS number_of_GPUs
    FROM sellsGPU
    GROUP BY Manufacturer_name
    ORDER BY number_of_GPUs DESC
    LIMIT 1;
END //

-- Procedure 24: Get the average shipping price
CREATE PROCEDURE getAverageShippingPrice() 
BEGIN
    SELECT AVG(shipping_price) AS average_shipping_price
    FROM priceinfo;
END //

-- Procedure 25: Get total number of reviews for a manufacturer
CREATE PROCEDURE getTotalReviewsByManufacturer(IN manufacturer_name VARCHAR(200)) 
BEGIN
    SELECT SUM(no_of_reviews) AS total_reviews
    FROM sellsGPU
    JOIN website ON sellsGPU.url = website.url
    WHERE Manufacturer_name = manufacturer_name;
END //

-- Procedure 26: Get GPUs sorted by combined price (Product + Shipping)
CREATE PROCEDURE getGPUsSortedByCombinedPrice() 
BEGIN
    SELECT Product_name, (Product_price + shipping_price) AS combined_price
    FROM priceinfo
    JOIN sellsGPU ON priceinfo.Serial_number = sellsGPU.Serial_number
    ORDER BY combined_price DESC;
END //

-- Restore the delimiter to the default
DELIMITER ;
-- Procedure calls

-- Get the top 5 most expensive GPUs
CALL getTop5ExpensiveGPUs();

-- Get GPUs priced below $500
CALL getGPUsBelow500();

-- Get the average GPU price
CALL getAverageGPUPrice();

-- Get the number of GPUs by manufacturer
CALL getNumberOfGPUsByManufacturer();

-- Get discounted GPUs
CALL getDiscountedGPUs();

-- Get the top 5 discounted GPUs
CALL getTop5DiscountedGPUs();

-- Get the price range for a specific manufacturer
CALL getPriceRangeByManufacturer('NVIDIA'); -- Replace 'NVIDIA' with the desired manufacturer name

-- Get the total number of GPUs
CALL getTotalGPUs();

-- Get the highest-rated GPU
CALL getHighestRatedGPU();

-- Get the most reviewed GPU
CALL getMostReviewedGPU();

-- Get GPUs with a rating above 4.5
CALL getGPUsWithHighRating();

-- Get GPUs with a rating below 3
CALL getGPUsWithLowRating();

-- Get the price difference for each manufacturer
CALL getPriceDifferenceByManufacturer();

-- Get the average price difference for each manufacturer
CALL getAvgPriceDifferenceByManufacturer();

-- Get GPUs priced above the average price
CALL getGPUsAboveAvgPrice();

-- Get the average discount on GPUs
CALL getAverageDiscount();

-- Get the percentage of GPUs with a discount
CALL getPercentageOfGPUsOnDiscount();

-- Get GPUs with 100 or more reviews
CALL getGPUsWith100PlusReviews();

-- Get the top 5 cheapest GPUs
CALL getCheapestGPUs();

-- Get the most expensive GPUs from a specific manufacturer
CALL getMostExpensiveGPUsByManufacturer('NVIDIA'); -- Replace 'NVIDIA' with the desired manufacturer name

-- Get GPUs with free shipping
CALL getGPUsWithFreeShipping();

-- Get GPUs within a specified price range
CALL getGPUsInPriceRange(200, 500); -- Replace 200 and 500 with the desired minimum and maximum prices

-- Get the manufacturer with the most GPUs
CALL getManufacturerWithMostGPUs();

-- Get the average shipping price
CALL getAverageShippingPrice();

-- Get the total number of reviews for a specific manufacturer
CALL getTotalReviewsByManufacturer('NVIDIA'); -- Replace 'NVIDIA' with the desired manufacturer name

-- Get GPUs sorted by combined price (product price + shipping price)
CALL getGPUsSortedByCombinedPrice();
