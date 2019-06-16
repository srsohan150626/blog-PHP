<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>
 <?php 
 if (!Session::get('userRole')=='0') {
    echo "<script>window.location='index.php';</script>";
}
?>
        <div class="grid_10">
		
            <div class="box round first grid">
                <h2>Add New User</h2>
               <div class="block copyblock"> 
                <?php
                if($_SERVER['REQUEST_METHOD']=='POST'){
                
                $username=$fm->validation($_POST['username']);
                $password=$fm->validation(md5($_POST['password']));
                $email=$fm->validation($_POST['email']);
                $role=$fm->validation($_POST['role']);

                $username=mysqli_real_escape_string($db->link,$username);
                $password=mysqli_real_escape_string($db->link,$password);
                $email=mysqli_real_escape_string($db->link,$email);
                $role=mysqli_real_escape_string($db->link,$role);

                if(empty($username) || empty($password) || empty($role) || empty($email)){
                    echo "<span style='color:red;font-size:18px;'>Field must not be empty!</span>";
                } else{

                $mailquery="SELECT * from tbl_user where email='$email' limit 1";
                $mailcheck=$db->select($mailquery);
                if($mailcheck != false){
                    echo "<span style='color:red;font-size:18px;'>Email Already exist!</span>";
                }

                else{
                    $query="INSERT into tbl_user(username,password,email,role) VALUES('$username','$password','$email','$role')";
                    $userinsert=$db->insert($query);

                    if($userinsert){
                         echo "<span style='color:green;font-size:18px;'>User Created Successfully.</span>";
                    }
                    else{
                         echo "<span style='color:red;font-size:18px;'>User not Created!</span>";
                    }
                }
                
            }
        }
                ?>
                 <form action="" method="post">
                    <table class="form">					
                        <tr>
                            <td>
                                <label>Username</label>
                            </td>
                            <td>
                                <input type="text" name="username" placeholder="Enter Username..." class="medium" />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="text" name="password" placeholder="Enter Password..." class="medium" />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <input type="text" name="email" placeholder="Enter user Email address..." class="medium" />
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <label>User Role</label>
                            </td>
                            <td>
                                <select id="select" name="role">
                                    <option>Select User Role</option>
                                    <option value="0">Admin</option>
                                    <option value="1">Author</option>
                                    <option value="2">Editor</option>
                                    
                                    
                                </select>
                            </td>
                        </tr>
                        <tr> 
                            <td>
                                <input type="submit" name="submit" Value="Create" />
                            </td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
        </div>
         <?php include 'inc/footer.php'?>
