const authConfig = require("../config/auth_config.json");
const axios = require('axios').default;

let getAuthUser = async (accessToken) => {

    const url = "https://elee-tudublin.eu.auth0.com/userinfo";
    const config = {
      headers: {
        "authorization": `Bearer ${accessToken}`
      }
    }
    
    const user = await axios.get(url, config);
  
    return user.data;
  }


// Module exports
// expose these functions
module.exports = {
    getAuthUser
};