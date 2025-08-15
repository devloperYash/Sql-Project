-- Create database
CREATE DATABASE IF NOT EXISTS zepto_store;
USE zepto_store;

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_category (category_name)
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    mrp DECIMAL(10, 2) NOT NULL,
    discount_percent DECIMAL(5, 2) DEFAULT 0.00,
    available_quantity INT NOT NULL,
    discounted_selling_price DECIMAL(10, 2) NOT NULL,
    weight_in_gms INT,
    out_of_stock BOOLEAN DEFAULT FALSE,
    quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
    INDEX idx_category (category_id),
    INDEX idx_name (name)
);

-- Insert sample data (this is just an example, you'll need to import the actual CSV data)
-- The actual data import should be done through the wizard file upload with the CSV
-- This is just a sample of how the data would look
INSERT IGNORE INTO categories (category_name) VALUES 
('Fruits & Vegetables'),
('Cooking Essentials'),
('Munchies'),
('Dairy, Bread & Batter'),
('Beverages'),
('Packaged Food'),
('Ice Cream & Desserts');

-- Note: The actual product data should be imported using the CSV file through the wizard
-- This is just an example of how the data would be inserted
-- INSERT INTO products (category_id, name, mrp, discount_percent, available_quantity, 
--                     discounted_selling_price, weight_in_gms, out_of_stock, quantity)
-- SELECT c.category_id, p.name, p.mrp, p.discount_percent, p.available_quantity,
--        p.discounted_selling_price, p.weight_in_gms, p.out_of_stock, p.quantity
-- FROM temp_import_table p
-- JOIN categories c ON p.category = c.category_name;
