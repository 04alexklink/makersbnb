'use strict';

describe("mobbnb", function(){

  var mobbnb;

  beforeEach(function(){
    mobbnb = new Mobbnb();
  });

  it("takes an email address for a user", function(){
    mobbnb.addUserEmail("mobperson@moblet.com");
    expect(mobbnb.getEmail()).toEqual("mobperson@moblet.com");
  });

  it("takes a password for a user", function(){
    mobbnb.addUserPassword("Hello1");
    // expect(mobbnb.checkPassword()).toEqual(true);
    expect(mobbnb._password).toEqual("Hello1");
  });



});
