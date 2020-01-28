<?php /* $Id: Login.tpl 3530 2007-11-09 18:28:10Z brian $ */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title>StaidLogic ATS - Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=<?php echo(HTML_ENCODING); ?>" />
        <style type="text/css" media="all">@import "modules/login/login.css";</style>
        <script type="text/javascript" src="js/lib.js"></script>
        <script type="text/javascript" src="modules/login/validator.js"></script>
        <script type="text/javascript" src="js/submodal/subModal.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  		        
		<meta name="google-signin-scope" content="profile email">
		<meta name="google-signin-client_id" content="728431758938-1jp6fld6pfrc21mbohchhkfsr8a437vp.apps.googleusercontent.com">
		<script src="https://apis.google.com/js/platform.js" async defer></script>

  <style type="text/css">
    #customBtn {
      display: inline-block;
      background: white;
      color: #444;
      width: 250px;
      
      border: thin solid #888;
      box-shadow: 1px 1px 1px grey;
      white-space: nowrap;
    }
    #customBtn:hover {
      cursor: pointer;
    }
    span.label {
      font-family: serif;
      font-weight: normal;
    }
    span.icon {
      display: inline-block;
	  vertical-align: middle;
	  padding: 10px;
	  

    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      padding-left: 10px;
      padding-right: 10px;
      font-size: 11px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
  </style>
  
  <style type="text/css">
    #customBtn2 {
      display: inline-block;
      background: white;
      color: #444;
      width: 250px;
      
      border: thin solid #888;
      box-shadow: 1px 1px 1px grey;
      white-space: nowrap;
    }
    #customBtn2:hover {
      cursor: pointer;
    }
    span.label2 {
      font-family: serif;
      font-weight: normal;
    }
    span.icon2 {
      display: inline-block;
	  vertical-align: middle;
	  padding: 1px;
	  

    }
    span.buttonText2 {
      display: inline-block;
      vertical-align: middle;
      padding-left: 8px;
      padding-right: 8px;
      font-size: 13px;
      
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
  </style>
  
  
    </head>

    <body>
    <!-- CATS_LOGIN -->
    <?php TemplateUtility::printPopupContainer(); ?>
<!--       <div id="headerBlock"> 
            <span id="mainLogo">StaidLogic</span><br /> 
             <span id="subMainLogo">Applicant Tracking System</span> 
       </div> -->
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>


        <div id="contents">
            <div id="login">
                <div id="loginText">
                    <div class="ctr">
                    </div>
                    <br />

                    <?php if (ENABLE_DEMO_MODE && !($this->siteName != '' && $this->siteName != 'choose') || ($this->siteName == 'demo')): ?>
                        <br /><br />
                        <?php if ($this->aspMode): ?>
                            <a href="javascript:void(0);" onclick="demoLogin(); return false;">Login to Demo Account</a><br />
                            <br />
                            <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=asp&amp;a=forgotLogin&amp;p=0">Forgot Login Information?</a>
                        <?php else: ?>
                            <a href="javascript:void(0);" onclick="demoLogin(); return false;">Login to Demo Account</a><br />
                        <?php endif; ?>
                    <?php elseif ($this->aspMode): ?>
                        <br /><br />
                        <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=asp&amp;a=forgotLogin&amp;p=0">Forgot Login Information?</a>
                    <?php endif; ?>
                </div>

                <div id="formBlock">
                    <img src="images/staidlogic.png" alt="Login" hspace="5" vspace="5" />
                    <br />
                    <form name="loginForm" id="loginForm" action="<?php echo(CATSUtility::getIndexName()); ?>?m=login&amp;a=attemptLogin<?php if ($this->reloginVars != ''): ?>&amp;reloginVars=<?php echo($this->reloginVars); ?><?php endif; ?>" method="post" onsubmit="return checkLoginForm(document.loginForm);" autocomplete="off">
                        <div id="subFormBlock">
                            <?php if ($this->siteName != '' && $this->siteName != 'choose'): ?>
                                <?php if ($this->siteNameFull == 'error'): ?>
                                    <label>This site does not exist. Please check the URL and try again.</label>
                                    <br />
                                    <br />
                                <?php else: ?>
                                    <label><?php $this->_($this->siteNameFull); ?></label>
                                    <br />
                                    <br />
                                <?php endif; ?>
                            <?php endif; ?>

                            <?php if ($this->aspMode): ?>
                                <?php if ($this->siteName == 'choose' || ($this->aspMode && $this->siteName == '')): ?>
                                    <label id="siteNameLabel" for="siteName">Company Identifier</label><br />
                                    <input name="siteName" id="siteName" class="login-input-box" />
                                    <br />
                                <?php elseif($this->siteName != ''): ?>
                                    <input type="hidden" name="siteName" value="<?php $this->_($this->siteName); ?>">
                                <?php endif; ?>
                            <?php endif; ?>

                            <?php if ($this->siteNameFull != 'error'): ?>
                                <label id="usernameLabel" for="username">ATS Username</label><br />
                                <input name="username" id="username" class="login-input-box" value="<?php if (isset($this->username)) $this->_($this->username); ?>" style="width: 180px;" />
                                <br />

                                <label id="passwordLabel" for="password">Password</label><br />
                                <input type="password" style="width: 180px;" name="password" id="password" class="login-input-box" />
                                <br />

                                <input type="submit" class="button" id="btnMain" value="ATS Login" />
                                <input type="reset"  id="reset" name="reset"  class="button" value="Reset" />
                                <br/><br/>
                                <div>
                                	<table>
                                		<tr id="googleBtnBfore" style="display:block;">
                                			<td width="50%">
                                				<div name="googleBtn" >
                                					<div id="gLoginButton" name="gLoginButton" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                                				</div>
                                				</td>
                                			<td width="50%">
			                            	    <div id="customBtnGoDaddy" class="customGPlusSignIn2" onclick="goDaddyLogin();" style="background-color:#1E90FF;cursor: pointer;">
											      <span class="icon2" ><img src="images/google/stdl_logo.png" alt="GoDaddy Logo" height="34" width="34"></span>
											      <span class="buttonText2" id="buttonText2" name="buttonText2" style="color:white"> Sign In &nbsp;&nbsp;</span>
											    </div>                                			
                                			</td>
                                	    </tr>
                                	    <tr id="stdlBtnBfore" style="display:none;">
                                			<td width="50%">
                                				<div name="googleBtn" >
                                					<div id="gLoginButton" name="gLoginButton" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                                				</div>
                                				</td>
                                			<td width="50%">
			                            	    <div id="customBtnGoDaddy" class="customGPlusSignIn2" onclick="resetToATS();" style="background-color:#1E90FF;cursor: pointer;">
											      <span class="icon2" ><img src="images/google/stdl_logo.png" alt="GoDaddy Logo" height="34" width="34"></span>
											      <span class="buttonText2" id="buttonText2" name="buttonText2" style="color:white">ATS Login</span>
											    </div>                                			
                                			</td>
                                	    </tr>
                                		<tr id="googleBtnAfter" style="display: none;">
                                			<td colspan=2>
				                            <div name="googleBtn" >
				                        	    <div id="customBtn" class="customGPlusSignIn" onclick="loginToATS();">
											      <span class="icon" ><img src="images/google/Google.png" alt="Google Logo" height="18" width="18"></span>
											      <span class="buttonText" id="buttonText" name="buttonText">Login as </span>
											    </div>
											    
				                                <div id="divSignout" name="divSignout" style="padding-top:5px;" >
				                                	<spam id="userName"></spam>, click here to <a href="#" onclick="signOut();">Sign out</a>.
				                                </div>
				                            </div>                                			
                                			</td>
                                		</tr>
                                	</table>	
                                </div>
                                
                                <input type="hidden" name="googleId" id="googleId" >
                                <input type="hidden" name="googleToken" id="googleToken">
                                <input type="hidden" name="goDaddyId" id="goDaddyId" >
                                <input type="hidden" name="userAuth" id="userAuth" value="1">
                                
                                
                            <?php else: ?>
                                <br />
                                <?php if ($this->aspMode): ?>
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=asp&amp;a=createsite&amp;p=0">Create Free Trial Site</a><br />
                                    <a href="<?php echo(CATSUtility::getIndexName()); ?>?m=asp&amp;a=forgotLogin&amp;p=0">Forgot Login Information</a>
                                <?php else: ?>
                                    <a href="javascript:void(0);" onclick="demoLogin(); return false;">Login to Demo Account</a><br />
                                <?php endif; ?>
                            <?php endif; ?>
                            <br /><br />
                        </div>
                    </form>
                
                </div>
                <div style="clear: both;"></div>
            </div>
            <br />

            <script type="text/javascript">
                <?php if ($this->siteNameFull != 'error'): ?>
                    document.loginForm.username.focus();

                    function demoLogin()
                    {
                        document.getElementById('username').value = '<?php echo(DEMO_LOGIN); ?>';
                        document.getElementById('password').value = '<?php echo(DEMO_PASSWORD); ?>';
                        document.getElementById('loginForm').submit();
                    }
                    function defaultLogin()
                    {
                        document.getElementById('username').value = 'admin';
                        document.getElementById('password').value = 'cats';
                        document.getElementById('loginForm').submit();
                    }
                <?php endif; ?>
                <?php if (isset($_GET['defaultlogin'])): ?>
                    defaultLogin();
                <?php endif; ?>
            </script>

         

	
	           <div id="login">
                <?php if (!empty($this->message)): ?>
                    <div id="msgText">
                        <?php if ($this->messageSuccess): ?>
                            <p class="success"><?php $this->_($this->message); ?><br /></p>
                        <?php else: ?>
                            <p class="failure"><?php $this->_($this->message); ?><br /></p>
                        <?php endif; ?>
                    </div>
                <?php endif; ?>
			</div>
	  


        <script type="text/javascript">
            initPopUp();
        </script>
        <?php TemplateUtility::printCookieTester(); ?>

    
    <script type="text/javascript">
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        document.getElementById("userAuth").value = "2";
		document.getElementById("googleId").value = profile.getEmail(); 
		document.getElementById("googleToken").value = id_token; 
		document.getElementById("googleBtnBfore").style.display = "none";
		document.getElementById("googleBtnAfter").style.display = "block";
		document.getElementById("buttonText").innerHTML= "Login as "+profile.getEmail();
		document.getElementById("userName").innerHTML= profile.getName();
		//document.getElementById("loginForm").submit();
		
      }
    </script>
    
	<script type="text/javascript">
	  function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	    document.getElementById("googleId").value = "";
	    document.getElementById("googleToken").value ="";
	    document.getElementById("userAuth").value = "1";
		document.getElementById("googleBtnBfore").style.display = "block";
		document.getElementById("googleBtnAfter").style.display = "none";
		document.getElementById("stdlBtnBfore").style.display = "none";		
		document.getElementById("buttonText").innerHTML= "Login as ";
		document.getElementById("msgText").innerHTML = "";
		
	    
	  }
	</script>
	
	
	<script type="text/javascript">
	function loginToATS()
	{
		document.getElementById("loginForm").submit();
	}
	
	function goDaddyLogin()
	{
		document.getElementById("userAuth").value = "3";
		document.getElementById("usernameLabel").innerHTML= "Email ID [.net/ .in/ .us]";
		document.getElementById("btnMain").value= "Login";
		document.getElementById("googleBtnBfore").style.display = "none";
		document.getElementById("stdlBtnBfore").style.display = "block";
		
	}
	
	function resetToATS()
	{
		document.getElementById("userAuth").value = "1";
		document.getElementById("usernameLabel").innerHTML= "ATS Username";
		document.getElementById("btnMain").value= "ATS Login";
		document.getElementById("googleBtnBfore").style.display = "block";
		document.getElementById("stdlBtnBfore").style.display = "none";
	}
	
	</script>

</body>   
</html>
