<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    protected void submitButton_Click(object sender, EventArgs e)
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
            comm = new SqlCommand("EXEC InsertContact @visitor_email, @visitor_msg", conn);
            comm.Parameters.Add("@visitor_email", System.Data.SqlDbType.NChar, 225);
            comm.Parameters["@visitor_email"].Value = uEmail.Text;
            comm.Parameters.Add("@visitor_msg", System.Data.SqlDbType.NChar, 1500);
            comm.Parameters["@visitor_msg"].Value = uContent.Text;

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
	<script src="js/contact.js"></script>
	    	
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
				<li><a href="news.aspx">News</a></li>
				<li class="active"><a href="contact.aspx">Contact</a></li>
				<li><a href="faq.html">FAQ</a></li>		
		</nav>
	</div>
	<!---			---			--- Start Banner ---			---			--->
	<div class="row banner">
		<div class="col-sm-12"><img src="images/DSK Branding.png" alt="DSK LOGO" class="logo"></div>
	</div>

	<!---			---			--- Start Pages ---			---			--->
	<div class="row content">
		<div class="col-sm-6 col"><h1>Contact us!</h1></div><br>
		
		<div class="col-sm-6 col">		 
		    <form id="uForm" runat="server">
                <!-- Contact form -->
		 
		 <label for="email"></label>
		 	<!-- user email -->
             <asp:TextBox ID="uEmail" runat="server" placeholder="Your eMail address.."></asp:TextBox>
             &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="uEmail" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>
             <br>
		 <label for="emailContent"></label>
			<!--user message -->
             <asp:TextBox ID="uContent" runat="server" Height="133px" Width="347px" placeholder="Send us a message"></asp:TextBox>
             <br>			
			<!-- Email missing alert -->
             <asp:RequiredFieldValidator ID="uEmailAlert" runat="server" ErrorMessage="Please add a message!" ControlToValidate="uContent" ForeColor="#CC0000"></asp:RequiredFieldValidator>
		     <!-- Submit button -->
                <asp:Button ID="submitButton" runat="server"
                Text="Submit" onclick="submitButton_Click" />
             <p>
                 <asp:Label ID="dbErrorMessage" runat="server" ForeColor="#CC0000"></asp:Label>
             </p></div>													
		 
		    </form>
		 </div>
	
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
