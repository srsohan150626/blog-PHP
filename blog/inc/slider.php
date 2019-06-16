<div class="slidersection templete clear">
        <div id="slider">
        	<?php 

        		
                    $query="SELECT * from tbl_slider order by id limit 5 ";
                    $getslider=$db->select($query);
                    if($getslider){
                    while ($result=$getslider->fetch_assoc()) {
                        # code...
                    
                
        	?>
            <a href="#">
            	<img src="admin/<?php echo $result['image'];?>" alt="<?php echo $result['image'];?>" title="<?php echo $result['title'];?>" />
            </a>
     <?php } } ?>     
        </div>

</div>