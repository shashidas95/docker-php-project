<?php 
    include_once('./includes/headerNav.php');
    include_once('./includes/restriction.php');

    //this will provide previous user value before updating 
    include "includes/config.php";
    $sql = "SELECT * FROM repair where user_id={$_GET['id']}";
    $result = $conn->query($sql);
    // output data of each row
    $row = $result->fetch_assoc();
    $_SESSION['previous_status'] = $row['status'];
    $conn->close();
 ?>
 <head>
     <style>
         .update{
             width:40%;
             height:60%;
             position:absolute;
             top:25%;
             left:29%;
             background-color:#9FE2BF;
             box-shadow:2px 2px 3px 2px grey;
             font-size:20px;
             font-weight:bold;
             text-align:center;
         }
         
     </style>
 </head>

 <div class="update">
     <br>
 <form action="<?php $_SERVER['PHP_SELF']; ?>" method ="POST">
 <label for="">Due Amount</label>
 <input type="number" name='amt' placeholder='optional'>
<br>
 <label for="">Returned Date</label>
<input type="date" name='date'>
<br>
    <label for="">Returned Status</label>
    <select id="status_update" name="status">
  <?php 
       if($_SESSION['previous_status']=='pending'){
           ?>
            <option value="pending" selected>Pending</option>
            <option value="repaired">Repaired</option>
     <?php  } else{?> 
                       <option value="pending">Pending</option>
            <option value="repaired" selected>Repaired</option>
            <?php } ?>
</select>
 <br> <br> 
<button class="update-btn" type="submit" name="update">Update</button>
</form>
 </div>




<?php
   if(isset($_POST['update'])){
    //below sql will update user details inside sql table when update is clicked
    include "includes/config.php";
    $sql1 = "UPDATE repair
             SET  
             status='{$_POST['status']}',
             return_date='{$_POST['date']}',
             due='{$_POST['amt']}'
             WHERE user_id={$_GET['id']} AND damage_type='{$_GET['dt']}' ";
    $conn->query($sql1);   
    
    $conn->close();
    header("Location:http://localhost/electronics_shop/admin/repair.php?succesfullyUpdated");
   }
?>