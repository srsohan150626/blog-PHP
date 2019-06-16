<?php include 'inc/header.php'?>
<?php include 'inc/sidebar.php'?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Inbox</h2>
                <?php 
                if (isset($_GET['seenid'])) {
                	$seenid=$_GET['seenid'];
                $query="UPDATE tbl_contact
                		set status='1'
                		where id='$seenid'";
                       	# code...
                 $updated_row=$db->update($query);
                 if ($updated_row) {
                   echo "<span style='color:green;font-size:18px;'> Message sent in the seen box.</span>";

                 } else{
					echo "<span style='color:green;font-size:18px;'>Something went wrong!.</span>";

                 }
                }
                ?>
                <div class="block">        
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Name</th>
							<th>Email Id</th>
							<th>Message</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
							<?php
							$query="SELECT * from tbl_contact where status='0' order by id desc";
							$msg=$db->select($query);

							if($msg){
								$i=0;
								while ($result=$msg->fetch_assoc()) {
									# code...
									$i++;

						?>
						<tr class="odd gradeX">
							<td><?php echo $i;?></td>
							<td><?php echo $result['firstname'].' '.$result['lastname'];?></td>
							<td><?php echo $result['email'] ?></td>
							<td><?php echo $fm->textShorten($result['body']);?></td>
							<td><?php echo $fm->formateDate($result['Date']);?></td>
							<td>
								<a href="viewmsg.php?msgid=<?php echo $result['id'];?>">View</a> ||
								<a href="replymsg.php?msgid=<?php echo $result['id'];?>">Reply</a> ||
								<a onclick="return confirm('Are you sure want to Move?')"
								 href="?seenid=<?php echo $result['id'];?>">Seen</a>  							
							</td>
						</tr>
						<?php } } ?>
					</tbody>
				</table>
               </div>
            </div>
            <div class="box round first grid">
                <h2>Seen Message</h2>
                  <?php
                	if (isset($_GET['delid']) ) {
                		# code...
                		$delid=$_GET['delid'];
                		$delquery="DELETE  from tbl_contact where id='$delid'";
                		$deldata=$db->delete($delquery);
          
                	if($deldata){
                         echo "<span style='color:green;font-size:18px;'>Message Deleted Successfully.</span>";
                    }
                    else{
                         echo "<span style='color:red;font-size:18px;'>Message not Deleted!</span>";
                    }
                }
                ?>
                <div class="block">        
          <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Serial No.</th>
							<th>Name</th>
							<th>Email Id</th>
							<th>Message</th>
							<th>Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
							<?php
							$query="SELECT * from tbl_contact where status='1' order by id desc";
							$msg=$db->select($query);

							if($msg){
								$i=0;
								while ($result=$msg->fetch_assoc()) {
									# code...
									$i++;

						?>
						<tr class="odd gradeX">
							<td><?php echo $i;?></td>
							<td><?php echo $result['firstname'].' '.$result['lastname'];?></td>
							<td><?php echo $result['email'] ?></td>
							<td><?php echo $fm->textShorten($result['body']);?></td>
							<td><?php echo $fm->formateDate($result['Date']);?></td>
							<td>
								<a href="viewmsg.php?msgid=<?php echo $result['id'];?>">View</a> ||
								<a onclick="return confirm('Are you sure want to Delete?')"
								 href="?delid=<?php echo $result['id'];?>">Delete</a>   							
							</td>
						</tr>
						<?php } } ?>
					</tbody>
				</table>

               </div>
            </div>
        </div>
        <script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();

            $('.datatable').dataTable();
            setSidebarHeight();


        });
    </script>
        <?php include 'inc/footer.php'?>