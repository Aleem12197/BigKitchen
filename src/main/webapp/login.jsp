
<!DOCTYPE html>
<html>
<head>
<script >
function saveaddphn(){
var ph=document.getElementById("phnnum").value;
var ad=document.getElementById("addr").value;
if(ph==null||ad==null||ad.length==0||ph.length<10||ph==""||ad==""){
alert("both address and phone number are required");
}
else{
alert(ph+ad);
var url="fuser.jsp?phn="+ph+"&addr="+ad;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInf;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
}
function getInf(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
parent.display.location.reload(true);
}
}
</script>
 
<title>SignIn</title>
<meta charset="UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="771107126085-f7l9lcs13i72mi95gdcfmv5rsqah6uj1.apps.googleusercontent.com">

</head>
<body>

<div class="g-signin2" data-onsuccess="onSignIn"></div>
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
 alert("signedin");
var fName=profile.getName();
var email=profile.getEmail();
var url="sessiontrack.jsp?uname="+fName+"&emid="+email;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
      
function getInfo(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
parent.display.location.reload(true);
}
}

</script>

<input type="hidden" id="user" name="user" value="" />
<input id="email" type="hidden" value="" name="userEmail" /><br/><br/>


       
   <label for="inputFname" class="sr-only">First Name</label>
            <input type="hidden" name="gmailuser" id="inputFullname" class="form-control" placeholder="First Name" readonly>
            
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="hidden" name="gmailid" id="inputEmail" class="form-control" placeholder="Email address" value="" readonly >



<br>
Phone No:<br>
<input value='91' type='number' maxlength="12" id='phnnum'><br>
Address:<br>
<textarea rows='4' cols='30' id='addr' ></textarea><br>
<input type="button" onclick="saveaddphn()" value="Save"/>

<br>
<a href="#" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
alert("signedout");
    });
var url="logout.jsp";


if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getIn;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}
function getIn(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
parent.display.location.reload(true);
//document.getElementById(v).value="added to cart";
}
}
</script>



</body>
</html>