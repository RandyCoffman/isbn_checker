function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
  		console.log('Name: ' + profile.getName());
  		console.log('Image URL: ' + profile.getImageUrl());
        console.log("Succesfully Singed in!!!");
}

function signOut() {
	document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=https://scotts-isbn-validator.herokuapp.com/";
      console.log('User signed out.');
}