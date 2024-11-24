import express from 'express';

const app = express();
app.use(express.json());  

const users = [
    { UserID: 1, Username: 'john_doe', Password: 'password123', YearOfBirth: 1990 }
];
const movies = [
    { MovieID: 1, Title: 'Inception', Year: 2010 }
];


app.get('/api/users', (req, res) => {
    res.json(users);
});


app.post('/api/users', (req, res) => {
    const newUser = req.body; 
    newUser.UserID = users.length + 1; 
    users.push(newUser); 
    res.status(201).json(newUser); 
});


app.get('/api/movies', (req, res) => {
    res.json(movies);
});


app.post('/api/movies', (req, res) => {
    const newMovie = req.body;
    newMovie.MovieID = movies.length + 1; 
    movies.push(newMovie);
    res.status(201).json(newMovie); 
});


app.listen(3001, () => {
    console.log('Server is running on port 3001');
});
