-- =====================================================
-- FOOD DELIVERY APPLICATION - DATABASE SCHEMA
-- Database Name: project
-- =====================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS project;
USE project;

-- =====================================================
-- TABLE 1: user
-- Stores user information (customers and restaurant owners)
-- =====================================================
CREATE TABLE IF NOT EXISTS `user` (
    `user_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `userName` VARCHAR(50) NOT NULL UNIQUE,
    `passWord` VARCHAR(255) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    `phone` VARCHAR(20),
    `address` VARCHAR(255),
    `role` VARCHAR(20) DEFAULT 'customer',
    `created_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `last_login_date` TIMESTAMP NULL,
    INDEX `idx_email` (`email`),
    INDEX `idx_userName` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================================
-- TABLE 2: restaurant
-- Stores restaurant information
-- =====================================================
CREATE TABLE IF NOT EXISTS `restaurant` (
    `restaurant_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `address` VARCHAR(255),
    `phone` VARCHAR(20),
    `rating` VARCHAR(10),
    `cusine_type` VARCHAR(50),
    `isActive` VARCHAR(10) DEFAULT 'Yes',
    `estimated_time_arival` VARCHAR(20),
    `user_id` INT,
    `image_path` VARCHAR(255),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE SET NULL,
    INDEX `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================================
-- TABLE 3: menu
-- Stores menu items for each restaurant
-- =====================================================
CREATE TABLE IF NOT EXISTS `menu` (
    `menu_id` INT AUTO_INCREMENT PRIMARY KEY,
    `restaurant_id` INT NOT NULL,
    `item_name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `price` INT NOT NULL,
    `ratings` VARCHAR(10),
    `isAvailable` VARCHAR(10) DEFAULT 'Yes',
    `imagePath` VARCHAR(255),
    FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant`(`restaurant_id`) ON DELETE CASCADE,
    INDEX `idx_restaurant_id` (`restaurant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================================
-- TABLE 4: orders
-- Stores order information
-- =====================================================
CREATE TABLE IF NOT EXISTS `orders` (
    `order_id` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `restaurant_id` INT NOT NULL,
    `order_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `total_amount` INT NOT NULL,
    `status` VARCHAR(20) DEFAULT 'Pending',
    `payment_mode` VARCHAR(50),
    `address` VARCHAR(255),
    FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant`(`restaurant_id`) ON DELETE CASCADE,
    INDEX `idx_user_id` (`user_id`),
    INDEX `idx_restaurant_id` (`restaurant_id`),
    INDEX `idx_order_date` (`order_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================================
-- TABLE 5: order_item
-- Stores individual items in each order
-- =====================================================
CREATE TABLE IF NOT EXISTS `order_item` (
    `order_item_id` INT AUTO_INCREMENT PRIMARY KEY,
    `order_id` INT NOT NULL,
    `menu_id` INT NOT NULL,
    `quantity` INT NOT NULL DEFAULT 1,
    `total_price` INT NOT NULL,
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`) ON DELETE CASCADE,
    FOREIGN KEY (`menu_id`) REFERENCES `menu`(`menu_id`) ON DELETE CASCADE,
    INDEX `idx_order_id` (`order_id`),
    INDEX `idx_menu_id` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =====================================================
-- SAMPLE DATA INSERTION (Optional - for testing)
-- =====================================================

-- Insert Sample Users
INSERT INTO `user` (`name`, `userName`, `passWord`, `email`, `phone`, `address`, `role`) VALUES
('John Doe', 'johndoe', 'password123', 'john@example.com', '1234567890', '123 Main St, City', 'customer'),
('Jane Smith', 'janesmith', 'password123', 'jane@example.com', '0987654321', '456 Oak Ave, City', 'customer'),
('Restaurant Owner', 'restowner', 'password123', 'owner@restaurant.com', '5555555555', '789 Restaurant St', 'admin');

-- Insert Sample Restaurants
INSERT INTO `restaurant` (`name`, `address`, `phone`, `rating`, `cusine_type`, `isActive`, `estimated_time_arival`, `user_id`, `image_path`) VALUES
('Pizza Palace', '123 Food Street', '111-222-3333', '4.5', 'Italian', 'Yes', '30-40 mins', 3, 'images/restaurant.png'),
('Burger King', '456 Fast Food Ave', '222-333-4444', '4.2', 'American', 'Yes', '25-35 mins', 3, 'images/restaurant5.jpg'),
('Sushi House', '789 Asian Blvd', '333-444-5555', '4.8', 'Japanese', 'Yes', '40-50 mins', 3, 'images/restaurant9.jpg'),
('Taco Bell', '321 Mexican Way', '444-555-6666', '4.0', 'Mexican', 'Yes', '20-30 mins', 3, 'images/restaurant7.jpg');

-- Insert Sample Menu Items
INSERT INTO `menu` (`restaurant_id`, `item_name`, `description`, `price`, `ratings`, `isAvailable`, `imagePath`) VALUES
-- Pizza Palace Menu
(1, 'Margherita Pizza', 'Classic tomato and mozzarella', 250, '4.5', 'Yes', 'images/menuR1M1.jpg'),
(1, 'Pepperoni Pizza', 'Pepperoni with cheese', 300, '4.7', 'Yes', 'images/menuR1M2.png'),
(1, 'Veggie Supreme', 'Loaded with vegetables', 280, '4.3', 'Yes', 'images/menuR1M6.jpg'),
-- Burger King Menu
(2, 'Classic Burger', 'Beef patty with lettuce and tomato', 150, '4.2', 'Yes', 'images/menuR2M1.jpg'),
(2, 'Cheese Burger', 'Burger with extra cheese', 180, '4.4', 'Yes', 'images/menuR2M2.png'),
(2, 'Chicken Burger', 'Grilled chicken burger', 170, '4.3', 'Yes', 'images/menuR2M3.jpg'),
-- Sushi House Menu
(3, 'Salmon Sushi', 'Fresh salmon sushi rolls', 350, '4.8', 'Yes', 'images/menuR3M4.png'),
(3, 'California Roll', 'Crab and avocado roll', 280, '4.6', 'Yes', 'images/menuR4M1.png'),
-- Taco Bell Menu
(4, 'Beef Tacos', 'Spicy beef tacos', 120, '4.0', 'Yes', 'images/menuR5M2.jpg'),
(4, 'Chicken Tacos', 'Grilled chicken tacos', 110, '4.1', 'Yes', 'images/menuR5M3.png');

-- =====================================================
-- VERIFICATION QUERIES
-- =====================================================
-- Run these to verify the database setup:
-- SELECT COUNT(*) as user_count FROM user;
-- SELECT COUNT(*) as restaurant_count FROM restaurant;
-- SELECT COUNT(*) as menu_count FROM menu;
-- SELECT * FROM restaurant;
-- SELECT * FROM menu WHERE restaurant_id = 1;

