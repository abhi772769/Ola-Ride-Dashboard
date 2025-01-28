use ola;
select * from bookings;

#  1.Retrieve all successful bookings:
create view Successful_Bookings as
select * from bookings
where Booking_Status = 'Success';

select * from Successful_Bookings;


# 2. Find the average ride distance for each vehicle type:
create view ride_dist_for_each_vehicle as
select Vehicle_Type ,avg(Ride_Distance) as Average_Dist
from bookings
group by Vehicle_Type;

select * from ride_dist_for_each_vehicle;



# 3.Get the total number of cancelled rides by customers
create view cancelled_rides_by_customers as
select count(Booking_ID) as Canceled_by_Customer_count
from bookings 
where Booking_Status = 'Canceled by Customer';

select * from cancelled_rides_by_customers;


# 4.List the top 5 customers who booked the highest number of rides:
create view top_5_customer as 
select Customer_ID, count(Booking_ID) as total_ride
from bookings
group by Customer_ID
order by count(Customer_ID) desc limit 5;

select * from top_5_customer;


# 5.Get the number of rides cancelled by drivers due to personal and car-related issues
create view rides_cancelled_by_drivers_P_C_issues as
select count(*) 
from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';
	
    
# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT 
    MAX(CAST(Driver_Ratings AS DECIMAL)) AS maximum_rate,
    MIN(CAST(Driver_Ratings AS DECIMAL)) AS minimum_rate
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan' 
  AND Driver_Ratings NOT IN ('NA', '');



# 7. Retrieve all rides where payment was made using UPI:
select * 
from bookings
where Payment_Method = 'UPI';



# 8. Find the average customer rating per vehicle type:
select Vehicle_Type ,  round(avg(Customer_Rating),2) as avg_cust_rating
from bookings
group by Vehicle_Type
order by avg_cust_rating desc;


# 9. Calculate the total booking value of rides completed successfully
select sum(Booking_Value) 
from bookings 
where Booking_Status = 'Success';


# 10. List all incomplete rides along with the reason
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';