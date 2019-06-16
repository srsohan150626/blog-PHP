<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Category List</h2>

                <?php
                	if (isset($_GET['delcat']) ) {
                		# code...
                		$delid=$_GET['delcat'];
                		$delquery="DELETE  from tbl_category where id='$delid'";
                		$deldata=$db->delete($delquery);
          
                	if($deldata){
                         echo "<span style='color:green;font-size:18px;'>Category Deleted Successfully.</span>";
                    }
                    else{
                         echo "<span style='color:red;font-size:18px;'>Category not Deleted!</span>";
                    }
                }
                ?>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Category Name</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
							$query="SELECT * from tbl_category order by id desc";
							$category=$db->select($query);

							if($category){
								$i=0;
								while ($result=$category->fetch_assoc()) {
									# code...
									$i++;

						?>
						<tr class="odd gradeX">
							<td><?php echo $i;?></td>
							<td><?php echo $result['name'];?></td>
							<td>
                                <?php if (Session::get('userRole')=='0'|| Session::get('userRole')=='2'){?>
                                <a href="editcat.php?catid=<?php echo $result['id'];?>">Edit</a> <?php } ?>
                               <?php if (Session::get('userRole')=='0'){?>
                                || <a onclick="return confirm('Are you sure want to Delete?!');" href="?delcat=<?php echo $result['id'];?>">Delete</a>
                            <?php } ?>
                            </td>
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