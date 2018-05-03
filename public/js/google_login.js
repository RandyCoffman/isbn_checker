function onSignIn(googleUser) {
    var profile = googleUser.getBasicProfile();
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
    console.log("Succesfully Singed in!!!");
    var first_name = profile.getName().split(' ').slice(0, -1).join(' ');
    var last_name = profile.getName().split(' ').slice(-1).join(' ');
    document.getElementById('first_name').value = first_name
    document.getElementById('last_name').value = last_name
}

function signOut() {
	document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=https://scotts-isbn-validator.herokuapp.com";
}