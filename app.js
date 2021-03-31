// require imports packages required by the application
const express = require('express');
const cors = require('cors')
//const helmet = require('helmet');
//const morgan = require('morgan');

const HOST = '127.0.0.1';
const PORT = 8080;

// Auth0
//const { checkJwt } = require('./middleware/jwt.js');

// app is a new instance of express (the web app framework)
let app = express();

// check auth for all routes
//app.use(checkJwt);

// adding Helmet to enhance your API's security
//app.use(helmet());

// Application settings
app.use((req, res, next) => {
    // Globally set Content-Type header for the application
    res.setHeader("Content-Type", "application/json");
    next();
});

// Allow app to support differnt body content types (using the bodyParser package)
app.use(express.text());
// support json encoded bodies
app.use(express.json());
// support url encoded bodies
app.use(express.urlencoded({
    extended: true
}));


// cors
// https://www.npmjs.com/package/cors
// https://codesquery.com/enable-cors-nodejs-express-app/
// Simple Usage (Enable All CORS Requests)
app.use(cors({ credentials: true, origin: true }));
app.options('*', cors()) // include before other routes

// adding morgan to log HTTP requests
//app.use(morgan('combined'));

/* Configure app Routes to handle requests from browser */
// The default route 
app.use('/', require('./controllers/index'));
// route to /product
app.use('/product', require('./controllers/productController'));

app.use('/category', require('./controllers/categoryController'));

app.use('/user', require('./controllers/userController'));

// catch 404 and forward to error handler
app.use(function (req, res, next) {
    var err = new Error('Not Found: ' + req.method + ":" + req.originalUrl);
    err.status = 404;
    next(err);
});

// Start the HTTP server using HOST address and PORT consts defined above
// Listen for incoming connections
var server = app.listen(PORT, HOST, () => {
    console.log(`Express server listening on http://localhost:${PORT}`);
});

// export this as a module, making the app object available when imported.
module.exports = app;