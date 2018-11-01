<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    protected void joinButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // Code that uses the data entered by the user
            // Define data objects
            SqlConnection conn;
            SqlCommand comm;
            // Read the connection string from Web.config
            string connectionString =
                ConfigurationManager.ConnectionStrings[
                "GameSite"].ConnectionString;
            // Initialize connection
            conn = new SqlConnection(connectionString);
            // Create command 
            comm = new SqlCommand("EXEC InsertSignup @visitor_email, @visitor_name", conn);
            comm.Parameters.Add("@visitor_email", System.Data.SqlDbType.NChar, 225);
            comm.Parameters["@visitor_email"].Value = email_address1.Text;
            comm.Parameters.Add("@visitor_name", System.Data.SqlDbType.NChar, 225);
            comm.Parameters["@visitor_name"].Value = first_name.Text;

            // Enclose database code in Try-Catch-Finally
            try
            {
                // Open the connection
                conn.Open();
                // Execute the command
                comm.ExecuteNonQuery();
                // Reload page if the query executed successfully
                Response.Redirect("thankyou.html");
            }
            catch (SqlException ex)
            {
                // Display error message
                dbErrorMessage.Text =
                   "Error submitting the data!" + ex.Message.ToString();

            }
            finally
            {
                // Close the connection
                conn.Close();
            }
        }
    }

</script>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>DSK Gaming</title>
	<link rel="icon" href="images/tabIcon.png">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<!--my scripts-->
	<script src="js/signUp.js"></script>
	    	
	<link href="css/custom.css" rel="stylesheet">
	<link href="css/customAssignment.css" rel="stylesheet">

  </head>

  <body>
	<div id="section1"> <!--specifies the "page" for parallax-->
	<div class="section section1"> <!-- Section caller (GENERAL)(SPECIFIC) -->
  
	<!---           ---         --- Start Nav ---               ---         --->
	<div class="manualNav">
		<nav>
			<ul>
				<li><a href="index.html#section1">Home</a></li>
                <li><a href="index.html#section2">About</a></li>
                <li><a href="dps.html">DPS</a></li>
				<li  class="active"><a href="news.aspx">News</a></li>
				<li><a href="contact.aspx">Contact</a></li>
				<li><a href="faq.html">FAQ</a></li>		
		</nav>
	</div>
	<!---			---			--- Start Banner ---			---			--->
	<div class="row banner">
		<div class="col-sm-12"><img src="images/DSK Branding.png" alt="DSK LOGO" class="logo"></div>
	</div>

	<!---			---			--- Start Pages ---			---			--->
	<div class="row content">
				 
		
		<div class="col-sm-10 col"><h1>Sign up for our news letter.</h1></div>
		<br>
						
		<form><!-- form for newsletter sign up -->		 
		 <label for="newsLetter"></label>
		 	<form id="email_form" runat="server">
            <label for="email_address1"></label>            
            <asp:TextBox ID="email_address1" runat="server" placeholder="Your eMail"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="email_address1"></asp:RequiredFieldValidator>
            <!--<span id="email" style="color: red">*</span>-->
                 <br>

            <!--  ***For Later Use***
            <label for="email_address2"></label>
            <asp:TextBox ID="email_address2" runat="server" placeholder="Your eMail"></asp:TextBox>
            <span  id="email2" style="color: red">*</span><br>
             -->

            <label for="first_name"></label>            
            <asp:TextBox ID="first_name" runat="server" placeholder="Your Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="#CC0000" ControlToValidate="first_name"></asp:RequiredFieldValidator>
            <!--<span  id="fName" style="color: red">*</span>--><br>

            <label>&nbsp;</label>
            <asp:Button ID="join_list" runat="server"
                Text="Join" onclick="joinButton_Click" />
                <br />
                <asp:Label ID="dbErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
        </form>
	
	</div>

	<div class="row content">
	 

	 
	 
	</div>

	</div> <!--id section-->
	</div> <!--class section-->

</div> <!--id section-->
</div> <!--class section-->


</body>
<footer>
	<p>© Copyright 2016 DSKGaming all rights reserved.</p>
	<a href="#section1"><p>Top of Page</p></a>
</footer>
	
  </body>
</html>
