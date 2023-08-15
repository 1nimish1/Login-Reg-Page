<%@ page import="java.sql.*" %>
<html>
    <head>
        <title>Registration Form </title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <link rel="stylesheet" href="(registration)style.css" />
    </head>
    <body >
        <h1>Registration Form </h1>
        <form method="post" action="" id="myform">
            <table width="600px" align="center" border="2">
                <tr>
                    <td ><b>Enter name</b>  </td>
                    <td ><input type="text" name="email"/></td>
                </tr>
                <tr>
                    <td rowspan="1"><b>Enter Gender</b></td>
                    <td><input type="text" name="m1">MALE/ FEMALE /OTHER</td>
                </tr>
                <tr >
                    <td rowspan="1"><b>Type of farmer</b></td>
                    <td><input type="text"  name="t2"/></td>
                </tr>
                <tr >
                    <td rowspan="1"><b>Aadhar number</b></td>
                    <td><input type="text" minlength="12" name="t3"/></td>
                </tr>
                <tr >
                    <td rowspan="1"><b>Phone number</b> </td>
                    <td><input type="text" minlength="10" name="t4"/></td>
                </tr>
                <tr >
                    <td rowspan="1"><b>Nominee </b></td>
                   <td><input type="text"  name="t5"/></td>
                </tr>
                <tr >
                    <td rowspan="1"><b>Address</b></td>
                    <td colspan="2"><input type="text" name="t6"/></td>
                </tr>
                <tr height="20px">
                    <td ><b>Password(8 characters minimum)</b></td>
                    <td><input type="password" id="pass1" name="t7" minlength="8" required/></td>
                </tr>
                <tr height="20px">
                    <td ><b>Confirm Password(8 characters minimum)</b></td>
                    <td><input type="password" id="pass2" name="t8" minlength="8" required/></td>
                </tr>
                <tr>
                    <td rowspan="1"><b>Khasra</b></td>
                    <td colspan="2"><input type="file" name="t9"/></td>
                </tr>
                <tr align="center">
                    <br>
                    <td colspan="2"><input type="submit" name="b1"/>
                       <br><br> Already a member ? <a href="Login Page(Project).jsp">Login Here</a>
                    </td>
                </tr>
                </table>
            </form>
                    <%
                        if(request.getParameter("b1")!=null){
                            try{
                            String name=request.getParameter("email");
                            String gender=request.getParameter("m1");
                            String tof=request.getParameter("t2");
                            long aadharno = Long.parseLong(request.getParameter("t3"));
                            long phoneno=Long.parseLong(request.getParameter("t4"));
                            String nominee=request.getParameter("t5");
                            String address=request.getParameter("t6");
                            String pswd=request.getParameter("t7");
                            String Cpswd=request.getParameter("t8");
                            
                            if(!pswd.equals(Cpswd)){
                    %>
                                <Script>
                                    alert("Your confirm password is not same as password");
                                    open("Registration page(Project).jsp");
                                </Script>
                    <%
                        }else{
                        Connection con=null;
                        Statement st;
                        
                            Class.forName("oracle.jdbc.driver.OracleDriver");
                            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
                            String sql="insert into User_info values('"+name+"','"+gender+"','"+tof+"',"+aadharno+","+phoneno+",'"+nominee+"','"+address+"','"+pswd+"','"+Cpswd+"')";
                            st=con.createStatement();
                            int res=st.executeUpdate(sql);
                            if(res!=0){
                    %>
                                <script>
                                    alert("Registerd Successfully");
                                    open("Home page(Project).jsp");
                                </script>
                    <%
                                }else{
                                    out.println("recored doesnot inserted");
                                }
                            }
                        }catch(Exception e){
                    %>
                                <script>
                                    alert("Something went wrong");
                                    open("Home page(Project).jsp")
                                </script>
                    <%
                            }
                        }
                        
                    %>
    </body>
</html>
