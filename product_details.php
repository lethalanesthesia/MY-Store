<!-- connect file -->
<?php
include('includes/connect.php');
include('functions/common_function.php');
session_start();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drink Lab E-Commerce Website</title>
    <!-- ICON BROWSER TAB -->
    <link rel="shortcut icon" type="x-icon" href="./images/LUGO.png">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
</head>
<body style="background-color: pink">
    <div class="container-fluid p-0">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: pink">
  <div class="container-fluid">
    <img src="./images/LOGOOO.png" alt="" class="logo">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.php">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="display_all.php">Products</a>
        </li>
        <?php
if(isset($_SESSION['username'])){
echo "<li class='nav-item'>
<a class='nav-link' href='./users_area/profile.php'>My Account</a>
</li>";
  }else{
    echo "<li class='nav-item'>
<a class='nav-link' href='./users_area/user_registration.php'>Register</a>
</li>";
  }
?>
        
        <li class="nav-item">
          <a class="nav-link" href="cart.php"><i class="fa-solid fa-cart-shopping"></i><sup><?php cart_item(); ?></sup></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Total Price: <?php total_cart_price()?>/-</a>
        </li>
      </ul>
      <form class="d-flex" role="search" action="search_product.php" method="get">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search_data" autocomplete="off">
        <input type="submit" value="Search" class="btn btn-outline-light" name="search_data_product">
      </form>
    </div>
  </div>
</nav>

<!-- CALLING CART FUNCTION -->
<?php
cart();
?>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <ul class="navbar-nav me-auto">
        <?php
        if(!isset($_SESSION['username'])){
          echo "<li class='nav-item'>
          <a class='nav-link' href='#'>Welcome Guest</a>
        </li>";
        }else{
          echo "<li class='nav-item'>
          <a class='nav-link' href='#'>Welcome ".$_SESSION['username']." !</a>
        </li>";
        }
if(!isset($_SESSION['username'])){
  echo "<li class='nav-item'>
  <a class='nav-link' href='./users_area/user_login.php'>Login</a>
</li>";
}else{
  echo "<li class='nav-item'>
  <a class='nav-link' href='./users_area/logout.php'>Logout</a>
</li>";
}

?>
    </ul>
</nav>

<div class="text-dark" style="background-color: pink">
    <hr>

<div class="row px-1 text-light">
    <div class="col-md-10">
<!--PRODUCTS-->
        <div class="row">
<!-- FETCHING PRODUCTS -->
    <?php
    // CALLING FUNCTION
    view_details();
get_unique_categories();
get_unique_brands();
    ?>
<!-- ROW END -->
</div>
<!-- COL END -->
</div>
    <div class="col-md-2 bg-dark p-0 mb-3">
        <!--Brands to be displayed -->
        <ul class="navbar-nav me-auto text-center">
            <li class="nav-item bg-danger">
                <a href="#" class="nav-link text-light"><h4>Delivery Brands</h4></a>
            </li>
            <?php
getbrands()
?>
<hr>
        </ul>

        <!--Categories to be displayed -->
        <ul class="navbar-nav me-auto text-center">
            <li class="nav-item bg-danger">
                <a href="#" class="nav-link text-light"><h4>Categories</h4></a>
            </li>

            <?php
getcategories();
?>

        </ul>
<hr>
      </div>
    </div>
    <!-- INCLUDE FOOTER -->
    <?php
      include("./includes/footer.php") ?>
        </div>

    <script src="js/bootstrap.js"></script>
</body>
</html>