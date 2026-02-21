create table authors(author_id int auto_increment, author_name VARCHAR(50), nationality VARCHAR(30), primary key(author_id) );

CREATE TABLE book_details(isbn BIGINT, title VARCHAR(255), author_id INT, category VARCHAR(100), year INT,edition VARCHAR(20), publisher VARCHAR(100), PRIMARY KEY(isbn), FOREIGN KEY(author_id) REFERENCES authors(author_id));

-- 3. Stock Table
CREATE TABLE stock (
    book_id INT AUTO_INCREMENT,
    isbn BIGINT,
    status VARCHAR(50), -- Available, Borrowed, etc.
    price DECIMAL(10, 2),
    PRIMARY KEY (book_id),
    FOREIGN KEY (isbn) REFERENCES book_details(isbn)
);

-- 4. Students Table
CREATE TABLE students (
    adm_no INT AUTO_INCREMENT,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100),
    class_program VARCHAR(100),
    PRIMARY KEY (adm_no)
);

-- 5. Staff Table
CREATE TABLE staff (
    staff_no INT AUTO_INCREMENT,
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    position VARCHAR(100),
    employment_status VARCHAR(50),
    PRIMARY KEY (staff_no)
);

-- 6. Borrowings Table
CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT,
    student_id INT,
    book_id INT,
    staff_id INT,
    issue_date DATE,
    due_date DATE,
    return_date DATE,
    PRIMARY KEY (borrowing_id),
    FOREIGN KEY (student_id) REFERENCES students(adm_no),
    FOREIGN KEY (book_id) REFERENCES stock(book_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_no)
);

INSERT INTO authors (author_name, nationality) VALUES 
('Ngũgĩ wa Thiong''o', 'Kenyan'),
('Margaret A. Ogola', 'Kenyan'),
('Ken Walibora', 'Kenyan'),
('Yvonne Adhiambo Owuor', 'Kenyan'),
('John Kiriamiti', 'Kenyan');

INSERT INTO book_details (isbn, title, author_id, category, year, edition, publisher) VALUES 
(9780435900021, 'Weep Not, Child', 1, 'Classic Literature', 1964, '1st', 'Heinemann Kenya'),
(9789966882451, 'The River and the Source', 2, 'Fiction', 1994, 'Reprint', 'Focus Publishers'),
(9789966442010, 'Siku Njema', 3, 'Swahili Literature', 1996, '2nd', 'Longhorn Publishers'),
(9781101870334, 'Dust', 4, 'Contemporary Fiction', 2014, '1st', 'Kwani Trust'),
(9789966441021, 'My Life in Crime', 5, 'True Crime/Thriller', 1984, '1st', 'Spear Books');

INSERT INTO stock (isbn, status, price) VALUES 
(9780435900021, 'Available', 850.00),
(9789966882451, 'Borrowed', 1200.00),
(9789966442010, 'Available', 650.00),
(9781101870334, 'Available', 1500.00),
(9789966441021, 'Borrowed', 700.00);

INSERT INTO students (name, address, phone, email, class_program) VALUES 
('Achieng Wanjiru', 'Nairobi, Westlands', '0722000111', 'achieng.w@example.ke', 'BSc. Computer Science'),
('Kevin Kiprono', 'Eldoret, Kapsoya', '0733444555', 'kiprono.k@example.ke', 'Bachelor of Commerce'),
('Faith Chebet', 'Nakuru, Milimani', '0701999888', 'f.chebet@example.ke', 'Diploma in Nursing'),
('Alex Mutua', 'Machakos Town', '0788222333', 'mutua.alex@example.ke', 'BEd. Arts'),
('Grace Atieno', 'Kisumu, Milimani', '0755666777', 'atieno.grace@example.ke', 'BSc. IT');

INSERT INTO staff (name, phone, email, position, employment_status) VALUES 
('Bavon Ochieng', '0711222333', 'bavon.o@library.ke', 'Chief Librarian', 'Permanent'),
('Rose Mathenge', '0722333444', 'rose.m@library.ke', 'Assistant Registrar', 'Permanent'),
('Moses Baragu', '0733555666', 'm.baragu@library.ke', 'Library Assistant', 'Contract'),
('Janet Apima', '0744777888', 'j.apima@library.ke', 'Records Clerk', 'Permanent'),
('Samson Otakwa', '0755999000', 's.otakwa@library.ke', 'Technical Support', 'Permanent');

INSERT INTO borrowings (student_id, book_id, staff_id, issue_date, due_date, return_date) VALUES 
(1, 1, 3, '2024-05-01', '2024-05-15', NULL),          -- Achieng borrowed "Weep Not, Child"
(2, 2, 3, '2024-05-02', '2024-05-16', '2024-05-14'),  -- Kiprono borrowed/returned "The River and the Source"
(3, 3, 1, '2024-05-05', '2024-05-19', NULL),          -- Faith borrowed "Siku Njema"
(4, 5, 4, '2024-05-10', '2024-05-24', NULL),          -- Alex borrowed "My Life in Crime"
(5, 4, 2, '2024-05-12', '2024-05-26', '2024-05-20');  -- Grace borrowed/returned "Dust"