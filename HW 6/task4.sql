SELECT b.cust_name
FROM restBill b
JOIN restRoom_management rm ON b.table_no IN (
    SELECT table_no FROM restRest_table WHERE rm.room_name = 'Green'
)
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND b.bill_total > 450.00;

SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT headwaiter FROM restRoom_management
    WHERE room_date = 160111
    AND room_name = (
        SELECT r.room_name
        FROM restBill b
        JOIN restRest_table r ON b.table_no = r.table_no
        WHERE b.cust_name = 'Nerida Smith' AND b.bill_date = 160111
    )
);

SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

SELECT first_name
FROM restStaff
WHERE staff_no NOT IN (SELECT waiter_no FROM restBill);

SELECT b.cust_name, s.first_name AS headwaiter_name, s.surname AS headwaiter_surname, rm.room_name
FROM restBill b
JOIN restRest_table r ON b.table_no = r.table_no
JOIN restRoom_management rm ON r.room_name = rm.room_name
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);