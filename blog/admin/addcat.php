﻿<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>
        <div class="grid_10">
		
            <div class="box round first grid">
                <h2>Add New Category</h2>
               <div class="block copyblock"> 
                <?php
                if($_SERVER['REQUEST_METHOD']=='POST'){
                
                $name=$_POST['name'];

                $name=mysqli_real_escape_string($db->link,$name);

                if(empty($name)){
                    echo "<span style='color:red;font-size:18px;'>Field must not be empty!</span>";
                }
                else{
                    $query="INSERT into tbl_category(name) VALUES('$name')";
                    $catinsert=$db->insert($query);

                    if($catinsert){
                         echo "<span style='color:green;font-size:18px;'>Category Inserted Successfully.</span>";
                    }
                    else{
                         echo "<span style='color:red;font-size:18px;'>Category not Inserted!</span>";
                    }
                }
                
            }
                ?>
                 <form action="" method="post">
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" name="name" placeholder="Enter Category Name..." class="medium" />
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <?php if ( Session::get('userRole')=='0'){?>
                                <input type="submit" name="submit" Value="Save" />
                            <?php }?>
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
         <?php include 'inc/footer.php'?>
