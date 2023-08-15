<%@ page import="java.sql.*" %>
<html>
    <head>
        <title>Login  Form </title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="stylesheet" href="(login)style.css" /
    </head>
    <body >
        <h1>Login Form </h1>
        <form method="post" action="" name="f1">
            <table width="600px" height="100px" align="center" border="2">
                <tr>
                    <td ><b>Enter Phone number</b>  </td>
                    <td ><input type="text" name="email"/></td>
                </tr>
               
                <tr height="20px">
                    <td ><b>Password(8 characters minimum)</b></td>
                    <td><input type="password" id="pass" name="t1" minlength="8" required/></td>
                </tr>
                <tr height="20px">
                    <td colspan="2">
                        <input type="submit" value="Login" name="b1" />
                    </td>
                </tr>
                <tr>
                    <td>
                         <b>Don't Have an Account ?<b> <a href="Registration page(Project).jsp">SignUp Here</a>
                    </td>
                </tr>
            </table>
        </form>
        <%
        if (request.getParameter("b1") != null) {
            try {
                String phoneno = request.getParameter("email");
                String password = request.getParameter("t1");           
                Class.forName("oracle.jdbc.driver.OracleDriver");             
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");               
                String sql = "SELECT Phone_number, Password FROM User_info WHERE Phone_number = '" + phoneno + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                String ph = null;
                String ps = null;                
                if (rs.next()) {
                    ph = rs.getString("Phone_number");
                    ps = rs.getString("Password");
                }              
                if (ph != null && ps != null && ph.equals(phoneno) && ps.equals(password)) {
        %>
                    <script>
                        alert("Login Successful");
                        window.location.href = "Home page(Project).jsp";
                    </script>
        <%
                } else{
        %>
                    <script>
                        alert("Wrong Credential");
                    </script>
        <%
                }
            } catch (Exception e) {
        %>
                <script>
                    alert("Something went wrong");
                </script>
        <%
            }
        }
        %>
    </body>
</html>
