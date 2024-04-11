CREATE TABLE users (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(16) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    username VARCHAR(32) NOT NULL UNIQUE,
    password VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE schools (
    id INT AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    type ENUM('Primary','Secondary','Higher Education'),
    loaction VARCHAR(64),
    found_date YEAR,
    PRIMARY KEY(id)
);


CREATE TABLE companies (
    id  INT AUTO_INCREMENT,
    name VARCHAR(64) NOT NULL,
    industry VARCHAR(64),
    loaction VARCHAR(64),
    PRIMARY KEY(id)
);

CREATE TABLE connect_people (
    person1 INT,
    person2 INT,
     FOREIGN KEY(person1) REFERENCES users(id),
     FOREIGN KEY(person2) REFERENCES users(id)
);


CREATE TABLE connect_school (
    school_id INT,
    person_id INT,
     satrt_date DATE,
     end_date DATE,
     degree_type VARCHAR(64),
     FOREIGN KEY(school_id) REFERENCES schools(id),
     FOREIGN KEY(person_id) REFERENCES users(id)
);

CREATE TABLE connect_company (
    company_id INT,
    person_id INT,
     satrt_date DATE,
     end_date DATE,
     title VARCHAR(64),
     FOREIGN KEY(company_id) REFERENCES companies(id),
     FOREIGN KEY(person_id) REFERENCES users(id)
);
