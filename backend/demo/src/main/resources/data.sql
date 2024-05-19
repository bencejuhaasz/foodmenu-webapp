CREATE TABLE ORDER_TABLE (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    address VARCHAR(255),
    orderDetails VARCHAR(255),
    orderNumber VARCHAR(255)
);



-- You can add additional SQL statements here, such as INSERT statements to populate initial data.



INSERT INTO ORDER_TABLE (id, name, email, address, orderDetails, orderNumber) VALUES (1, 'John Doe', 'john@example.com', '123 Main St', 'Pizza, Salad', 'ORD-123456');
