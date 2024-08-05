<%@ page import="java.sql.*, java.lang.Integer" %>
<%
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "mail";
    String userid = "root";
    String password = "*Ramu@2003#";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        // Load the JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish the connection
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();

        // Parse the request parameters to integers
        int id = Integer.parseInt(request.getParameter("id"));
        int sent = 0,inbox = 0;

        if(request.getParameter("inbox") != null)
        {
          inbox = Integer.parseInt(request.getParameter("inbox"));
        }
        else if(request.getParameter("sent") != null)
        {
          sent = Integer.parseInt(request.getParameter("sent"));
        }

        // Prepare and execute the SQL query
        String sql = "UPDATE mails SET sentbox=0 WHERE id=" + id;
        if(sent == 1){
          sql = "UPDATE mails SET sentbox=0 WHERE id=" + id;
        }
        else if(inbox == 1){
          sql = "UPDATE mails SET inbox=0 WHERE id=" + id;
        }

        int result = statement.executeUpdate(sql);

        if (result > 0) {
            response.sendRedirect("./inbox.jsp");
        } else {
            out.println("No record found to update.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error occurred: " + e.getMessage());
    } finally {
        // Close the resources
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
