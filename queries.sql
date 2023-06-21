-- write your queries here

-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id .
SELECT * FROM owners LEFT JOIN vehicles on owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. The first_name should be ordered in ascending order.
SELECT first_name, last_name, COUNT(owner_id) AS count FROM vehicles
JOIN owners
ON vehicles.owner_id = owners.id
GROUP BY owners.first_name, owners.last_name
ORDER BY owners.first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name , last_name, average price 
-- and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.
SELECT first_name, last_name, ROUND(SUM(price) / COUNT(*)) AS average_price, COUNT(*) AS count
FROM vehicles
JOIN owners
ON vehicles.owner_id = owners.id
GROUP BY owners.first_name, owners.last_name
HAVING COUNT(*) > 1 AND ROUND(SUM(price) / COUNT(*)) > 10000
ORDER BY owners.first_name DESC;