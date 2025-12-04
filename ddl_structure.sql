-- TABLE CREATION

-- 1. Planet  Table
CREATE TABLE Planet (
    planet_id SERIAL PRIMARY KEY,
    planet_name VARCHAR(100) NOT NULL,
    interplanetary_code VARCHAR(20) UNIQUE NOT NULL,
    gravity_m_s2 DECIMAL(4,2)
);

-- 2. Spacecraft Table
CREATE TABLE Spacecraft (
    spacecraft_id SERIAL PRIMARY KEY,
    spacecraft_name VARCHAR(100) NOT NULL,
    model VARCHAR(50),
    passenger_capacity INT NOT NULL,
    cargo_capacity_kg DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'Operational'
);

-- 3. Users Table
CREATE TABLE "User" (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    user_type VARCHAR(50) CHECK (user_type IN ('Passenger', 'Researcher', 'Crew')),
    residence_planet_id INT,
    FOREIGN KEY (residence_planet_id) REFERENCES Planet(planet_id)
);

-- 4. Special Conditions (Catalog)
CREATE TABLE Special_Condition (
    condition_id SERIAL PRIMARY KEY,
    condition_name VARCHAR(100),
    description TEXT
);

-- 5. User - Condition Relation (Many-to-Many)
CREATE TABLE User_Condition (
    user_id INT,
    condition_id INT,
    PRIMARY KEY (user_id, condition_id),
    FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    FOREIGN KEY (condition_id) REFERENCES Special_Condition(condition_id)
);

-- 6. Missions
CREATE TABLE Mission (
    mission_id SERIAL PRIMARY KEY,
    spacecraft_id INT NOT NULL,
    origin_id INT NOT NULL,
    destination_id INT NOT NULL,
    launch_date TIMESTAMP NOT NULL,
    duration_hours INT,
    status VARCHAR(20) CHECK (status IN ('Scheduled', 'In Progress', 'Completed', 'Cancelled')),
    FOREIGN KEY (spacecraft_id) REFERENCES Spacecraft(spacecraft_id),
    FOREIGN KEY (origin_id) REFERENCES Planet(planet_id),
    FOREIGN KEY (destination_id) REFERENCES Planet(planet_id)
);

-- 7. Reservations
CREATE TABLE Reservation (
    reservation_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    mission_id INT NOT NULL,
    reservation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    seat_number VARCHAR(10),
    reservation_status VARCHAR(20) DEFAULT 'Confirmed',
    FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    FOREIGN KEY (mission_id) REFERENCES Mission(mission_id)
);

-- 8. Cargo
CREATE TABLE Cargo (
    cargo_id SERIAL PRIMARY KEY,
    mission_id INT NOT NULL,
    owner_id INT NOT NULL,
    cargo_type VARCHAR(50),
    description TEXT,
    weight_kg DECIMAL(10,2),
    FOREIGN KEY (mission_id) REFERENCES Mission(mission_id),
    FOREIGN KEY (owner_id) REFERENCES "User"(user_id)
);

-- 9. Notifications
CREATE TABLE Notification (
    notification_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    contact_method VARCHAR(20),
    message TEXT,
    sent_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Sent',
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);
