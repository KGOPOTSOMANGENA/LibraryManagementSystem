-- Get all books
SELECT * FROM books;

-- Get all available books
SELECT * FROM books WHERE available = TRUE;

-- Find all American authors
SELECT * FROM authors WHERE nationality = 'American';

----Sprint 4
-- Mark a book as borrowed set available = false
UPDATE books SET available = FALSE WHERE id = 1;


-- Return a book set available = true
UPDATE books SET available = TRUE WHERE id = 1;


-- Add a new genre to an existing book 
UPDATE books
SET genres = array_append(genres, 'Classic')
WHERE id = 3 AND NOT ('Classic' = ANY(genres));


-- Add a borrowed book to a patron's record 
UPDATE patrons
SET borrowed_books = array_append(borrowed_books, 1)
WHERE id = 1 AND NOT (1 = ANY(borrowed_books));

BEGIN;
INSERT INTO loans (patron_id, book_id) VALUES (1, 1);
UPDATE books SET available = FALSE WHERE id = 1;
COMMIT;

--Sprint 5

-- Delete a book by title
DELETE FROM books WHERE title = 'The Hobbit';


-- Delete an author by ID 
DELETE FROM authors WHERE id = 10;

--Sprint 6

-- Find books published after 1950
SELECT * FROM books WHERE published_year > 1950;


-- Find all American authors
SELECT * FROM authors WHERE LOWER(nationality) = 'american';


-- Set all books as available
UPDATE books SET available = TRUE;


-- Find all books that are available AND published after 1950
SELECT * FROM books WHERE available = TRUE AND published_year > 1950;


-- Find authors whose names contain "George" (case insensitive)
SELECT * FROM authors WHERE name LIKE '%George%';


-- Increment the published year 1869 by 1 
UPDATE books SET published_year = published_year + 1 WHERE published_year = 1869;

