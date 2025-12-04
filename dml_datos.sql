-- DATA ENTRY

-- Insert Planets
INSERT INTO Planet (planet_name, interplanetary_code, gravity_m_s2) VALUES
('Earth', 'SOL-003', 9.81),
('Mars', 'SOL-004', 3.72),
('Moon', 'SOL-003-M1', 1.62),
('Europa', 'JUP-002', 1.31),
('Titan', 'SAT-006', 1.35),
('Ganymede', 'JUP-003', 1.42),
('Venus', 'SOL-002', 8.87),
('Mercury', 'SOL-001', 3.70),
('Io', 'JUP-001', 1.79),
('Alpha Space Station', 'ORB-001', 0.00);

-- Insert Ships
INSERT INTO Spacecraft (ship_name, model, passenger_capacity, cargo_capacity_kg) VALUES
('AeroGalaxy One', 'StarLiner X', 50, 2000.00),
('Red Dragon', 'Heavy Hauler', 10, 15000.00),
('Voyager II', 'Science Vessel', 20, 500.00),
('Cosmos Hopper', 'Shuttle V', 8, 200.00),
('Nebula Dream', 'Luxury Cruiser', 100, 5000.00),
('Orion Path', 'Explorer', 15, 1000.00),
('Solar Wind', 'Solar Sailer', 5, 50.00),
('Titan Atlas', 'Heavy Lifter', 6, 25000.00),
('Phoenix Rising', 'Speedster', 12, 300.00),
('Lunar Express', 'Shuttle IV', 30, 800.00);

-- Insert Special Conditions
INSERT INTO Special_Condition (condition_name, description) VALUES
('Low G Tolerance', 'Cannot exceed 3G during takeoff'),
('Mild Claustrophobia', 'Requires aisle or large window seat'),
('Vegan Space Diet', 'Only plant-based processed foods'),
('Full EVA Training', 'Certified for spacewalks'),
('Requires Supplemental Oxygen', 'Medical necessity in low pressurization'),
('Augmented Night Vision', 'Registered ocular implant'),
('Radiation Sensitivity', 'Requires additional shielding in quarters'),
('Gravitational Pacemaker', 'Medical device sensitive to magnetic fields'),
('Zero-G Adaptation Null', 'Requires constant anti-motion sickness medication'),
('Mechanical Prosthesis', 'Registered robotic arm or leg');

-- Insert Users
INSERT INTO User (full_name, email, user_type, residence_planet_id) VALUES
('Juan Pérez', 'juan@mail.com', 'Passenger', 1),
('Sarah Connor', 'sarah@resistance.com', 'Researcher', 2),
('Ellen Ripley', 'ellen@nostromo.com', 'Crew', 1),
('Buzz Aldrin Jr', 'buzz@nasa.com', 'Crew', 3),
('Elon Tusk', 'elon@mars.com', 'Passenger', 2),
('Dr. Spock', 'spock@vulcan.com', 'Researcher', 4),
('Han Solo', 'han@falcon.com', 'Crew', 10),
('Leia Organa', 'leia@senate.com', 'Passenger', 1),
('Luke Sky', 'luke@jedi.com', 'Researcher', 5),
('Wanda Maximoff', 'wanda@magic.com', 'Passenger', 1);

-- Insert User_Condition Relationships (Assign random conditions)
INSERT INTO User_Condition (user_id, condition_id) VALUES
(1, 1), (2, 4), (3, 4), (3, 9), (5, 7),
(6, 3), (7, 6), (8, 2), (9, 10), (10, 8);

-- Insert Missions
INSERT INTO Mission (ship_id, origin_id, destination_id, launch_date, duration_hours, status) VALUES
(1, 1, 3, '2025-10-01 08:00:00', 72, 'Scheduled'),
(2, 2, 1, '2025-11-15 12:00:00', 150, 'Scheduled'),
(5, 1, 2, '2025-12-01 06:00:00', 200, 'Scheduled'),
(3, 10, 4, '2025-09-20 09:00:00', 500, 'In Progress'),
(4, 3, 1, '2025-10-05 14:00:00', 72, 'Scheduled'),
(6, 1, 5, '2026-01-01 00:00:00', 1000, 'Scheduled'),
(8, 2, 6, '2026-02-20 10:00:00', 1200, 'Scheduled'),
(9, 1, 3, '2025-10-02 08:00:00', 60, 'Finished'),
(10, 3, 10, '2025-10-10 16:00:00', 48, 'Scheduled'),
(1, 1, 2, '2025-12-25 08:00:00', 200, 'Scheduled');

-- Insert Reservations
INSERT INTO Reservation (user_id, mission_id, seat, reservation_status) VALUES
(1, 1, 'A1', 'Confirmed'),
(5, 3, 'VIP-1', 'Confirmed'),
(8, 3, 'VIP-2', 'Confirmed'),
(2, 7, 'LAB-1', 'Pending'),
(6, 4, 'B2', 'Confirmed'),
(9, 6, 'C4', 'Confirmed'),
(10, 1, 'A2', 'Confirmed'),
(1, 10, 'D1', 'Cancelled'),
(4, 9, 'PIL-1', 'Confirmed'),
(7, 4, 'PIL-2', 'Confirmed');

-- Insert Cargo
INSERT INTO Cargo (mission_id, owner_id, cargo_type, description, weight_kg) VALUES
(1, 1, 'Personal', 'Personal luggage and suit', 25.50),
(3, 5, 'Commercial', 'Mining prototypes', 500.00),
(4, 6, 'Scientific', 'Frozen biological samples', 10.00),
(2, 2, 'Scientific', 'Exploration Rover', 1200.00),
(7, 2, 'Commercial', 'Terraforming supplies', 5000.00),
(6, 9, 'Personal', 'Lightsaber and droid', 150.00),
(1, 10, 'Personal', 'Ancient books', 5.00),
(5, 1, 'Commercial', 'Lunar souvenirs', 50.00),
(9, 3, 'Technical', 'Engine spare parts', 200.00),
(10, 5, 'Commercial', 'Electric vehicle', 2000.00);

-- Insert Notifications
INSERT INTO Notification (user_id, contact_method, message, status) VALUES
(1, 'Email', 'Your flight to the Moon is confirmed.', 'Sent'),
(5, 'App', 'Gate change for Mission 3.', 'Read'),
(2, 'SMS', 'Rover Cargo registered successfully.', 'Sent'),
(6, 'Email', 'Reminder: Bring biological samples.', 'Read'),
(8, 'App', 'Welcome aboard Nebula Dream.', 'Sent'),
(9, 'SMS', '2-hour delay due to solar storm.', 'Failed'),
(1, 'App', 'Reservation cancelled for Mission 10.', 'Read'),
(3, 'Email', 'Guard shift assigned.', 'Sent'),
(7, 'SMS', 'Technical check completed.', 'Sent'),
(10, 'App', 'Promo: 20% off next trip.', 'Sent');
