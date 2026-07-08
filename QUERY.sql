-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
  user_id SERIAL PRIMARY KEY,
  full_name VARCHAR(150),
  email VARCHAR(225) UNIQUE,
  role VARCHAR(20) CHECK (role IN ('Ticket Manager', 'Football Fan')),
  phone_number VARCHAR(15)
);


-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
  match_id SERIAL PRIMARY KEY,
  fixture VARCHAR(100),
  tournament_category VARCHAR(100),
  base_ticket_price NUMERIC(10, 2) CHECK (base_ticket_price >= 0),
  match_status VARCHAR(20) CHECK (
    match_status IN (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  )
);


-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
  booking_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES Users (user_id),
  match_id INTEGER REFERENCES Matches (match_id),
  seat_number VARCHAR(10),
  payment_status VARCHAR(12) CHECK (
    payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  ),
  total_cost NUMERIC(10, 2) CHECK (total_cost >= 0)
);



