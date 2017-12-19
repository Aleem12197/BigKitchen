function deletethis(id){
alert(id);
var url="delfrmordr.jsp?valu="+id;


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








function deleteitem(id){
alert(id);
var url="delitem.jsp?fooid="+id;


if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfor;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}


}

function getInfor(){
if(request.readyState==4){
var al=request.responseText;
alert(al);
location.reload(true);
//document.getElementById(v).value="added to cart";
}
}