SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

SELECT r.room_name, COUNT(*) AS num_large_tables
FROM restRest_table r
WHERE r.no_of_seats > 6
GROUP BY r.room_name;

SELECT r.room_name, SUM(b.bill_total) AS total_bill_amount
FROM restBill b
JOIN restRest_table r ON b.table_no = r.table_no
GROUP BY r.room_name;

SELECT hw.first_name AS headwaiter_name, hw.surname AS headwaiter_surname, SUM(b.bill_total) AS total_bill_amount
FROM restStaff hw
JOIN restStaff w ON hw.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY hw.first_name, hw.surname
ORDER BY total_bill_amount DESC;

SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400.00;

SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(b.bill_no) >= 3;