  window.fbAsyncInit = function() {
    FB.init({
      appId      : '2103993239838212',
      cookie     : true,
      xfbml      : true,
      version    : 'v2.8'
    });
	FB.getLoginStatus(function(response) {
	    statusChangeCallback(response);
	});
	FB.api(
'/{user-id}',
'GET',
{},
function(response) {
	console.log("The FB response is");
	console.log(response);
		// Insert your code here
}
);
  };
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
	 function statusChangeCallback(response) {
		 console.log(response);
		 if(response.status === 'connected') {
			 console.log('Logged in and Authenticated');
		 }else{
			 console.log('Not Authenticated');
		 }
	 }
		function checkLoginState() {
		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
				FB.login(function(response) {
				 if (response.authResponse)
						window.top.location = "https://scotts-isbn-validator.herokuapp.com/";
					});
		  });
		}
		function testAPI() {
      console.log('Welcome!  Fetching your information.... ');
      FB.api('me?fields=id,name,first_name,last_name,email', function (response) {
					console.log(response);
          console.log('Successful login for: ' + response.name);
					console.log(response.first_name + " " + response.last_name + " " + response.email);
					var first_name = response.first_name
					var last_name = response.last_name
			        document.getElementById('first_name').value = first_name
        			document.getElementById('last_name').value = last_name
		}
		// Redirect if logged into facebook
		// FB.login(function(response) {
    //  if (response.authResponse) {
    //     window.top.location = "https://isbn-web.herokuapp.com/login";
		// 	});