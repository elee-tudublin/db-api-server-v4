const jwt = require("express-jwt");
const jwksRsa = require("jwks-rsa");
const authConfig = require("../config/auth_config.json");
const jwtAuthz = require('express-jwt-authz');

// create the JWT middleware
const checkJwt = jwt({
    secret: jwksRsa.expressJwtSecret({
      cache: true,
      rateLimit: true,
      jwksRequestsPerMinute: 5,
      jwksUri: `https://${authConfig.domain}/.well-known/jwks.json`
    }),
  
    audience: authConfig.audience,
    issuer: `https://${authConfig.domain}/`,
    algorithms: ["RS256"]
  });

// https://medium.com/javascript-in-plain-english/securing-a-node-js-api-with-auth0-7785a8f2c8e3
const checkScopes = permissions => jwtAuthz(permissions);  


module.exports = {
  checkJwt,
  checkScopes
};