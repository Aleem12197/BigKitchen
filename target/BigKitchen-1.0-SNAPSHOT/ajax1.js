function checkadd(){
var em=document.getElementById("email").value;
var ad=document.getElementById("add").value;
if(em.length==0||em=="null"){
alert("Please Login");
return false;
}
else if(ad.length==0||ad=="null"){
alert("Please provide phone number and address");
return false;
}else{
alert(ad);
document.foodcart.submit();
return true;
}
}
function deletethis(id){
alert(id);
var url="delfrmcrt.jsp?valu="+id;


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
location.reload(true);
//document.getElementById(v).value="added to cart";
}
}




function reply_click(clicked_id)
{
alert(clicked_id);
v=clicked_id;
var q=document.getElementById("quantity".concat(v)).value;
var d=document.getElementById("date".concat(v)).value;
var t=document.getElementById("time".concat(v)).value;
if(d!=""&&t==""){
alert("also provide time");
return false;
}
if(t!=""&&d==""){
alert("also provide date");
return false;
}
var dt=new Date();
alert(dt);
dtnew = [
  dt.getFullYear(),
  ('0' + (dt.getMonth() + 1)).slice(-2),
  ('0' + dt.getDate()).slice(-2)
].join('-');
alert(dtnew);
var tm=[('0'+dt.getHours()).slice(-2),('0'+dt.getMinutes()).slice(-2)].join(':');
alert(tm);
//alert(dt.getHours()+":"+dt.getMinutes());
if(tm>t && dtnew==d){
alert("not allowed");
}
else{
alert(q+d+t);
var url="updtcart.jsp?val="+v+"&qua="+q+"&dt="+d+"&tm="+t;

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
}
function getInfo(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
location.reload(true);
//document.getElementById(v).value="added to cart";
}
}

