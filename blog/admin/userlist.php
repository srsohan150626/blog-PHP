<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>User List</h2>

                <?php
                	if (isset($_GET['deluser']) ) {
                		# code...
                		$deluser=$_GET['deluser'];
                		$delquery="DELETE  from tbl_user where id='$deluser'";
                		$deldata=$db->delete($delquery);
          
                	if($deldata){
                         echo "<span style='color:green;font-size:18px;'>User Deleted Successfully.</span>";
                    }
                    else{
                         echo "<span style='color:red;font-size:18px;'>User not Deleted!</span>";
                    }
                }
                ?>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Details</th>
                            <th>Role</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$query="SELECT * from tbl_user order by id desc";
							$alluser=$db->select($query);

							if($alluser){
								$i=0;
								while ($result=$alluser->fetch_assoc()) {
									# code...
									$i++;

						?>
						<tr class="odd gradeX">
							<td><?php echo $i;?></td>
							<td><?php echo $result['name'];?></td>
                            <td><?php echo $result['username'];?></td>
                            <td><?php echo $result['email'];?></td>
                            <td><?php echo $fm->textShorten($result['details'], 30);?></td>
                            <td>
                                <?php 
                                
                                if($result['role']=='0'){
                                    echo "Admin";
                                } 
                                else if($result['role']=='1')
                                    echo "Author";
                                else
                                    echo "Editor";

                                ?>
                                    
                                </td>
							<td><a href="viewuser.php?userid=<?php echo $result['id'];?>">View</a> 
                                 <?php 
                    if (Session::get('userRole')=='0') { ?>
                                || <a onclick="return confirm('Are you sure want to Delete?!');" href="?deluser=<?php echo $result['id'];?>">Delete</a></td>
                            <?php } ?>
						</tr>
						<?php } } ?>	 
					</tbody>
				</table>
               </div>
            </div>
        </div>
         <?php include 'inc/footer.php'?>
<script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();

            $('.datatable').dataTable();
            setSidebarHeight();


        });
    </script>