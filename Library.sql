CREATE DATABASE db_library
USE db_library
GO

CREATE TABLE tbl_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(100) NOT NULL
);

INSERT INTO tbl_branch
	(branch_name, branch_address)
	VALUES
	('Sharpstown', '6400 High Star Dr'),
	('Central', '503 E Hancock St'),
	('Chapter', '1144 35th Ave'),
	('Valley', '201 SW Waldo Pl')
;

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(100) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(100) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL
);

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Picador', '175 5th Ave, New York, NY 10010', '(800) 221-7945'),
	('William Morrow', '1660 Lincoln St Suite 2950, Denver, CO 80264', '(303) 572-4200'),
	('Random House', '245 Hudson St, New York, NY 10013', '(646) 336-1375'),
	('Gallery Books', '1230 6th Ave, New York, NY 10020', '(212) 698-7243'),
	('Knopf', '845 3rd Ave #11, New York, NY 10022', '(646) 556-6395'),
	('Scribner', '597 5th Ave, New York, NY 10017', '(210) 695-7233')
;

CREATE TABLE tbl_borrower (
	borrower_cardno INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL	
);

INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Jason Stone', '9450 SW Barnes Rd', '5036548987'),
	('Amy Bowen', '21420 NE Red Hills Ln', '9712365487'),
	('Patrick Seth', '206 N Edwards St', '6458965452'),
	('Karen Kun', '2711 NW Venetian Dr', '4569875312'),
	('James Laura', '10320 SW Paulina Dr', '4567867566'),
	('Tom Bucanon', '5601 SE 50th Ave', '4589652365'),
	('Gina Birky', '1907 N Main St', '1236547896'),
	('Seth Johnson', '1405 7th St', '5895462356')
;

