<%-- 
    Document   : detail2
    Created on : May 14, 2023, 6:38:15 PM
    Author     : Leo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <body>
    <h2>User Details</h2>

    <label for="email">Email:</label><br>
    <input type="text" id="email" name="email"><br><br>
    <button onclick="fetchData()">Fetch Data</button>

    <h2>Results</h2>
    <div id="results"></div>

    <script>
      function fetchData() {
        var email = document.getElementById('email').value;
        fetch(`jdbc:derby://localhost:1527/user infor${email}`)
          .then(response => response.json())
          .then(data => {
            document.getElementById('results').innerText = JSON.stringify(data, null, 2);
          })
          .catch((error) => {
            console.error('Error:', error);
          });
      }
    </script>
  </body>
</html>

