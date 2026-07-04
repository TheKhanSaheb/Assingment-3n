
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  role VARCHAR(50) CHECK (role IN ('Ticket Manager', 'Football Fan')),
  phone_number VARCHAR(20)
);
