<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>

<?php 
    
    if(!isset($_GET['pageid']) || $_GET['pageid']==NULL){
        header("Location:index.php");
    }
    else{
        $id=$_GET['pageid'];
    }

?>
<style>
    
    .actiondel{margin-left: 10px;}
    .actiondel a{background: #f0f0f0 none repeat scroll ;
    border: 1px solid #ddd;
    color: #444;
    cursor: pointer;
    font-size: 20px;
    font-weight: normal;
    padding: 2px 10px; }

</style>
        <div class="grid_10">
		
            <div class="box round first grid">
                <h2>Edit Page</h2>

                <?php 
                if($_SERVER['REQUEST_METHOD']=='POST'){

                $name=mysqli_real_escape_string($db->link, $_POST['name']);
                $body=mysqli_real_escape_string($db->link, $_POST['body']);
              

                if($name=="" || $body==""){
                    echo "<span style='color:red;font-size:18px;'>Field must not be empty!</span>";
                }
                else{
                 $query="UPDATE tbl_page
                  set
                  name='$name',
                  body='$body'
                  where id='$id'" ;
                 $updated_row=$db->update($query);
                if ($updated_row) {
                 echo "<span style='color:green;font-size:18px;'>Page Updated Successfully.
                 </span>";
                }else {
                 echo "<span style='color:red;font-size:18px;'>Page not Updated !</span>";
                }
            }
            }
                ?>
                <div class="block">  
                        <?php 
                    $query="SELECT * from  tbl_page where id='$id'";
                    $pages=$db->select($query);
                    if($pages){
                        while ($result= $pages->fetch_assoc()) {
                            # code...

                        
                    
                ?>             
                 <form action="" method="post">
                    <table class="form">
                       
                        <tr>
                            <td>
                                <label>Name</label>
                            </td>
                            <td>
                                <input type="text" name="name" value="<?php echo $result['name'];?>" class="medium" />
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>Content</label>
                            </td>
                            <td>
                                <textarea class="tinymce" name="body">
                                    
                                    <?php echo $result['body'];?>
                                </textarea>
                            </td>
                        </tr>

                       
						<tr>
                            <td></td>
                            <td>
                                <?php if ( Session::get('userRole')=='0'){?>
                                <input type="submit" name="submit" Value="Update" />
                                <span class="actiondel"> <a onclick="return confirm('Are you sure want to Delete the Page?!');" href="deleltepage.php?delpage=<?php echo $result['id'];?>">Delete</a></span>
                            <?php } ?>
                            </td>
                        </tr>
                    </table>
                    </form>
                <?php } } ?>
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