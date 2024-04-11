# Cinemate

By AVIRAJ POPAT KALE

#Video overview: https://youtu.be/uh-0GiThIjA

## Scope

### purpose of database
The purpose of the database is to easily access the information of the a movie and series.
It will help users to share the information they have also update the existing information in database and a log of it also there.
This help animation industry for marketing as well as the production house and writer to get more famous for their work.
The databas provide easy to access data and the data which is reallyb important is stored in a consistent manner so it easy to access.
We say that the purpose of the database to provide the complete information of the movie to the user.

### Things Including in the database
- Movie and Series information with attributes like `id`, `title`,`discription`, and `price` on online platforms.
- Writer of the movie and the series with there information like `name`,`birthdate`
- Production house information with their details like `since` they exist and the `desc` discription of them
- Genre of the movie and the series
- Also logs of the database change is their in the database

### Things Outside in the database
- SPII information of the writers
- Financial data of production house
- Links of the movie and the series
- Their rating information

## Functional Requirements

### User provisions
Users should be able to:
- Create,Update and Delete the movies and series information in the database.
- Find production house and writer of the anime easily.
- Add there discription about the movie.
- Find the movie or series belong to which genere.
- Get the infomation of the writer easily
- Which writer have which type of the work
- User able to find which production house do which type of work

### Beyond the scope
- Get the personal information of the writers.
- Get ther linkl of the movie
- Get the rating of the movie and the series

## Representation

### Entities

**movie:**
- `id`
- `title`
- `desc`
- `cover`
- `price`
- Primary Key (`id`)
- id indicate the unique id for each movie and the series
- title of the movie is below that
- description of the movie
- name of cover image of the movie
- price of the movie in the online platform
- make the title not null as it is important
- it store the movie data as it is the main component of the data base

**production_house**
- `id`
- `name`
- `since`(Date when theyu get start)
- `desc`
- Primary Key(`id`)
- id is Unique identifier for each production house.
- name is Name of the production house.
- since is Date when the production house was established.
- description is Description of the production house

**movie_rel_prod**
- `movie_id` (Foreign Key referencing movies)
- `Production_house_id`(Foreign Key referencing production houses)
- table to maintain the relation in the production house and the movie
- with join and the neasted queries we can retrive the data

**genre**
- `id`
- `name`
- Primary Key(`id`)
- id is Unique identifier for each genre.
- name is  Name of the genre.
- Primary Key(id) is Ensures uniqueness of each genre record based on its ID

**movie_rel_genre**
- `movie_id` (Foreign Key referencing movies)
- `genre_id`(Foreign Key referencing genre)
- table to maintain the relation in the movie and the genre
- with join and the neasted queries we can retrive the data

**writer**
- `id`
- `birthdate`
- `first_name`
- `lastname`
- Primary Key(`id`)
- id id Unique identifier for each writer.
- birthdate is Birthdate of the writer.
- first_name is First name of the writer.
- lastname is Last name of the writer.

**movie_rel_writer**
- `movie_id` (Foreign Key referencing movies)
- `writer_id`(Foreign Key referencing writer)
- table to maintain the relation in the movie and the writer
- with join and the neasted queries we can retrive the data

**movie_audit**
- `id`
- `movie_id`
- `action`(To maintain what happen with the data)
- `old_title`
- `old_desc`
- `old_cover`
- `timestamp`(When the action get perform)
- Primary Key(`id`)
- the table is for maintain thee log of the opration on the database
- it maintain log about the insert,update,delete.
- the timestamp is to find when the opration get perform
- also old data item are there as if we want to restore them by any chance

### Relationships

![Cinemate ERD](https://i.imgur.com/ibi3G21.png)

- The relation between the movie and the production house `movie_rel_prod`
- The relation between the movie and the writer `movie_rel_writer`
- The relation between the movie and the genre `movie_rel_genre`


## Optimizations
- Created the index on the `id` of the movie
- Created the index on the `id` of the production_house
- Created the index on the `id` of the writer
- Created the index on the `movie_id` and `writer_id` of the movie_rel_writer
- Created the index on the `Production_house_id` and `movie_id` of the movie_rel_prod
- Created the index on the `movie_id` and `genre_id` of the movie_rel_genre
table as it mostly get search

## Limitations
- The views are not there in ther database so it can be a threat to the security.
- Flatform not able to perform the financial transcation
- You not able to watch the movie or the series on the platform as it dont have any link in it
