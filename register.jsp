
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MailKaro</title>

  <style>
    .login-container{
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      width: 100vw;
      height: 100vh;
    }

    .input{
      box-shadow: rgba(0,0,0, 0.3) 0px 0px 5px 2px;
      border-radius: 1rem;
      height: 50%;
      align-items: center;
      justify-content: center;
      width: 50%;
      gap: 10px;
      display: flex;
      flex-direction: column;
    }

    input{
      width: 250px;
    }

    .btn{
      width: 100px;
      padding: 5px 10px;
    }

    .input > *{
      padding: 5px 10px;
    }

    *{
      margin: 0px;
      padding: 0px;
    }
  </style>
</head>
<body>

  <%
  String str = request.getParameter("msg");
  if (str != null) {
      out.println("<font size=\"32\" color=\"red\" class=\"msg\">" + str + "</font>");
  }
 %>
 

  <div id="app">
    <div class="login-container">
      <h1>Signup Form</h1>
      <form name="f1" class="input" action="validateSignup.jsp">
        <input type="email" placeholder="Email" class="email" id="email" name="email" onchange="handleLogin()">
        <input type="password" placeholder="password" class="password" name="pwd" id="pwd">
        <div class="btn-grp">
          <button class="btn" type="submit">Signup</button>
          <button type="reset" class="btn">Reset</button>
        </div>
        <div class="links">
          <a href="login.jsp">Already have an Account?</a>
        </div>
      </form>
    </div>
  </div>
  
</body>

<script>
  function handleLogin()
  {
    let mail = f1.email.value;
    console.log(mail);
  }
</script>
</html>