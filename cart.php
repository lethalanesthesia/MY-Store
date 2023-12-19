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
    <title>Drink Lab - Cart Details</title>
    <!-- ICON BROWSER TAB -->
    <link rel="shortcut icon" type="x-icon" href="./images/LUGO.png">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="style.css">
    <style>
        .cart_img{
    width: 80px;
    height: 80px;
    object-fit: contain;
}
    </style>
</head>
<body style="background-color: pink">
    <div class="container-fluid p-0">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: pink";>
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
      </ul>
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
    <h1 class="text-center">Drink Lab</h1>
    <h5><p class="text-center">"Mamamanhid ka sa sarap."</p></h5>
    <hr>
</div>

<!-- TABLE -->
<div class="container">
    <div class="row">
      <form action="" method="post">
        <table class="table table-bordered text-center">
            
                <!-- PHP CODE TO DISPLAY DYNAMIC DATA -->
                <?php

$get_ip_add = getIPAddress();
$total_price=0;
$cart_query="Select * from `cart_details` where ip_address='$get_ip_add'";
$result=mysqli_query($con,$cart_query);
$result_count=mysqli_num_rows($result);
if($result_count>0){
  echo  " <thead>
  <tr>
      <th>Product Title</th>
      <th>Product Image</th>
      <th>Quantity</th>
      <th>Total Price</th>
      <th>Remove</th>
      <th colspan='2'>Operations</th>
  </tr>
 </thead>
 <tbody>";

while($row=mysqli_fetch_array($result)){
  $product_id=$row['product_id'];
  $select_products="Select * from `products` where product_id='$product_id'";
  $result_products=mysqli_query($con,$select_products);
  while($row_product_price=mysqli_fetch_array($result_products)){
  $product_price=array($row_product_price['product_price']);  //[200]
  $price_table=$row_product_price['product_price'];
  $product_title=$row_product_price['product_title'];
  $product_image1=$row_product_price['product_image1'];
  $product_values=array_sum($product_price);  //[200]
  $total_price+=$product_values;  //[200]
?>
                <tr>
                    <td><?php echo $product_title ?></td>
                    <td><img src="./admin_area/product_images/<?php echo $product_image1 ?>" alt="" class="cart_img"></td>
                    <td><input type="text" name="quantity" class="form-input w-50"></td>
<?php
$get_ip_add = getIPAddress();
if(isset($_POST['update_cart'])){
  $quantities=$_POST['quantity'];
  $update_cart="update `cart_details` set quantity=$quantities where ip_address='$get_ip_add'";
  $result_products_quantity=mysqli_query($con,$update_cart);
  $total_price=$total_price*$quantities;
}
                    ?>
                    <td><?php echo $price_table ?>/-</td>
                    <td><input type="checkbox" name="removeitem[]" value="<?php echo $product_id  ?>"></td>
                    <td>
                        <input type="submit" value="Update Cart" class="btn btn-secondary px-3 py-2 text-light border-0 mx-3" name="update_cart">
                        <input type="submit" value="Remove Cart" class="btn btn-danger px-3 py-2 text-light border-0 mx-3" name="remove_cart">
                    </td>

                </tr>

                <?php }}}
                
                else{
                  
                  echo "<h1 class='text-center text-danger'>Cart is empty!</h1>";
                }
                  ?>
            </tbody>
        </table>
        <!-- SUBTOTAL -->
        <div class="d-flex mb-3">

<?php
$get_ip_add = getIPAddress();
$cart_query="Select * from `cart_details` where ip_address='$get_ip_add'";
$result=mysqli_query($con,$cart_query);
$result_count=mysqli_num_rows($result);
if($result_count>0){
  echo "<h4 class='px-3'>Subtotal: <strong class='text-danger'> $total_price /-</strong></h4>
  <input type='submit' value='Continue Shopping' class='btn btn-secondary px-3 py-2 text-light border-0 mx-3' name='continue_shopping'>
  <button class='btn btn-danger p-3 py-2 border-0'><a href='./users_area/checkout.php' class='text-light text-decoration-none'>Checkout</a></button>";
}else{
  echo "<input type='submit' value='Continue Shopping' class='btn btn-secondary px-3 py-2 text-light border-0 mx-3' name='continue_shopping'>";
}
if(isset($_POST['continue_shopping'])){
  echo "<script>window.open('index.php','_self')</script>";
}
?>


            
        </div>
    </div>
</div>
</form>
<!-- FUNCTIONS TO REMOVE ITEMS -->
<?php
function remove_cart_item(){
  global $con;
  if(isset($_POST['remove_cart'])){
    foreach($_POST['removeitem'] as $remove_id){
      echo $remove_id;
      $delete_query="Delete from `cart_details` where product_id=$remove_id";
      $run_delete=mysqli_query($con,$delete_query);
      if($run_delete){
        echo "<script>window.open('cart.php','_self')</script>";
      }
    }
  }
}
echo $remove_item=remove_cart_item();


?>

    <!-- INCLUDE FOOTER -->
    <?php
      include("./includes/footer.php") ?>
        </div>

    <script src="js/bootstrap.js"></script>
</body>
</html>