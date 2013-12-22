<!DOCTYPE html >
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


       

<link rel="stylesheet" href="css/jquery.mobile-1.2.0.min.css">

<script type="text/javascript" charset="utf-8" src="cordova-2.2.0.js"></script>
<script type="text/javascript" src="js/jquery.min.1.6.4.js"></script>
<script type="text/javascript" src="js/jquery.mobile-1.2.0.min.js"></script>










<script type="text/javascript" charset="utf-8">

var name;
var email;
var db=null;
var global_id;
var ni;
var global_return_string;
var db;
var id;
var image_uri;
var audio_uri;
var video_uri;
var username;
var post;
var comments;
var no_of_likes;
var text_to_be_added;
var textId;
var full_comments;


function init()
{
      //navigator.openDatabase = window.openDatabase = DroidDB_openDatabase;
      //window.droiddb = new DroidDB();

      db = window.openDatabase("DB18", "8.0", "Database Demo", 200000);
      //db.transaction(queryDB, errorCB);   
      document.addEventListener("deviceready", onDeviceReady, false);
      db.transaction(queryDB, errorCB);
}







//Transaction error callback
//
function errorCB(err) {
    //alert("Error processing SQL: "+err.code);
}


// Query the database
//
function queryDB(tx) {
    tx.executeSql('SELECT * FROM LOGIN WHERE username="'+username+'"', [], profile_load, errorCB);
    tx.executeSql('SELECT * FROM FEEDBACK WHERE username="'+username+'"', [], posts_load, errorCB);
}

function queryDB1(tx) {
    //alert("querydb");
  tx.executeSql('SELECT * FROM FEEDBACK WHERE username="'+username+'"', [], querySuccess1, errorCB);
}

function querySuccess1(tx, results) 
{
    var len = results.rows.length;
    //alert("FEEDBACK table: " + len + " rows found.");
    for (var i=0; i<len; i++)
    { 
       // //alert("Row = " + i + " ID = " + results.rows.item(i).id + " uri =  " + results.rows.item(i).uri);

            id=results.rows.item(i).id;
            image_uri=results.rows.item(i).uri_image;
            audio_uri=results.rows.item(i).uri_audio;
            video_uri=results.rows.item(i).uri_video;
            username=results.rows.item(i).username;
            post=results.rows.item(i).post;
            comments=results.rows.item(i).comments;
            no_of_likes=results.rows.item(i).no_of_likes;
            
      ni = document.getElementById('myDiv');

            var numi = document.getElementById('theValue');
            //alert(id);

        //var num = (document.getElementById('theValue').value -1)+ 2;

        //numi.value = num;

        var newdiv = document.createElement('div');

        var divId = 'div'+id;

        var imgId = 'img'+id;

        var buttonId = 'button'+id;

        var btnLikeId = 'buttonlike'+id;

        var pId='p'+id;
        
        textId='text'+id;
        newdiv.setAttribute('id',divId);

            
            
        if(image_uri!=null && image_uri!='undefined')//second condition to be checked***********************************
        {
              //alert(image_uri);
            newdiv.innerHTML = '<img  border="0" id="'+imgId+'" src="'+image_uri+'" width="100" height="100" /> ' +'<br/>'+
              post;

          
        }

        

                            
                                               

        /*newdiv.innerHTML = 'Element Number '+num+' has been added! <a href=\'#\' onclick=\'removeElement('+divIdName+')\'>Remove the div "'+divIdName+'"</a>';*/

        ni.appendChild(newdiv);


        
    }
}


//Load profile
//
function profile_load(tx, results) {
       //alert(""+results.rows.length);
       name = results.rows.item(0).name;
       email = results.rows.item(0).email;
       document.getElementById("username").innerHTML=username;
       document.getElementById("name").innerHTML=name;
       document.getElementById("email").innerHTML=email;
}



//posts load
//
function posts_load(tx, results) {
       var len = results.rows.length;
       document.getElementById("posts").innerHTML=len;
}



//initialise function
//
function initi() {
       username=window.sessionStorage.getItem("username");
       window.sessionStorage.setItem("username", username);
       db = window.openDatabase("DB18", "8.0", "Database Demo", 200000);
       db.transaction(queryDB, errorCB);
       db.transaction(queryDB1, errorCB);
}
</script>







</head>
<body onload="initi();">

<!-- profile -->
<div id="profile" data-role="page">
    <div data-role="header" data-theme="b">
        <h3>
            Profile
        </h3>
    </div>
    <div data-role="content">
        <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <label for="username">
                </label>Username : 
                <h3 id="username"></h3>
            </fieldset>
        </div>
        <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <label for="name">
                </label>Name : 
                <h3 id="name"></h3>
            </fieldset>
        </div>
        <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <label for="email">
                </label>Email ID : 
                <h3 id="email"></h3>
            </fieldset>
        </div>
        
        <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <label for="posts">
                    Posts till date :
                </label>
                <h3 id="posts"></h3>
            </fieldset>
        </div>
        
        <input type="hidden" value="0" id="theValue" />

       

        <div id="myDiv"> </div>
        
     
      
        <div>
        <a data-role="button"  data-theme="b" 

           href="edit_profile.html"  data-icon="gear"

        data-iconpos="right" data-ajax="false">

        Edit Profile

        </a>
        </div>

        
    </div>
    <div data-role="footer" data-theme="b" data-position="fixed">
        <a href="layout.html" data-role="button" data-icon="star" data-iconpos="right" data-theme="b">Explore</a>

        <a href="postfeedback.html" data-role="button" data-icon="plus"
        data-iconpos="right" data-theme="b">
            Post 
        </a>
        <a href="profile.html" data-role="button" data-icon="home"
        data-iconpos="right" data-theme="b">
            Profile
        </a>

    </div>
</div>

</body>
</html>
