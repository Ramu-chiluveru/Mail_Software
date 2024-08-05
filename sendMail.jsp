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
String mto = request.getParameter("email");
String subject = request.getParameter("Subject");
String msg = request.getParameter("msg");
String mfrom = session.getAttribute("email").toString(); 


int flag=0;

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="insert into mails(mfrom,mto,subject,content,inbox,sentbox) values('"+mfrom+"','"+mto+"','"+subject+"','"+msg+"',1,1)";
int insertedRows = statement.executeUpdate(sql);

if(insertedRows >= 1)
{
  flag = 1;
  response.sendRedirect("./compose.jsp?msg='successfully sent'");
}
else{
  response.sendRedirect("./compose.jsp?msg='failed to send'");
}
connection.close();
}
catch(Exception e){
    out.println(e.getMessage());
}
%>