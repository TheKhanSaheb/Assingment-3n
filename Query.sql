
CREATE TABLE Users (
  user_id INT PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  role VARCHAR(50) CHECK (role IN ('Ticket Manager', 'Football Fan')),
  phone_number VARCHAR(20)
);


CREATE TABLE Matches (
  match_id INT PRIMARY KEY,
  fixture VARCHAR(100) NOT NULL,
  tournament_category VARCHAR(50),
  base_ticket_price DECIMAL(10, 2) CHECK (base_ticket_price >= 0),
  match_status VARCHAR(20) CHECK (
    match_status IN (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);


CREATE TABLE Bookings (
  booking_id INT PRIMARY KEY,
  user_id INT REFERENCES Users (user_id),
  match_id INT REFERENCES Matches (match_id),
  seat_number VARCHAR(10),
  payment_status VARCHAR(20) CHECK (
    payment_status IN (
      'Pending',
      'Confirmed',
      'Cancelled',
      'Refunded',
      NULL
    )
  ),
  total_cost DECIMAL(10, 2) CHECK (total_cost >= 0)
);
