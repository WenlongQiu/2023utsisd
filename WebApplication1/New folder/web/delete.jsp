<%-- 
    Document   : delete
    Created on : May 3, 2023, 2:36:57 PM
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--<html>
<head>
    <title>Delete User Page</title>
</head>
<body>
    <h1>Delete Page</h1>
    <form action="/delete_user" method="POST">
        <label for="userId">User Name:</label><br>
        <input type="text" Email="userId" name="Email"><br>
        <button type="submit">[<a href="deletepage.html">Delete </a>]</button>
    </form>
            <p>[ <a href="index.html">Back to Homepage</a> ]</p>
</body>
</html>-->
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
        echo "<td><a href='edit.php?id=".$row['id']."'>Edit</a> | <a href='toggle-status.php?id=".$row['id']."'>Toggle Status</a> | <a href='delete.php?id=".$row['id']."'>Delete</a></td>";
        echo "</tr>";
      }
      
      // Close database connection
      mysqli_close($conn);
    ?>
  </table>
</body>
</html>
<?php
  // Establish database connection
  $conn = mysqli_connect("localhost", "username", "password", "database_name");
  
  // Retrieve user ID from the query parameter
  $id = $_GET['id'];
  
  // Delete the user record from the database
  $query = "DELETE FROM users WHERE id='$id'";
  mysqli_query($conn, $query);
  
  // Redirect back to the user list
  header("Location: index.php");
  exit();
  
  // Close database connection
  mysqli_close($conn);
?>
