'use strict';

describe("mobbnb", function(){

  var mobbnb;

  beforeEach(function(){
    mobbnb = new Mobbnb();
  });

  it("takes an email address for a user", function(){
    mobbnb.addUserEmail("mobperson@moblet.com");
    expect(mobbnb.email).toEqual("mobperson@moblet.com");
  });

  

});
