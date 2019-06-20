-- Order
1.) select * from subjects order by subject;

  id |     subject      |     location     
----+------------------+------------------
  0 | Arts             | Creativity St
  1 | Business         | Productivity Ave
  2 | Children's Books | Kids Ct
  3 | Classics         | Academic Rd
  4 | Computers        | Productivity Ave
  5 | Cooking          | Creativity St
  6 | Drama            | Main St
  7 | Entertainment    | Main St
  8 | History          | Academic Rd
  9 | Horror           | Black Raven Dr
 10 | Mystery          | Black Raven Dr
 11 | Poetry           | Sunset Dr
 12 | Religion         | 
 13 | Romance          | Main St
 14 | Science          | Productivity Ave
 15 | Science Fiction  | Main St
(16 rows)

2.) select * from subjects order by location;

 id |     subject      |     location     
----+------------------+------------------
  8 | History          | Academic Rd
  3 | Classics         | Academic Rd
 10 | Mystery          | Black Raven Dr
  9 | Horror           | Black Raven Dr
  0 | Arts             | Creativity St
  5 | Cooking          | Creativity St
  2 | Children's Books | Kids Ct
  7 | Entertainment    | Main St
  6 | Drama            | Main St
 13 | Romance          | Main St
 15 | Science Fiction  | Main St
 14 | Science          | Productivity Ave
  4 | Computers        | Productivity Ave
  1 | Business         | Productivity Ave
 11 | Poetry           | Sunset Dr
 12 | Religion         | 
(16 rows)

-- Where

3.select title from books where title = 'Little Women';

    title     
--------------
 Little Women
(1 row)

4.)  select title from books where title like '%Python%';

       title        
--------------------
 Programming Python
 Learning Python
(2 rows)

5.) select *  from subjects where location = 'Main St' order by subjects;

 id |     subject     | location 
----+-----------------+----------
  6 | Drama           | Main St
  7 | Entertainment   | Main St
 13 | Romance         | Main St
 15 | Science Fiction | Main St
(4 rows)

--  Join
6.) select title 
from books b 
join subjects s on s.id = b.subject_id 
where b.subject_id = (select id from subjects where subject = 'Computers');

        title         
----------------------
 Programming Python
 Learning Python
 Perl Cookbook
 Practical PostgreSQL

 7.)select books.title, authors.first_name, authors.last_name, subjects.subject from books 
    join authors on books.author_id = authors.id 
    join subjects on books.subject_id = subjects.id;

                title            |    first_name    |  last_name   |     subject      
-----------------------------+------------------+--------------+------------------
 Practical PostgreSQL        | John             | Worsley      | Computers
 Franklin in the Dark        | Paulette         | Bourgeois    | Children's Books
 The Velveteen Rabbit        | Margery Williams | Bianco       | Classics
 Little Women                | Louisa May       | Alcott       | Drama
 The Shining                 | Stephen          | King         | Horror
 Dune                        | Frank            | Herbert      | Science Fiction
 Dynamic Anatomy             | Burne            | Hogarth      | Arts
 Goodnight Moon              | Margaret Wise    | Brown        | Children's Books
 The Tell-Tale Heart         | Edgar Allen      | Poe          | Horror
 Programming Python          | Mark             | Lutz         | Computers
 Learning Python             | Mark             | Lutz         | Computers
 Perl Cookbook               | Tom              | Christiansen | Computers
 2001: A Space Odyssey       | Arthur C.        | Clarke       | Science Fiction
 The Cat in the Hat          | Theodor Seuss    | Geisel       | Children's Books
 Bartholomew and the Oobleck | Theodor Seuss    | Geisel       | Children's Books

 8.) select title, retail 
  from books 
  join editions on books.id = editions.book_id 
  join stock on editions.isbn = stock.isbn 
  order by retail desc;

            title            | retail 
-----------------------------+--------
 2001: A Space Odyssey       |  46.95
 Dune                        |  45.95
 The Shining                 |  36.95
 The Cat in the Hat          |  32.95
 Goodnight Moon              |  28.95
 The Shining                 |  28.95
 Dynamic Anatomy             |  28.95
 The Tell-Tale Heart         |  24.95
 The Velveteen Rabbit        |  24.95
 The Cat in the Hat          |  23.95
 Franklin in the Dark        |  23.95
 Little Women                |  23.95
 2001: A Space Odyssey       |  22.95
 The Tell-Tale Heart         |  21.95
 Dune                        |  21.95
 Bartholomew and the Oobleck |  16.95
(16 rows)

9.) select title, editions.isbn, name, retail                                                                                                                                                                                        
from books join editions on books.id = editions.book_id                                                                       
join stock on editions.isbn = stock.isbn                                                                                                        
join publishers on editions.publisher_id = publishers.id                                                                                               
where title = 'Dune';

 title |    isbn    |   name    | retail 
