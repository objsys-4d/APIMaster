//%attributes = {}
  //CODE Example
  //The following code example is done as an HTML page that works under Microsoft’s Internet Explorer.  
  //Copy the page to the clipboard and then paste into notepad or a text editor and save to a file.  
  //The browser issues warnings about ActiveX Objects and may require some adjustments to get the page to execute.  
  //The javascript code assumes that there are no firewalls or proxy servers between the client and the destination server 
  //that must be used to complete the communication path.


  //<html><head>
  //<title>Example courtesy of United States Postal Service</title>
  //</head><body>
  //<script type="text/javascript">
  //var objSrvHTTP = null;
  //var Version;
  //var HTTPVersions = new Array( "7.0","6.0","5.0","4.0","3.0" );
  //for( Version = 0; Version < HTTPVersions.length; Version++ ) {
  //  try {
  //    objSrvHTTP = new ActiveXObject("Msxml2.ServerXMLHTTP." + HTTPVersions[Version]);
  //      window.status = "Using ServerXMLHTTP." + HTTPVersions[Version];
  //      break;
  //  } catch(e) {}
  //      objSrvHTTP = null;
  //}
  //if( objSrvHTTP == null ) { alert( "No HTTP object available" );}
  //else {
  //      objSrvHTTP.setOption( 2, 13056 );  // ignore certificate errors
  //      objSrvHTTP.setProxy(1);  // ignore proxy servers (see proxycfg utility)
  //      objSrvHTTP.setTimeouts( 10000, 10000, 10000, 10000 ); //10 sec timeout
  //}
  //function getAPIResponse( style ) {
  //    var URL = (style) ? APIForm.XMLContent.value :
  //       ((APIForm.secure.checked)?"https://":"http://")+APIForm.APIServer.value+
  //       APIForm.tURI.value+"?API="+APIForm.APIName.value+"&XML="+
  //       APIForm.XMLContent.value;
  //// alert( URL );
  //      try {objSrvHTTP.open ("GET", URL, false); objSrvHTTP.send ();
  //            XMLResponse.innerText = (objSrvHTTP.status == 200) ?
  //                  objSrvHTTP.responseText : "HTTP Error " + objSrvHTTP.status;}
  //      catch(e) { XMLResponse.innerText = "Error condition " + e.description;
  //          objSrvHTTP = new ActiveXObject("Msxml2.ServerXMLHTTP."+HTTPVersions[Version]);}
  //}
  //</script>
  //<form name="APIForm" method="get">
  //<label for="APIName">API Name</label>
  //<input type="text" name="APIName" size="25" style="margin:0 51px 0 10px">
  //<button onClick="getAPIResponse(false);">Build URL</button><br>
  //<label for="APIServer">API Server</label>
  //<input type="text" size="30" name="APIServer" style="margin:0 13px 0 7px;">
  //<input name="secure" type="checkbox">
  //<label for="secure"> use https</label><br>
  //<label for="tURI">URI path</label>
  //<input name="tURI" type="text" value="/ShippingAPITest.dll" style="margin:0 21px 0 20px;" size="30">
  //<button onClick="getAPIResponse(true);">Text is URL</button><br>
  //<textarea id="XMLContent" name="XMLContent" cols="80" rows="5"></textarea>
  //</form>
  //<hr>
  //<div style="width:100%"><span id="XMLResponse"></span></div>
  //</body></html>