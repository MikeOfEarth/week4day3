-- 1. List all customers who live in Texas (use
-- JOINs)

SELECT count(DISTINCT customer.customer_id)
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id 
WHERE address.district Like 'Texas'
-- Counting up 5


-- 2. Get all payments above $6.99 with the Customers Full
-- Name
SELECT DISTINCT first_name,last_name
FROM customer
LEFT JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99
-- Best name in the bunch is Alfredo McAdams... killer


-- 3. Show all customers names who have made payments over $175(use
-- subqueries)
SELECT first_name,last_name
FROM customer
WHERE customer_id IN (
    SELECT DISTINCT payment.customer_id
    FROM payment
    WHERE amount>175
)
-- Mary, Peter and Dougie Graf


-- 4. List all customers that live in Nepal (use the city
-- table)
SELECT DISTINCT first_name,last_name,country
FROM customer
WHERE address_id IN(
    SELECT address_id
    FROM address
    where city_id IN(
        SELECT city_id
        FROM city
        WHERE country_id IN(
            SELECT country_id
            FROM country
            where country Like 'Nepal'
        )
    )
)
-- Damn Kevin, why you hiding



-- 5. Which staff member had the most
-- transactions?
SELECT first_name,last_name, count(payment_id)
FROM staff
LEFT JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
Order BY count(payment_id) desc


-- 6. How many movies of each rating are
-- there?
SELECT film.rating, count(film_id)
From film
GROUP BY film.rating
Order BY count(film_id) desc

-- 7.Show all customers who have made a single payment
-- above $6.99 (Use Subqueries)
SELECT first_name, last_name
From customer
where customer_id IN(
    select customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING count(payment_id) = 1
)
-- What a gang there


-- 8. H
-- o
-- w

-- m
-- a
-- n
-- y

-- f
-- r
-- e
-- e

-- r
-- e
-- n
-- t
-- als
-- did

-- o
-- u
-- r

-- s
-- t
-- o
-- r
-- e
-- s

-- giv
-- e

-- a
-- w
-- a
-- y
-- ?
-- yo I'm not fixing that formatting
select count(payment_id)
FROM payment
where amount <=0


select count(payment_id)
FROM payment
LEFT JOIN staff
ON staff.staff_id = payment.staff_id
Where (staff.store_id=1 or staff.store_id=2) and payment.amount <= 0

-- I'm thinking with how easy this was I didn't understand the question