<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>
<?php 
    
    if(!isset($_GET['msgid']) || $_GET['msgid']==NULL){
        header("Location:inbox.php");
    }
    else{
        $id=$_GET['msgid'];
    }

?>
        <div class="grid_10">
		
            <div class="box round first grid">
                <h2>Reply Message</h2>

                <?php 
                if($_SERVER['REQUEST_METHOD']=='POST'){
                 $to=$fm->validation($_POST['toEmail']);
                 $from=$fm->validation($_POST['fromEmail']);
                 $Subject=$fm->validation($_POST['Subject']);
                 $Message=$fm->validation($_POST['Message']);

                 $sendemail=mail($to, $Subject, $Message,$from);

                 if ($sendemail) {
                     echo "<span style='color:green;font-size:18px;'>Email Send Successfully.</span>";
                 }
                 else{
                    echo "<span style='color:red;font-size:18px;'>your email not sent!</span>";
                 }

            }
               ?>
                <div class="block">               
                 <form action="" method="post">
                        <?php
                            $query="SELECT * from tbl_contact where id='$id'";
                            $msg=$db->select($query);

                            if($msg){
                               
                                while ($result=$msg->fetch_assoc()) {
                                 

                        ?>
                    <table class="form">
                       
                          <tr>
                            <td>
                                <label>To</label>
                            </td>
                            <td>
                                <input type="text" name="toEmail" readonly value="<?php echo $result['email'] ;?>"  class="medium" />
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <label>From</label>
                            </td>
                            <td>
                                <input type="text" name="fromEmail" placeholder="Enter your email address"  class="medium" />
                            </td>
                        </tr>
                          <tr>
                            <td>
                                <label>Subject</label>
                            </td>
                            <td>
                                <input type="text" name="Subject" placeholder="Enter Subject"  class="medium" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Message</label>
                            </td>
                            <td>
                                <textarea class="tinymce" name="Message"> 
                            
                                        
                                    </textarea>
                            </td>
                        </tr>

                       
						<tr>
                            <td></td>
                            <td>
                                <input type="submit" name="submit" Value="Send" />
                            </td>
                        </tr>
                    </table>
                <?php } } ?>
                    </form>
                </div>
            </div>
        </div>
     <?php include 'inc/footer.php'?>
<!-- Load TinyMCE -->
    <script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupTinyMCE();
            setDatePicker('date-picker');
            $('input[type="checkbox"]').fancybutton();
            $('input[type="radio"]').fancybutton();
        });
    </script>