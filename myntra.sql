use myntra;

##BRAND TABLE 
CREATE TABLE brands (brand_id INT AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(100) UNIQUE);
##CATEGORIES TABLE 
CREATE TABLE categories (category_id INT AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(100),sub_category VARCHAR(100),gender VARCHAR(20));
##SELLERS TABLE
CREATE TABLE sellers (seller_id INT AUTO_INCREMENT PRIMARY KEY,
seller_name VARCHAR(100) UNIQUE);
##PRODUCT TABLE 
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    brand_id INT,
    category_id INT,
    seller_id INT,
    url TEXT,
    description TEXT,
    discount_price INT,
    original_price INT,
    discount_offer VARCHAR(50),
    size_option VARCHAR(200),
    FOREIGN KEY (brand_id) REFERENCES brands(brand_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id));
##RATING TABLE 
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    rating DECIMAL(2,1),
    review_count INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id));
##INSERT BRANDS
INSERT INTO brands (brand_name)
SELECT DISTINCT BrandName
FROM myntra;
##INSERT CATEGORIES
INSERT INTO categories (category, sub_category, gender)
SELECT DISTINCT Category, Individual_category, category_by_Gender
FROM myntra;
##INSERT SELLERS
INSERT INTO sellers (seller_name)
SELECT DISTINCT BrandName
FROM myntra;
##INSERT PRODUCTS
INSERT IGNORE INTO products (
    product_id, brand_id, category_id, seller_id,
    url, description, discount_price, original_price,
    discount_offer, size_option
)
SELECT 
    r.Product_id, 
    b.brand_id, 
    c.category_id, 
    s.seller_id,
    r.URL, 
    r.Description, 
    r.`DiscountPrice (in Rs)`, 
    r.`OriginalPrice (in Rs)`, 
    r.DiscountOffer, 
    r.SizeOption
FROM myntra r
JOIN brands b ON r.BrandName = b.brand_name
JOIN sellers s ON r.BrandName = s.seller_name
JOIN categories c 
  ON r.Category = c.category
  AND r.Individual_category = c.sub_category;
## INSERT RATINGS 
INSERT INTO ratings (product_id, rating, review_count)
SELECT product_id,
       ROUND(3 + RAND()*2,1),
       FLOOR(10 + RAND()*500)
FROM products;


##Q1 How many total products are available?
select count(*) AS TOTAL_PRODUCTS FROM products;
##Q2How many products are available for Men and Women?
SELECT c.gender, COUNT(p.product_id) AS total_products
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.gender;
##Q3Top 5 brands with the highest number of products
SELECT b.brand_name, COUNT(p.product_id) AS product_count
FROM products p
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY product_count DESC
LIMIT 5;
##Q4Average discount price by category
SELECT c.category, AVG(p.discount_price) AS avg_price
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category;
##Q5 Products having discount greater than 60%
SELECT product_id, discount_offer
FROM products
WHERE discount_offer LIKE '%60%';
##Q6 Top 5 most expensive products (based on original price)
SELECT product_id, original_price
FROM products
ORDER BY original_price DESC
LIMIT 5;
##Q7️ Category-wise total revenue (discount price)
SELECT c.category, SUM(p.discount_price) AS total_revenue
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category;
##Q8 Average rating per brand
SELECT b.brand_name, ROUND(AVG(r.rating), 2) AS avg_rating
FROM ratings r
JOIN products p ON r.product_id = p.product_id
JOIN brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name;
##Q9️Top 5 best-rated products
SELECT p.product_id, r.rating
FROM products p
JOIN ratings r ON p.product_id = r.product_id
ORDER BY r.rating DESC
LIMIT 5;
##Q10 Seller-wise product count
SELECT s.seller_name, COUNT(p.product_id) AS total_products
FROM products p
JOIN sellers s ON p.seller_id = s.seller_id
GROUP BY s.seller_name;


