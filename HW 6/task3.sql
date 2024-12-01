SELECT DISTINCT s.first_name
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND rm.room_name = 'Green' AND rm.room_date BETWEEN 160201 AND 160229;

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball'
);

SELECT b.cust_name, b.bill_total, s.first_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.table_no IN (
    SELECT table_no FROM restBill WHERE bill_no IN (00014, 00017)
);

SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT headwaiter FROM restRoom_management WHERE room_name = 'Blue' AND room_date = 160312
)
OR s.headwaiter = (
    SELECT headwaiter FROM restRoom_management WHERE room_name = 'Blue' AND room_date = 160312
);