-- 1. How many actors are there with the last name 'Wahlberg'?
-- answer: 2
select first_name, last_name
from actor
where last_name like 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99?
-- answer: 0
-- (most payments are negative, the rest go from 916.67 to 16.99)
from payment
where amount >= 3.99 and amount <= 5.99
order by amount desc;


-- 3. What film does the store have the most of? (search in inventory)
-- Multiple inventory_id's for each film_id (multiple in stock)
-- Group by film_id, count inventory_id 
-- answer: there are 72 films with the max of 8 copies in stock
select film_id, count(inventory_id) as copies_in_stock
from inventory
group by film_id
order by count(inventory_id) desc;

-- (film 200 has 8 copies)
select * from inventory order by film_id


-- 4. How many customers have the last name 'William'?
-- answer: 0
select first_name, last_name
from customer
where last_name like 'William';


-- 5. What store employee (get the id) sold the most rentals?
-- answer: employee 1 with 8040 sales (emp 2 had 8004)
-- exploratory
select * from rental
order by rental_id;

-- rental_id is the transaction, group by staff_id and count rental_id
select staff_id, count(rental_id)
from rental
group by staff_id
order by count(rental_id) desc;


-- 6. How many different district names are there?
-- exploratory
select * from address

-- these are addresses across the world, count distinct districts
-- answer: 378
select count(distinct district)
from address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- answer: film 508 with 15 actors
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;


-- 8. From store_id 1, how many customers have a last name ending with 'es'? (use customer table)
-- answer: 13
select store_id, first_name, last_name
from customer
where store_id = 1 and last_name like '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
-- answer: 3
select amount
from payment
where customer_id between 380 and 430
group by amount
having count(payment_id) > 250
order by amount desc;


-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
-- answer: 5 categories, largest is PG-13 with 223 movies
select rating, count(rating)
from film
group by rating
order by count(rating) desc;
