-- queries.sql
 -- Which car manufacturers produce the most budget-friendly cars?
select make, any_value(model) as 'Model', min(price) as 'Cheapest Price' from automobile group by make;
-- What is the average price range of cars by body style (sedan, hatchback, SUV, convertible)?
select any_value(model) as 'Model', avg(price) as 'Avg Price', min(price) as 'Min Price', max(price) as 'Max Price' from automobile group by 'Model' order by 'Avg Price' desc;
 -- Which manufacturer has the most expensive model, and what features make it costly?
select make, model, engine_size, horsepower, price from automobile order by price desc limit 1;
 -- How do fuel types (gas vs diesel) affect the average price of cars?
select any_value(fuel_type) as 'Fuel type', avg(price) as 'Avg Price' from automobile group by 'Fuel type';
 -- What is the price difference between 2-door and 4-door cars?
select any_value(num_of_doors) as 'Num of doors', avg(price) as 'Avg Price' from automobile group by 'Num of doors';
 -- Do larger engines (engine-size) always mean higher prices?
select any_value(engine_size) as 'Engine size', avg(price) as 'Avg Price' from automobile group by 'Engine size' order by 'Engine size';
 -- Which manufacturer offers the best horsepower-to-price ratio?
select any_value(make) as 'Make', max(horsepower/price) as 'Best HP per price' from automobile where price is not null and horsepower is not null group by 'Make' order by 'Best HP per price';
 -- What is the average mileage (city-mpg & highway-mpg) for different engine types (diesel, gas, turbo)?
select any_value(fuel_type) as 'Fuel type', aspiration, avg(city_mpg) as 'Avg city mpg', avg(highway_mpg) as 'Avg highway mpg' from automobile group by 'Fuel type', aspiration;
 -- -- Which car has the highest horsepower 
select model, horsepower, price from automobile order by horsepower desc limit 1;
 --  which has the best mileage?
select make, model, highway_mpg, price from automobile order by highway_mpg desc limit 1;
 -- Does aspiration type (turbo vs standard) influence price significantly?
select any_value(aspiration) as 'Aspiration', avg(price) as 'Avg Price' from automobile group by 'Aspiration';
 -- What is the distribution of cars based on the number of cylinders?
select any_value(num_of_cylinders) as 'Num of cylinders', count(*) as 'Car count' from automobile group by 'Num of cylinders' order by 'Car count' desc;
 --  Which car models are most common in the dataset?
select any_value(model) as 'Most common model', count(*) as 'count' from automobile group by 'Most common model' order by 'count' desc;
 --  Do front-wheel, rear-wheel, or 4-wheel drive cars cost more on average?
select any_value(drive_wheels) as 'Drive wheels', avg(price) as 'Avg price' from automobile group by 'Drive wheels' order by 'Avg price' desc;
 -- What is the average price and performance difference between European and Japanese manufacturers?
select distinct any_value(make) as 'Make', avg(price) as 'Avg price' from automobile where 'Make' in ('audi', 'bmw', 'volkswagen', 'porsche', 'jaguar', 'honda', 'volvo', 'toyota', 'mazda', 'nissan', 'subaru' ) group by 'Make' order by 'Avg price' desc;
 -- If a customer wants maximum horsepower under $20,000, which car should they buy?
select make, model, horsepower, price from automobile where price < 20000 order by horsepower desc;
 -- Which manufacturer offers the widest variety of models in terms of price and performance?
select any_value(make) as 'Make', max(price) -  min(price) as 'Price range', max(horsepower) - min(horsepower) as 'Hp range' from automobile group by 'Make' order by 'Price range' desc, 'Hp range' desc;
 -- If fuel economy is the top priority, which top 5 cars should be recommended?
select make, model, highway_mpg, city_mpg, price from automobile order by highway_mpg desc, city_mpg desc limit 5;
 -- What is the trend between car weight (curb-weight) and fuel efficiency (mpg)?
select curb_weight, avg(city_mpg) as 'City mpg', avg(highway_mpg) as 'Highway mpg' from automobile group by curb_weight order by curb_weight;
 -- How much do customers need to pay extra for luxury (leather interiors, body style differences, higher cylinders)?
select any_value(num_of_cylinders) as 'Num of cylinders', avg(price) as 'Avg price' from automobile group by 'Num of cylinders' order by 'Avg price';