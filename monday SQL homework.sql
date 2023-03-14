1. How many actors are there with the last name ‘Wahlberg’?
    SELECT COUNT(*) FROM actors WHERE last_name = 'Wahlberg';
    #This query will return a single value, which is the count of the number of actors with the last name 'Wahlberg'.



2. How many payments were made between $3.99 and $5.99?
    SELECT COUNT(*) FROM payments WHERE amount BETWEEN 3.99 AND 5.99;
    #To count the number of payments made between $3.99 and $5.99 I needed to run  a SELECT statement on the database table that stores information about payments,
    filtering only those payments whose amount is between $3.99 and $5.99, and then count the number of rows returned. 




3. What film does the store have the most of? (search in inventory)
    SELECT film.title, COUNT(inventory.inventory_id) AS total_inventory
    FROM film
    JOIN inventory ON film.film_id = inventory.film_id
    GROUP BY film.film_id
    ORDER BY total_inventory DESC
    LIMIT 1;
    #I started by selecting the film title and counting the number of inventory items for each film.
    #Then I joined the film table with the inventory table on the film_id column.
    #I grouped the results by film_id to get the count of inventory items for each film.
    #Then sorted the results in descending order by the count of inventory items, so that the film with the most inventory items appears first.
    #I limited the results to only return the first row, which will be the film with the most inventory items.



4. How many customers have the last name ‘William’?
    SELECT COUNT(*) FROM customers WHERE last_name = 'William';
    #This query will return the count of all customers whose last name is 'William'. 
    Note that I had to replace customers with the name of the table containing customer information in the specific database.


5. What store employee (get the id) sold the most rentals?
    SELECT rentals.employee_id, COUNT(*) AS rental_count
    FROM rentals
    GROUP BY rentals.employee_id
    ORDER BY rental_count DESC
    LIMIT 1;
    # This query selects the employee ID and the number of rentals sold by each employee from the "rentals" table, groups the results by employee ID using the GROUP BY clause, 
    calculates the count of rentals sold by each employee using the COUNT(*) function, orders the results in descending order based on the rental count using the ORDER BY clause, 
    and limits the result set to the first row using the LIMIT 1 clause, which gives us the employee who sold the most rentals.


6. How many different district names are there?
    SELECT COUNT(DISTINCT name) FROM districts;
    #This query will return a single value, which represents the number of unique district names in the districts table.


7. What film has the most actors in it? (use film_actor table and get film_id)
    SELECT film_id, COUNT(actor_id) as actor_count
    FROM film_actor
    GROUP BY film_id
    ORDER BY actor_count DESC
    LIMIT 1;
    #This query will group the rows in the film_actor table by film_id, count the number of rows (actors) in each group, 
    and then sort the results in descending order of actor_count. Finally, it will limit the results to only the first row, 
    which will give us the film with the highest number of actors.



8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
    SELECT COUNT(*) 
    FROM customer 
    WHERE store_id = 1 AND last_name LIKE '%es';
    #This query will count the number of rows in the customer table where the store_id is 1 and the last_name ends with 'es', 
    using the LIKE operator and the wildcard '%' to match any characters before the 'es' ending. 
    The COUNT(*) function will return the number of matching rows.


9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
    with ids between 380 and 430? (use group by and having > 250)
    SELECT amount, COUNT(DISTINCT payment_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
AND customer_id IN (
    SELECT customer_id
    FROM rental
    WHERE customer_id BETWEEN 380 AND 430
    GROUP BY customer_id
    HAVING COUNT(*) > 250
)
GROUP BY amount;
#This query will first select all payments made by customers with IDs between 380 and 430 who also had more than 250 rentals. 
It does this by using a subquery to select the customer IDs from the rental table and then filtering the payment table based on those IDs. 
It then groups the payments by amount and counts the number of distinct payment IDs for each amount using the COUNT(DISTINCT) function. 
The result will be a list of payment amounts and their corresponding count of distinct payment IDs that meet the specified conditions.



10. Within the film table, how many rating categories are there? And what rating has the most
    movies total?
    SELECT COUNT(DISTINCT rating) AS num_rating_categories
    FROM film;
    SELECT rating, COUNT(*) AS num_movies
    FROM film
    GROUP BY rating
    ORDER BY num_movies DESC
    LIMIT 1;
This query will group the rows in the "film" table by the "rating" column, count the number of movies for each rating category using the COUNT() function, 
sort the result in descending order by the count using the ORDER BY clause, and select only the first row using the LIMIT clause. 
This will return the rating category with the highest count of movies.