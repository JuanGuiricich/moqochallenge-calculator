# Calculator Api

This challenge was made as part of the recruitment process for a job position at Moqo.

the task was to write a small web-service which offers the following functionality: for a given arithmetic
expression (Integer Numbers and the operators +-*/), the service should respond to the
result of the expression.

## What I've Learned

I went deeper on the use of RegEx to successfully parse the expression and divided into number1, number2 and the operation symbol. I learned about the eval() function of Ruby which I didn't knew, but was not what I was looking for since I couldn't make it work on float numbers.

## How to run

to run the project you need to do an HTTP GET with the following parameters:

calculator?expression=1-1
calculator?expression=2*3
calculator?expression=6/2

and for the sum, as the + sign is a reserved character, you need to use %2B instead of the + sign

calculator?expression=1%2B2

## Task “The Archive”

We record vehicle events in our database. Assume the table is called “car_snapshots” and
looks roughly as follows:

id timestamp data_1...
1234 1551343776 ignition_off

(assume the table only has an index on “id” and “timestamp” and is otherwise a plain table)
Over time, that table grew to millions and millions of entries and we don’t need older ones
anymore (but still do not want to lose them). The table is “insert only”, so an event is only
added but never modified.
What would be your approach to archive these rows in the production environment? Please
remember there are a lot of rows and data is constantly added with a rate of 10 rows per
second. Write a small concept - a high level idea is enough.

## Approach

based on the timespans we can move older entries into a new table and schedule a process to select this entries and move them to the new storage table and delete them from the original table. This process can be scheduled to run every day at midnight for example. In order to retrieve this archived data we can create a view that will join the original table with the new storage table and return the data as if it was in the original table.