CREATE TABLE tbl_books (
	books_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	books_title VARCHAR(100) NOT NULL,
	books_publisher_name VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_books
	(books_title, books_publisher_name)
	VALUES
	('The Lost Tribe', 'Picador'),
	('Educated: A Memoir', 'Random House'),
	('Washington Black: A novel', 'Knopf'),
	('Elevation', 'Scribner'),
	('The Woman in the Window: A Novel', 'William Morrow'),
	('The Institute: A Novel', 'Scribner '),
	('The Outsider: A Novel', 'Gallery Books'),
	('THE TRUTH MACHINE', 'Picador'),
	('THE DAY SHE DISAPPEARED', 'Picador'),
	('MEMENTO PARK', 'Picador'),
	('Darkness at Noon', 'Scribner'),
	('ELOQUENT RAGE', 'Picador'),
	('Looker', 'Scribner'),
	('The Silhouette Girl', 'Gallery Books'),
	('Sing to It', 'Scribner'),
	('An American Summer', 'Knopf'),
	('Every Note Played', 'Gallery Books'),
	('The Efficiency Paradox', 'Knopf'),
	('The Devil Aspect', 'Knopf'),
	('The Sun Also Rises', 'Scribner')
;

CREATE TABLE tbl_authors (
	authors_books_id INT NOT NULL CONSTRAINT fk_books_id FOREIGN KEY REFERENCES tbl_books(books_id) ON UPDATE CASCADE ON DELETE CASCADE,
	authors_name VARCHAR(50) NOT NULL
);

INSERT INTO tbl_authors
	(authors_books_id, authors_name)
	VALUES
	(100, 'Mark Lee'),
	(101, 'Tara Westover'),
	(102, 'Esi Edugyan'),
	(103, 'Stephen King'),
	(104, 'A. J. Finn'),
	(105, 'Stephen King'),
	(106, 'Stephen King'),
	(107, 'Michael J. Casey'),
	(108, 'Christobel Kent'),
	(109, 'Mark Sarvas'),
	(110, 'Arthur Koestler'),
	(111, 'Brittney Cooper'),
	(112, 'Laura Sims'),
	(113, 'V.C. Andrews'),
	(114, 'Amy Hempel'),
	(115, 'ALEX KOTLOWITZ'),
	(116, 'Lisa Genova'),
	(117, 'EDWARD TENNER'),
	(118, 'CRAIG RUSSELL'),
	(119, 'Ernest Hemingway')
;

CREATE TABLE tbl_copies (
	copies_books_id INT NOT NULL CONSTRAINT fk_books_id2 FOREIGN KEY REFERENCES tbl_books(books_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_number INT NOT NULL
);

INSERT INTO tbl_copies
	(copies_books_id, copies_branch_id, copies_number)
	VALUES
	(100, 1, 3), (100, 2, 3), (100, 3, 3), (100, 4, 3), (101, 1, 2), (101, 3, 2), (102, 2, 2), (102, 4, 2), (103, 2, 2), (103, 1, 2),
	(104, 3, 2), (104, 4, 2), (105, 2, 3), (105, 1, 3), (106, 2, 3), (106, 1, 3), (107, 3, 4), (107, 4, 5), (108, 3, 3), (108, 4, 2),
	(109, 1, 2), (109, 4, 2), (110, 2, 3), (110, 3, 2), (111, 2, 2), (111, 3, 4), (112, 3, 3), (112, 2, 2), (113, 1, 2), (113, 2, 3),
	(114, 1, 4), (114, 3, 3), (115, 1, 2), (115, 4, 2), (116, 1, 2), (116, 3, 2), (117, 4, 3), (118, 4, 4), (119, 4, 2)
;

CREATE TABLE tbl_loans (
	loans_books_id INT NOT NULL CONSTRAINT fk_books_id3 FOREIGN KEY REFERENCES tbl_books(books_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_branch_id INT NOT NULL CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_borrower_cardno INT NOT NULL CONSTRAINT fk_borrower_cardno FOREIGN KEY REFERENCES tbl_borrower(borrower_cardno) ON UPDATE CASCADE ON DELETE CASCADE,
	loans_date_out DATE NOT NULL,
	loans_date_due DATE NOT NULL
);

INSERT INTO tbl_loans
	(loans_books_id, loans_branch_id, loans_borrower_cardno, loans_date_out, loans_date_due)
	VALUES
	(100, 1, 1000, '2019-03-01', '2019-03-09'), (100, 1, 1002, '2019-03-01', '2019-04-01'), (100, 2, 1004, '2019-03-01', '2019-04-01'), (100, 2, 1005, '2019-03-01', '2019-04-01'),
	(100, 3, 1006, '2019-03-01', '2019-03-09'), (119, 4, 1001, '2019-03-01', '2019-04-01'), (100, 4, 1001, '2019-03-01', '2019-04-01'), (100, 4, 1003, '2019-03-01', '2019-04-01'),
	(101, 1, 1000, '2019-03-01', '2019-03-09'), (101, 1, 1001, '2019-03-01', '2019-04-01'), (101, 3, 1002, '2019-03-01', '2019-04-01'), (101, 3, 1003, '2019-03-01', '2019-04-01'),
	(102, 2, 1000, '2019-03-01', '2019-03-09'), (102, 2, 1001, '2019-03-01', '2019-04-01'), (102, 4, 1002, '2019-03-01', '2019-04-01'), (102, 4, 1003, '2019-03-01', '2019-04-01'),
	(103, 2, 1000, '2019-03-01', '2019-03-09'), (103, 2, 1001, '2019-03-01', '2019-04-01'), (103, 1, 1002, '2019-03-01', '2019-04-01'), (103, 1, 1003, '2019-03-01', '2019-04-01'),
	(104, 3, 1000, '2019-03-01', '2019-03-09'), (104, 3, 1001, '2019-03-01', '2019-04-01'), (104, 4, 1002, '2019-03-01', '2019-04-01'), (104, 4, 1003, '2019-03-01', '2019-04-01'),
	(105, 2, 1004, '2019-03-01', '2019-03-09'), (105, 2, 1005, '2019-03-01', '2019-04-01'), (105, 1, 1006, '2019-03-01', '2019-04-01'), (105, 1, 1000, '2019-03-01', '2019-04-01'),
	(106, 2, 1004, '2019-03-01', '2019-03-09'), (106, 2, 1005, '2019-03-01', '2019-04-01'), (106, 1, 1006, '2019-03-01', '2019-04-01'), (106, 1, 1002, '2019-03-01', '2019-04-01'),
	(107, 3, 1000, '2019-03-01', '2019-03-09'), (107, 4, 1001, '2019-03-01', '2019-04-01'), (108, 3, 1002, '2019-03-01', '2019-04-01'), (108, 4, 1003, '2019-03-01', '2019-04-01'),
	(109, 1, 1004, '2019-03-01', '2019-03-09'), (109, 4, 1005, '2019-03-01', '2019-04-01'), (110, 2, 1006, '2019-03-01', '2019-04-01'), (110, 3, 1003, '2019-03-01', '2019-04-01'),
	(111, 2, 1000, '2019-03-01', '2019-03-09'), (111, 3, 1001, '2019-03-01', '2019-04-01'), (112, 3, 1002, '2019-03-01', '2019-04-01'), (112, 2, 1003, '2019-03-01', '2019-04-01'),
	(113, 1, 1004, '2019-03-01', '2019-03-09'), (114, 3, 1005, '2019-03-01', '2019-04-01'), (115, 4, 1003, '2019-03-01', '2019-04-01'), (116, 3, 1001, '2019-03-01', '2019-04-01'),
	(117, 4, 1006, '2019-03-01', '2019-03-09'), (118, 4, 1004, '2019-03-01', '2019-04-01'), (119, 4, 1000, '2019-03-01', '2019-04-01')
;

CREATE PROC finalProject
AS
BEGIN

/*1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?*/

SELECT a.copies_number, b.books_title, c.branch_name
	FROM tbl_copies a
	INNER JOIN tbl_books b ON a.copies_books_id = b.books_id
	INNER JOIN tbl_branch c ON a.copies_branch_id = c.branch_id
	WHERE books_title = 'The Lost Tribe' AND branch_name = 'Sharpstown'
;

/*2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?*/

SELECT a.copies_number, b.books_title, c.branch_name
	FROM tbl_copies a
	INNER JOIN tbl_books b ON a.copies_books_id = b.books_id
	INNER JOIN tbl_branch c ON a.copies_branch_id = c.branch_id
	WHERE books_title = 'The Lost Tribe'
;

/*3.) Retrieve the names of all borrowers who do not have any books checked out.*/

SELECT b.borrower_name
	FROM tbl_loans a
	FULL OUTER JOIN tbl_borrower b ON a.loans_borrower_cardno = b.borrower_cardno
	WHERE loans_books_id IS NULL
;

/*4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.*/

SELECT b.books_title, d.borrower_name, d.borrower_address
	FROM tbl_loans a
	INNER JOIN tbl_books b ON a.loans_books_id = b.books_id
	INNER JOIN tbl_branch c ON a.loans_branch_id = c.branch_id
	INNER JOIN tbl_borrower d ON a.loans_borrower_cardno = d.borrower_cardno
	WHERE c.branch_name = 'Sharpstown' AND a.loans_date_due = '2019-03-09'
;

/*5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.*/

SELECT b.branch_name, COUNT(a.loans_books_id)
	FROM tbl_loans a
	INNER JOIN tbl_branch b ON a.loans_branch_id = b.branch_id
	GROUP BY b.branch_name
;

/*6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.*/

SELECT b.borrower_name, b.borrower_address, COUNT(a.loans_books_id)
	FROM tbl_loans a
	INNER JOIN tbl_borrower b ON a.loans_borrower_cardno = b.borrower_cardno
	GROUP BY b.borrower_name, b.borrower_address
	HAVING COUNT(a.loans_books_id) > 5
;

/*
DECLARE @number INT
DECLARE @i INT = 1000;
While @i < 1008
Begin
	SET @number = (SELECT COUNT(tbl_loans.loans_borrower_cardno) FROM tbl_loans WHERE loans_borrower_cardno = @i)

	IF @number > 5
		BEGIN
			SELECT b.borrower_name, b.borrower_address
				FROM tbl_loans a
				INNER JOIN tbl_borrower b ON a.loans_borrower_cardno = b.borrower_cardno
				WHERE a.loans_borrower_cardno = @i
				;
		END
	SET @i = @i + 1;
END
*/
/*7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".*/

SELECT a.copies_number, b.books_title, c.branch_name, d.authors_name
	FROM tbl_copies a
	INNER JOIN tbl_books b ON a.copies_books_id = b.books_id
	INNER JOIN tbl_branch c ON a.copies_branch_id = c.branch_id
	INNER JOIN tbl_authors d ON d.authors_books_id = b.books_id
	WHERE c.branch_name = 'Central' AND d.authors_name = 'Stephen King'
;

END


