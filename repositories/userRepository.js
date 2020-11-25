// Dependencies
// require the database connection
const { sql, dbConnPoolPromise } = require('../database/db.js');

// Define SQL statements here for use in function below
// These are parameterised queries note @named parameters.
// Input parameters are parsed and set before queries are executed

// for json path - Tell MS SQL to return results as JSON 
const SQL_SELECT_ALL = 'SELECT * FROM AppUser for json path;';

// for json path, without_array_wrapper - use for single json result
const SQL_SELECT_BY_ID = 'SELECT * FROM AppUser WHERE UserId = @id for json path, without_array_wrapper;';

const SQL_SELECT_BY_EMAIL = 'SELECT * FROM AppUser  WHERE Email = @email for json path, without_array_wrapper;';

const SQL_INSERT = "INSERT INTO AppUser (FirstName, LastName, Email, Password, Role) VALUES (@firstName, @lastName, @email, @password, 'User'); SELECT * from dbo.AppUser WHERE UserId = SCOPE_IDENTITY();";

// Get all products
// This is an async function named getProducts defined using ES6 => syntax
let getUsers = async () => {

    // define variable to store products
    let users;

    // Get a DB connection and execute SQL (uses imported database module)
    // Note await in try/catch block
    try {
        const pool = await dbConnPoolPromise
        const result = await pool.request()
            // execute query
            .query(SQL_SELECT_ALL);
        
        // first element of the recordset contains products
        users = result.recordset[0];

    // Catch and log errors to cserver side console 
    } catch (err) {
        console.log('DB Error - get all users: ', err.message);
    }

    // return products
    return users;
};

// get product by id
// This is an async function named getProductById defined using ES6 => syntax
let getUserById = async (userId) => {

    let user;

    // returns a single product with matching id
    try {
        // Get a DB connection and execute SQL
        const pool = await dbConnPoolPromise
        const result = await pool.request()
            // set @id parameter in the query
            .input('id', sql.Int, userId)
            // execute query
            .query(SQL_SELECT_BY_ID);

        // Send response with JSON result    
        user = result.recordset[0];

        } catch (err) {
            console.log('DB Error - get User by id: ', err.message);
        }
        
        // return the product
        return user;
};

// get user by email
let getUserByEmail = async (email) => {

    let user;

    // returns a single product with matching email
    try {
        // Get a DB connection and execute SQL
        const pool = await dbConnPoolPromise
        const result = await pool.request()
            // set @id parameter in the query
            .input('email', sql.NVarChar, email)
            // execute query
            .query(SQL_SELECT_BY_EMAIL);

        // Send response with JSON result    
        user = result.recordset[0];

        } catch (err) {
            console.log('DB Error - get User by id: ', err.message);
        }
        
        // return the product
        return user;
};


// Export 
module.exports = {
    getUsers,
    getUserById,
    getUserByEmail
};
