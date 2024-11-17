const http = require('http');

const server = http.createServer((req, res)=>{

    res.end('Node')

})
const PORT = 5432;
server.listen(5432);

console.log(`Node js running at ${PORT}`);

const path = require('path');
require('dotenv').config({
    override: true,
    path: path.join(__dirname, 'development.env')
});
const {Pool, Client} = require('pg');

const pool = new Pool({
    user: process.env.USER,
    host: process.env.HOST,
    database: process.env.DATABASE,
    password: process.env.PASSWORD,
    port: process.env.PORT 
});

(async () => {
    const client = await pool.connect();
    try {
        const {rows} = await client.query('SELECT current_user');
        const currentUser = rows[0]['current_user'];
        console.log(currentUser);
    } catch (err) {
        console.error(err);
    } finally {
        client.release();
    }

})();
