<!DOCTYPE html>
<html>
  <head>
    <title>Storage Example</title>

    <script type="text/javascript" charset="utf-8" src="cordova-2.2.0.js"></script>
    <link rel="stylesheet" href="css/jquery.mobile-1.2.0.min.css">


<script type="text/javascript" src="js/jquery.min.1.6.4.js"></script>
<script type="text/javascript" src="js/jquery.mobile-1.2.0.min.js"></script>
    <script type="text/javascript" charset="utf-8">

    // Wait for Cordova to load
    //
    document.addEventListener("deviceready", onDeviceReady, false);

    // Populate the database 
    //
    function populateDB(tx) {
       //tx.executeSql('DROP TABLE IF EXISTS DEMO');
       //tx.executeSql('CREATE TABLE IF NOT EXISTS DEMO (username VARCHAR(255) PRIMARY KEY, password VARCHAR(255))');
        //tx.executeSql('INSERT INTO DEMO (username, password) VALUES ("akshay", "Firstrow")');
        //tx.executeSql('INSERT INTO DEMO (username, password) VALUES ("abc", "Secondrow")');
        ////alert("values inserted");
    }

    // Query the database
    //
    function queryDB(tx) {
        tx.executeSql('SELECT * FROM LOGIN', [], querySuccess, errorCB);
    }

    // Query the success callback
    //
    function querySuccess(tx, results) 
    {
        var len = results.rows.length;
        var user = document.getElementById("username").value;
              var pass = document.getElementById("password").value;
              var flag = "false";
              var y=0;
              
                           
        for (var i=0; i<len; i++)
        {
            if(user == results.rows.item(i).username && pass == results.rows.item(i).password)
                     {
                            flag = "true";
                   y = i;
                   break;
                     }
        }
        if(flag == "true")
        {
              window.location = "postfeedback.html";
              window.sessionStorage.setItem("username", user);
              ////alert("Row = " + i + " Username = " + results.rows.item(y).username + " Password =  " + results.rows.item(y).password);
        }
        else
        {
            //alert("Username and Password do not match");
        }
    }

    // Transaction error callback
    //
    function errorCB(err) {
        //alert("Error processing SQL: "+err.code);
    }

    // Transaction success callback
    //
    function successCB() 
    {
       //alert("SUCCESS.....");
       // var db = window.openDatabase("DB13", "1.0", "Database Demo", 200000);
        //db.transaction(queryDB, errorCB);
    }

    // Cordova is ready
    //
    function onDeviceReady() {
        //var db = window.openDatabase("DB8889", "1.0", "Database Demo", 200000);
        //db.transaction(populateDB, errorCB, successCB);
    }


    function starting() {
       //var db = window.openDatabase("DB12", "1.0", "Database Demo", 200000);
       // db.transaction(populateDB, errorCB, successCB);
       var db = window.openDatabase("DB18", "8.0", "Database Demo", 200000);
        db.transaction(queryDB, errorCB);
        
    }
   /* function init()
    {
       //var db = window.openDatabase("DB20", "1.0", "Database Demo", 200000);
        //db.transaction(populateDB, errorCB, successCB);
    }*/
    </script>
    
  </head>
  <body >
       <div id="login" data-role="page">
    <div data-role="header" data-theme="b">
        <h3>
            Infydback
        </h3>
    </div>
    <div data-role="content">
     <form id="form1">
              <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <label for="textinput4">
                    Username
                </label>
                <input id="username" type="text" placeholder="" value="">
            </fieldset>
        </div>
              <div data-role="fieldcontain">
            <fieldset data-role="controlgroup">
                <label for="textinput5">
                    Password
                </label>
                <input id="password" type="password" placeholder="" value="">
            </fieldset>
        </div>
              <input type="button" onclick="starting();" value="Login" data-theme="d" data-ajax="false"/>
       </form>
              
       <a data-role="button"  data-theme="d" data-ajax="false"  href="register.html"  >New User, Click Here !!! </a>
        
       </div>
       </div>
  </body>
</html>
