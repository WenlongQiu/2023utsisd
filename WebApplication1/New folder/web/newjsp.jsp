<%-- 
    Document   : newjsp
    Created on : 2023年4月19日, 下午4:00:02
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Mangement</title>
    </head>
    <body>
        <h1>Register</h1>
        <p>Here can record you name and phone number</p>
        
            <p>Full name: <input type="text" id="username" name="username"></p>
            <p>Phone number: <input type="phoneno" id="phoneno" name="phoneno"></p>
            <p>Emaill: <input type="emaill" id="emaill" name="emaill"></p>
            <p>Password: <input type="Password" id="Password" name="Password"></p>
            <input type="submit" value="Submit">        
        <button type="submit">[<a href="mainone.jsp">Login </a>]</button>
        <p>[ <a href="index.html">Back to Homepage</a> ]</p>
    </body>
</html>
-->
<!DOCTYPE html>
<html>
<head>
  <title>User Management</title>
</head>
<body>
  <h2>User Management</h2>
  
  <form action="search.php" method="POST">
    <label for="full_name">Full Name:</label>
    <input type="text" id="full_name" name="full_name" placeholder="Enter full name"><br>
    
    <label for="phone_number">Phone Number:</label>
    <input type="text" id="phone_number" name="phone_number" placeholder="Enter phone number"><br>
    
    <input type="submit" value="Search">
  </form>
  
  <h3>User List</h3>
  <table>
    <tr>
      <th>ID</th>
      <th>Full Name</th>
      <th>Phone Number</th>
      <th>Status</th>
      <th>Action</th>
    </tr>
    <?php
      // Establish database connection
      $conn = mysqli_connect("localhost", "username", "password", "database_name");
      
      // Retrieve user records
      $query = "SELECT * FROM users";
      $result = mysqli_query($conn, $query);
      
      // Loop through the results and display user data
      while ($row = mysqli_fetch_assoc($result)) {
        echo "<tr>";
        echo "<td>".$row['id']."</td>";
        echo "<td>".$row['full_name']."</td>";
        echo "<td>".$row['phone_number']."</td>";
        echo "<td>".$row['status']."</td>";
        echo "<td><a href='edit.php?id=".$row['id']."'>Edit</a> | <a href='toggle-status.php?id=".$row['id']."'>Toggle Status</a></td>";
        echo "</tr>";
      }
      
      // Close database connection
      mysqli_close($conn);
    ?>
  </table>
</body>
</html>

