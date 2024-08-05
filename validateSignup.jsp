<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "mail";
String userid = "root";
String password = "*Ramu@2003#";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String user_id = request.getParameter("email");
String user_pwd = request.getParameter("pwd");

out.println(user_id);

int flag=0;

if(user_id.length()>0 && user_pwd.length()>0) {
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql ="insert into users(mailid,pwd,type) values('"+user_id+"','"+user_pwd+"','user')";
int insertedRows = 0;
insertedRows = statement.executeUpdate(sql);

if(insertedRows >= 1){
    flag = 1;
    out.println("Registration completed successfully");
}
else{
  out.println("Registration failed");
}

if(flag==1){
    session.setAttribute("email", user_id);
    response.sendRedirect("home.jsp");
}
else{
    response.sendRedirect("login.jsp?msg='Registration failed'");
}
connection.close();
}
catch(Exception e){
    out.println(e);

}
}
else{
  response.sendRedirect("login.jsp?msg='Fill the nescessary details'");
}
%>