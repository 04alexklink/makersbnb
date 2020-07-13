'use strict';

class Mobbnb{
  constructor(){
    this._email = "";
    this._password = "";
  }
  addUserEmail(email) {
    this._email = email;
  }
  getEmail(){
    return this._email
  }
  addUserPassword(password) {
    this._password = password;
  }
  
}
