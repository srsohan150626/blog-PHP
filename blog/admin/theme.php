<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>

  <div class="grid_10">
		
            <div class="box round first grid">
                <h2>Update Theme</h2>
               <div class="block copyblock"> 
                <?php
                if($_SERVER['REQUEST_METHOD']=='POST'){
                
                $theme=$_POST['theme'];

                $theme=mysqli_real_escape_string($db->link,$theme);
                    $query="UPDATE tbl_theme set theme='$theme' where id='1'" ;
                    $updated_row=$db->update($query);

                    if($updated_row){
                         echo "<span style='color:green;font-size:18px;'>Theme Updated Successfully.</span>";
                    }
                    else{
                         echo "<span style='color:red;font-size:18px;'>Theme not Updated!</span>";
                    }                
            }
                ?>
                <?php 
                $query="SELECT * from tbl_theme where id='1'";
                $theme=$db->select($query);
                while ($result=$theme->fetch_assoc()) {
                ?>
                 <form action="" method="post">
                    <table class="form">					
                        <tr>
                            <td>
                                <input<?php if($result['theme']=='default'){echo "checked" ;}?> type="radio" name="theme" value="default"/>Default
                           </td>
                        </tr> 
                        <tr>
                            <td>
                                <input <?php if($result['theme']=='green'){echo "checked";}?> type="radio" name="theme" value="green"/>Green
                           </td>
                        </tr> 
                        <tr>
                            <td>
                                <input <?php if($result['theme']=='red'){echo "checked";}?> type="radio" name="theme" value="red"/>Red
                           </td>
                        </tr> 
						<tr> 
                            <td>
                                
                                <input type="submit" name="submit" Value="Change" />
                            </td>
                        </tr>
                    </table>
               
                    </form>
                     <?php } ?>
                  </div>
            </div>
        </div>
         <?php include 'inc/footer.php'?>
