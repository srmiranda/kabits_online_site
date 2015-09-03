### Instructions

Update the [grocery list app](/lessons/grocery-list-sinatra) from Week 1 to read and write information to a PostgreSQL database instead of a CSV or a TXT file.

### Getting Set Up

* Create a database called `grocery_list`.
* Define your tables in a `schema.sql` file.
* Create tables by running `psql grocery_list < schema.sql` at the command line.

### Requirements Necessary to Meet Expectations

* Visiting `GET /groceries` should display the index page for groceries. This page should contain a list of groceries read from the database, as well as a form for adding a new grocery item.
* The form to add a new grocery item requires that the name be specified.
* If the grocery item is left blank when the form is submitted...
  - A new grocery item record **should NOT** be saved to the database.
  - The user should see the index page for groceries.
* The form should submit to `POST /groceries`, which will save the new item to the database.
* Modify your app so grocery items have comments. Modify your `schema.sql` file to create a new table for comments. Feel free to add a `DROP TABLES` line, so you can re-run your schema repeatedly.
* Create a `data.sql` file. Write SQL statements to insert a grocery item, as well as insert two or more comments for that grocery item in the `data.sql` file. Add these records to the database by running the following command: `psql grocery_list < data.sql`
* Clicking on a grocery item takes you to `GET /groceries/:id`.
* Visiting `GET /groceries/:id` should display the name of the grocery, a list of comments on the grocery.
* The list of comments **must** be retrieved using a SQL `JOIN` statement.

### Tips

* Feel free to copy over code from the first Grocery List app!
* **DO NOT** start the requirements necessary to exceed expectations before completing the requirements necessary to meet expectations.

### Requirements Necessary to Exceed Expectations
* On the index page for groceries, add a button with the text "Delete" to the right of each list item.
* Clicking on the "Delete" button submits to `DELETE /groceries/:id`, which deletes the grocery item from the database.
* On the index page for groceries, add a link with the text "Update" to the right of each "Delete" link.
* Clicking on the "Update" link takes you to `GET /groceries/:id/edit`.
* Visiting `GET /groceries/:id/edit` displays a form pre-populated with the name of the grocery. The form submits to `PATCH /groceries/:id`, which updates the name of the item in the database.
* If the grocery item is left blank when the form is submitted...
  - The grocery item name **should NOT** be changed in the database.
  - The user should see the edit page for that grocery item.

### Tips

To have your form submit to the `DELETE` or `PATCH` routes in your Sinatra app, set the form method to `POST` and add a hidden input field, which has the `name` attribute set to `_method` and the `value` attribute set to the appropriate HTTP method.

```html
<form method="post" action="/">
  <input type="hidden" name="_method" value="HTTP METHOD HERE">
  #.. all of your form fields
</form>
```
