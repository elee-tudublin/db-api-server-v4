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

// https://github.com/auth0/express-jwt-authz#user-content-options
// https://medium.com/javascript-in-plain-english/securing-a-node-js-api-with-auth0-7785a8f2c8e3
const checkAuth = permissions => jwtAuthz(permissions, {customScopeKey: "permissions", checkAllScopes: true });  


module.exports = {
  authConfig,
  checkJwt,
  checkAuth
};