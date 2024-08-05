<%@ page import="java.sql.*, java.lang.Integer" %>
<%
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "mail";
    String userid = "root";
    String password = "*Ramu@2003#";

    String ids[] = request.getParameterValues("delete");
    int target = Integer.parseInt(request.getParameter("target"));

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish the connection
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();

       
        for(int i = 0;i<ids.length;i++)
        {
          String sql = "UPDATE mails SET sentbox=0 WHERE id=" + ids[i];
          if(target == 1){
            sql = "UPDATE mails SET sentbox=0 WHERE id=" + ids[i];
          }
          else{
            sql = "UPDATE mails SET inbox=0 WHERE id=" + ids[i];
          }

          int result = statement.executeUpdate(sql);
        }

        if(target == 0)
        {
          response.sendRedirect("./inbox.jsp");
        }
        else{
          response.sendRedirect("./sentbox.jsp");
        }
    } 
    catch (Exception e) {
        e.printStackTrace();
        out.println("Error occurred: " + e.getMessage());
    } 
%>
