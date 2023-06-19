<!DOCTYPE html>
<head>
    <title>
        RUSANGU UNIVERISTY CAFETERIA MANAGEMENT SYSTEM
    </title>

	<link rel="stylesheet" type="text/css" href="css/view.css">


</head>
    <body>
        <h1>AVAILABLE FOOD</h1>
        <br>
        <h2>CATEGORIES AVAILABLE</h2>
        <hr>
        <table>
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>DESCRIPTION</th>
            </tr>
            <?php
                $conn = mysqli_connect('localhost','root','','cafeteria');
                $sql = "SELECT * FROM categories";
                $result = $conn-> query($sql);

                if($result->num_rows > 0){
                    while($row = $result->fetch_assoc()){
                        echo "<tr><td>".$row['id']. "</td><td>".$row['name']. "</td><td>".$row['description']. "</td></tr>";
                    }

                }
                else{
                    echo"No Result";
                }
                $conn->close();
            ?>
        </table>
        <hr>
        <br><br><br><br>
        <h2>PRODUCTS AVAILABLE</h2>
        <hr>
        <table>
            <tr>
                <th>ID</th>
                <th>CATEGORY</th>
                <th>NAME</th>
                <th>DESCRIPTION</th>
                <th>PRICE</th>
                <th>STATUS</th>
                
            </tr>
            <?php
                $conn = mysqli_connect('localhost','root','','cafeteria');
                $sql = "SELECT * FROM products";
                $result = $conn-> query($sql);

                if($result->num_rows > 0){
                    while($row = $result->fetch_assoc()){
                        echo "<tr><td>".$row['id']. "</td><td>".$row['category_id']."</td><td>".$row['name']. "</td><td>".$row['description'].  "</td><td>".$row['price']. "</td><td>".$row['status']. "</td></tr>";
                    }

                }
                else{
                    echo"No Result";
                }
                $conn->close();
            ?>
        </table>
        <hr>
        <br><br><br><br>
        <center><a href="home.html" class="btn">BACK</a></center>
    </body>
</html>