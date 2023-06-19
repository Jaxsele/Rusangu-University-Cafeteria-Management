<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/report.css">
    <title>Rusangu University Cafe</title>
</head>
<body>
<h1>RUSANGU UNIVERISTY CAFETERIA</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="card mt-4">
                    <div class="card-header">
                        <h4>Check Your Orders </h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-7">
                                
                                <form action="" method="GET">
                                    <center><div class="input-group mb-3">
                                        <input type="text" name="search" required value="<?php if(isset($_GET['search'])){echo $_GET['search']; } ?>" class="form-control" placeholder="Enter Your Order Number">
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div></center>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-12">
                <div class="card mt-4">
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Reference NO.</th>
                                    <th>Total Amount</th>
                                    <th>Amount Tendered</th>
                                    <th>Order Number</th>
                                    <th>Date Created</th>
                                </tr>
                            </thead>
                            <tbody>
                              <?php
                                $con = mysqli_connect("localhost","root","","cafeteria");

                                if(isset($_GET['search']))
                                {
                                    $filtervalues = $_GET['search'];
                                    $query = "SELECT * FROM orders WHERE CONCAT(ref_no,total_amount,amount_tendered,order_number,date_created) LIKE '%$filtervalues%' ";
                                    $query_run = mysqli_query($con, $query);

                                    if(mysqli_num_rows($query_run) > 0)
                                    {
                                        foreach($query_run as $items)
                                        {
                                        ?>
                                            <tr>
                                                <td><?= $items['id']; ?></td>
                                                <td><?= $items['ref_no']; ?></td>
                                                <td><?= $items['total_amount']; ?></td>
                                                <td><?= $items['amount_tendered']; ?></td>
                                                <td><?= $items['order_number']; ?></td>
                                                <td><?= $items['date_created']; ?></td>
                                            </tr>
                                        <?php
                                        }
                                    }
                                    else
                                    {
                                        ?>
                                            <tr>
                                                <td colspan="4">No Record Found</td>
                                            </tr>
                                        <?php
                                    }

                                }
                              ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br>
    <center><span class="float:right"><a class="btn btn-primary btn-sm col-sm-1 float-right" href="home.php" id=""> <i class="fa fa-home"></i> Home</a></span></center>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>