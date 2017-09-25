USE db_library
GO

CREATE PROCEDURE dbo.uspQueryLibrary
AS
SELECT copy_nbr 
FROM tbl_book
INNER JOIN tbl_copies ON copy_id = tbl_book.book_id
INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_copies.branch_id
WHERE branch_name = 'Sharpstown' AND book_title = 'The Lost Tribe'
;

SELECT copy_nbr 
FROM tbl_book
INNER JOIN tbl_copies ON copy_id = tbl_book.book_id
INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_copies.branch_id
WHERE book_title = 'The Lost Tribe'
;



SELECT name 
FROM tbl_borrower
WHERE card_nbr NOT IN (SELECT card_nbr FROM tbl_loans);


SELECT book_title, name, address
FROM tbl_book
INNER JOIN tbl_loans ON tbl_loans.book_id = tbl_book.book_id
INNER JOIN tbl_branch ON tbl_branch.branch_id = tbl_loans.branch_id
INNER JOIN tbl_borrower ON tbl_borrower.card_nbr = tbl_loans.card_nbr
WHERE branch_name = 'Sharpstown' AND date_due = '2017-09-22'
;

SELECT branch_name, COUNT(tbl_loans.branch_id)
FROM tbl_branch
INNER JOIN tbl_loans ON tbl_loans.branch_id = tbl_branch.branch_id
GROUP BY tbl_branch.branch_id,tbl_branch.branch_name
;

SELECT name,[address],COUNT(tbl_loans.branch_id) AS book_tot
FROM tbl_loans
INNER JOIN tbl_borrower ON tbl_borrower.card_nbr = tbl_loans.card_nbr
GROUP BY name, [address], tbl_loans.branch_id
Having COUNT(tbl_loans.branch_id) >5;

SELECT book_title, copy_nbr
FROM tbl_book
INNER JOIN tbl_authors ON tbl_authors.author_id = tbl_book.book_id
INNER JOIN tbl_copies ON tbl_copies.copy_id = tbl_book.book_id
INNER JOIN tbl_branch ON tbl_branch.branch_id= tbl_copies.branch_id
WHERE author_name = 'Stephan King' AND branch_name = 'Central'
;

GO
