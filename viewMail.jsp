<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        *{
          padding: 0px;
          margin: 0px;
          box-sizing: border-box;
        }

        body{
          width: 100vw;
          height: 100vh;
        }

        p{
            color: blue;
        }

        .input{
          display: flex;
          flex-direction: column;
          gap: 30px;
        }

        .btn{
          text-decoration: none;
          color:white;
          width: 100px;
          height: 30px;
          background-color: black;
          padding: 5px 10px;
          border-radius: 3px;
        }

        .btn:hover{
          color: black;
          background-color: #fff;
          transition: ease-in-out 10ms;
          box-shadow: rgba(0, 0, 0, 0.3) 0px 0px 1px 2px;
        }

        .container{
          width: 100%;
          display: flex;
          height: 100%;
        }

        .nav-menu li a{
          color: black;
        }

        .sidebar{
          padding: 10px;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 50px;
          flex: 0.2;
          background-color: rgba(0, 0, 0, 0.1);
          border-radius: 1rem;
          box-shadow: rgba(0, 0, 0, 0.3) 0px 0px 1px 1px;
        }

        ul {
          display: flex;
          flex-direction: column;
          gap: 5px;
        }

        li{
          list-style-type: none;
        }

        .active{
          color: red !important;
        }

        .main-container{
          flex: 1;
          padding: 20px 50px;
          box-sizing: border-box;
          display: flex;
          flex-direction: column;
          gap: 30px;
        }

        form{
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          gap: 30px;
        }
        
        .input{
          width: 50%;
        }
        input{
          width: 100%;
          height: 40px;
        }
        textarea{
          width: 50%;
          padding: 20px;
        }

        h3{
          text-align: center;
        }

        .box{
          display: flex;
          gap: 20px;
        }
    </style>
</head>
<body>

    <%
        String user;

        if(session.getAttribute("email") != null)
        {
          user = session.getAttribute("email").toString();
        %>
        
      <div class="container">
      <section class="sidebar">
        <div class="user">
          <h3><%=user%></h3>
          <%}%>
        </div>
        <ul class="nav-menu">
          <li><a href="inbox.jsp">Inbox</a></li>
          <li><a href="sentbox.jsp">Sent</a></li>
          <li><a href="./trash.jsp">Trash</a></li>
          <li><a href="compose.jsp"></a></li>
        </ul>

        <div class="logout">
          <a href="logout.jsp" class="btn">Logout</a>
        </div>
      </section>
      <section class="main-container">
        <h3>mail</h3>

        <div>

          <% 
            String mfrom = request.getParameter("mfrom").toString();
            String mto = request.getParameter("mto").toString();
            String subject = request.getParameter("subject").toString();
            String message = request.getParameter("message").toString();
            int id = Integer.parseInt(request.getParameter("id"));
            int target = Integer.parseInt(request.getParameter("target"));
          %>
          <div class="input">
            <div class="box">
              <label for="from">From</label>
              <h4><%=mfrom%></h4>
            </div>
            
            <div class="box">
              <label for="to">To:</label>
              <h4><%=mto%></h4>
            </div>

          <div class="box">
            <label for="Subject">Subject:</label>
            <p><%=subject%></p>
          </div>

          <div class="box">
            <label for="message">Message: </label>
            <p><%=message%></p>
          </div>

          <div class="box">
          <%
            if(Integer.parseInt(request.getParameter("target")) == 0){
            %>
              <a href="inbox.jsp" class="btn">Back</a>
              <a href="./compose.jsp?to=<%=mfrom%>" class="btn">Reply</a>
              <%}%>
            <%
            if(Integer.parseInt(request.getParameter("target")) == 1){
                %>
                <a href="sentbox.jsp" class="btn">Back</a>
        
              <%}%>

              <a href="./demo.jsp?delete=<%=id%>&target=<%=target%>" class="btn">Delete</a>
            </div>
            
        </div>
      </section>
    </div>
</body>
</html>