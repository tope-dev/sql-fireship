-- @block
CREATE TABLE Rooms(
  id INT AUTO_INCREMENT,
  street VARCHAR(255),
  owner_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (owner_id) REFERENCES Users(id)
);

-- @block
INSERT INTO Rooms (owner_id, street)
VALUES
  (2, 'san diego sailboat'),
  (2, 'nantucket cottage'),
  (2, 'vail cabin'),
  (2, 'sf cardboard box');

  -- @block
  SELECT * FROM Bookings;

  -- @BLOCK
  SELECT 
    Users.id AS user_id,
    Rooms.id AS room_id,
    email,
    street
  FROM Users
  INNER JOIN Rooms ON Rooms.owner_id = Users.id;

-- @BLOCK
CREATE TABLE Bookings(
  id INT AUTO_INCREMENT,
  guest_id INT NOT NULL,
  room_id INT NOT NULL,
  check_in DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (guest_id) REFERENCES Users(id),
  FOREIGN KEY (room_id) REFERENCES Rooms(id)
);

-- @block Rooms a user has booked
SELECT
  guest_id,
  street,
  check_in
FROM Bookings
INNER JOIN Rooms ON Rooms.owner_id = guest_id
WHERE guest_id = 1;

-- @block Guests who stayed in a room
SELECT
  room_id,
  guest_id,
  email,
  bio
FROM Bookings
INNER JOIN Users ON Users.id = guest_id
WHERE room_id = 2;