-------+------------+-----------+--------
 Dune  | 0441172717 | Ace Books |  21.95
 Dune  | 044100590X | Ace Books |  45.95
(2 rows)

10.) select first_name, last_name, ship_date, title
    from shipments join editions on shipments.isbn = editions.isbn
    join customers on shipments.customer_id = customers.id
    join books on editions.book_id = books.id
    order by ship_date;

 first_name | last_name |       ship_date        |            title            
------------+-----------+------------------------+-----------------------------
 Owen       | Bollman   | 2001-08-05 09:34:04-07 | Little Women
 Laura      | Bennett   | 2001-08-06 07:49:44-07 | Goodnight Moon
 Chad       | Allen     | 2001-08-06 09:29:21-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-06 11:46:36-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-08-07 10:58:36-07 | Bartholomew and the Oobleck
 Royce      | Morrill   | 2001-08-07 11:31:57-07 | The Tell-Tale Heart
 Christine  | Holloway  | 2001-08-07 11:56:42-07 | 2001: A Space Odyssey
 Eric       | Morrill   | 2001-08-07 13:00:48-07 | Little Women
 Jonathan   | Anderson  | 2001-08-08 08:36:44-07 | The Shining
 Ed         | Gould     | 2001-08-08 09:53:46-07 | The Shining
 Annie      | Jackson   | 2001-08-08 10:46:13-07 | Bartholomew and the Oobleck
 Dave       | Olson     | 2001-08-09 07:30:07-07 | The Velveteen Rabbit
 Wendy      | Black     | 2001-08-09 09:30:46-07 | The Velveteen Rabbit
 Rich       | Thomas    | 2001-08-10 07:29:52-07 | Franklin in the Dark
 Jean       | Black     | 2001-08-10 08:29:42-07 | The Tell-Tale Heart
 Eric       | Morrill   | 2001-08-10 13:47:52-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-08-11 09:55:05-07 | Bartholomew and the Oobleck
 Richard    | Brown     | 2001-08-11 10:52:34-07 | Goodnight Moon
 James      | Williams  | 2001-08-11 13:34:08-07 | The Cat in the Hat
 Kate       | Gerdes    | 2001-08-12 08:46:35-07 | Dune
 Jean       | Owens     | 2001-08-12 12:09:47-07 | Franklin in the Dark
 Owen       | Becker    | 2001-08-12 13:39:22-07 | The Shining
 Julie      | Bollman   | 2001-08-13 09:42:10-07 | The Cat in the Hat
 Kathy      | Corner    | 2001-08-13 09:47:04-07 | The Cat in the Hat
 Tim        | Owens     | 2001-08-14 07:33:47-07 | Dynamic Anatomy
 Trevor     | Young     | 2001-08-14 08:42:58-07 | Dune
 Chuck      | Brown     | 2001-08-14 10:36:41-07 | The Shining
 Adam       | Holloway  | 2001-08-14 13:41:39-07 | The Tell-Tale Heart
 Jenny      | King      | 2001-08-14 13:45:51-07 | The Shining
 Tammy      | Robinson  | 2001-08-14 13:49:00-07 | Franklin in the Dark
 James      | Clark     | 2001-08-15 11:57:40-07 | Goodnight Moon
 Shirley    | Gould     | 2001-08-15 14:02:01-07 | 2001: A Space Odyssey
 Jenny      | King      | 2001-09-14 16:46:32-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-14 17:42:22-07 | The Cat in the Hat
 Annie      | Jackson   | 2001-09-22 11:23:28-07 | Bartholomew and the Oobleck
 Annie      | Jackson   | 2001-09-22 20:58:56-07 | Bartholomew and the Oobleck
(36 rows)

-- Group and Counting 

11.) select count(*) from books;

 count 
-------
    15

12.) select count(location) from subjects;
 count 
-------
    15
13.) select location, count(location) from subjects group by location;

     location     | count 
------------------+-------
                  |     0
 Academic Rd      |     2
 Main St          |     4
 Productivity Ave |     3
 Sunset Dr        |     1
 Creativity St    |     2
 Black Raven Dr   |     2
 Kids Ct          |     1

 14.) select books.id, title, count(editions.edition)                                                                                                                                                                                  
 from books join editions on books.id = editions.book_id                                                                                                                                                                                     
 group by books.id;
 
  id   |            title            | count 
-------+-----------------------------+-------
  7808 | The Shining                 |     2
  4513 | Dune                        |     2
  1590 | Bartholomew and the Oobleck |     1
 25908 | Franklin in the Dark        |     1
   156 | The Tell-Tale Heart         |     2
  4267 | 2001: A Space Odyssey       |     2
  1501 | Goodnight Moon              |     1
  2038 | Dynamic Anatomy             |     1
 41473 | Programming Python          |     1
   190 | Little Women                |     1
  1608 | The Cat in the Hat          |     2
  1234 | The Velveteen Rabbit        |     1