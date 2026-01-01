-- 1. inner join bookings with users and vehicles to get detailed booking information
SELECT 
    b.booking_id,
    u.name AS customer_name,
    v.vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
ORDER BY b.booking_id;

-- 2. find all vehicles that have never been booked

SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

-- 3. list all available cars for rent

SELECT *
FROM vehicles
WHERE type = 'Car'
  AND availability_status = 'Available';

-- 4. count total bookings for each vehicle and list vehicles with more than 2 bookings

SELECT 
    v.vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_name
HAVING COUNT(b.booking_id) > 2;


