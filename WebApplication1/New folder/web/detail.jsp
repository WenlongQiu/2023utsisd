<%-- 
    Document   : newjsp
    Created on : May 12, 2023, 5:55:30 PM
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--<html>
<head>
    <title>User Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h2>Your Details</h2>
    <table>
        <tr>
            <th>Name</th>
            <td id="name"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td id="email"></td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td id="phoneNo"></td>
        </tr>
        <tr>
            <th>Date of Birth</th>
            <td id="dob"></td>
        </tr>
    </table>
    <script>
        // You would actually get this data from your server
        var userDetails = {
            name: "Leo Cheung",
            email: "Leo.Cheung@uts.edu.au",
            phoneNo: "13632448800",
            dob: "19-07-1999"
        };

        document.getElementById('name').textContent = userDetails.name;
        document.getElementById('email').textContent = userDetails.email;
        document.getElementById('phoneNo').textContent = userDetails.phoneNo;
        document.getElementById('dob').textContent = userDetails.dob;
    </script>
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
        echo "</tr>";
      }
      
      // Close database connection
      mysqli_close($conn);
    ?>
  </table>
</body>
</html>
