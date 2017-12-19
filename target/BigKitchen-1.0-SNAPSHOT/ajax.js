var request;
var v;
var username;
function reply_click(clicked_id)
{
alert(clicked_id);
v=clicked_id;
var url="adtcart.jsp?val="+v;

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
var b=al.substring(6,18);
if(b=="please login"){
alert(b);
}
else {
alert(al);
document.getElementById(v).value="added to cart";
}
}
}














function reply(clicked_id)
{
alert(clicked_id);
var v=clicked_id;
var url="setitemsession.jsp?val="+v;

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

function getInf(){
if(request.readyState==4){
var al=request.responseText;
var b=al.substring(2,14);
//alert(b);
if(b=="please login"){
alert(b);
}
else {
alert(al);
location.href="viewitem.jsp";
//document.getElementById(v).value="added to cart";
}
}
}

