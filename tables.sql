CREATE TABLE table_name(  
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    create_time DATE,
    name VARCHAR(255)
);
CREATE TABLE "User" (
    "UserID" SERIAL PRIMARY KEY,    
    "Username" VARCHAR(100) NOT NULL UNIQUE, 
    "Password" VARCHAR(100) NOT NULL,
    "YearOfBirth" INT
);
CREATE TABLE "Genre" (
    "GenreID" SERIAL PRIMARY KEY,
    "GenreName" VARCHAR(100) NOT NULL
);

CREATE TABLE "Movie" (
    "MovieID" SERIAL PRIMARY KEY,
    "Title" VARCHAR(255) NOT NULL,
    "Year" INT,
    "GenreID" INT,
    "Review" TEXT,
    FOREIGN KEY ("GenreID") REFERENCES "Genre"("GenreID") ON DELETE SET NULL
);
CREATE TABLE "Review" (
    "ReviewID" SERIAL PRIMARY KEY,
    "MovieID" INT,
    "UserID" INT,
    "ReviewText" TEXT,
    FOREIGN KEY ("MovieID") REFERENCES "Movie"("MovieID") ON DELETE CASCADE,
    FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE CASCADE
);
CREATE TABLE "Favorites" (
    "MovieID" INT,
    "UserID" INT,
    PRIMARY KEY ("MovieID", "UserID"),
    FOREIGN KEY ("MovieID") REFERENCES "Movie"("MovieID") ON DELETE CASCADE,
    FOREIGN KEY ("UserID") REFERENCES "User"("UserID") ON DELETE CASCADE
);
