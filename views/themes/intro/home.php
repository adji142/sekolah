<!-- news -->
	<div class="news">
		<div class="container">  
				<h2 class="heading-agileinfo">News & Events</h2>
			<div class="news-agileinfo"> 

				<?php $query = get_latest_posts(5); if ($query->num_rows() > 0) { ?>
					<?php foreach($query->result() as $row) { ?>
						<div class="news-w3row"> 
							<div class="wthree-news-grids">
								<div class="col-md-5 col-xs-5 datew3-agileits">
									<img src="<?=base_url('media_library/posts/large/'.$row->post_image)?>" class="img-responsive" alt="<?=$row->post_title?>">
								</div>
								<div class="col-md-7 col-xs-7 datew3-agileits-info ">
									<h5><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><?=$row->post_title?></a></h5>
									<h6><?=date('d/m/Y H:i', strtotime($row->created_at))?> WIB - <?=$row->post_author?></h6>
									<p><?=substr(strip_tags($row->post_content), 0, 200)?>...</p>
									<h6><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>">readmore</a></h6>
								</div>
								<div class="clearfix"> </div>
							</div>
							
						</div>
					<?php } ?>
				<?php } ?>

			</div>
		</div>
	</div>
	<!-- //news -->


	<!-- new gallery -->
	<div id="lab" class="w3ls-section gallery">
		<div class="container">
			<h3 class="heading-agileinfo">New Gallery</h3>

			<?php $query = get_albums(3); if ($query->num_rows() > 0) { ?>

			<div class="gallery-grids">
				<?php foreach($query->result() as $row) { ?>
				<div class="col-sm-4 col-xs-6 gallery-grid">
					<div class="grid effect-apollo"> 
						
							<img src="<?=base_url('media_library/albums/'.$row->album_cover)?>" alt=""/>
							<div class="figcaption">
								<p><?=$row->album_title?></p>
							</div>	
						
					</div>
				</div>
				<?php } ?>
			</div>

			<?php } ?>

			<script src="js/lightbox-plus-jquery.min.js"> </script>
		</div>
	</div>
	<!-- //new gallery -->


	
	<div class="container">
		<div class="grid_3 grid_5 wthree">
			<h3 class="heading-agileinfo">New Video</h3>
			<?php $query = get_videos(2); if ($query->num_rows() > 0) { ?>
				
				<?php foreach($query->result() as $row) { ?>
					<div class="col-md-6 w3-agileits">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="<?=$row->post_content?>" allowfullscreen></iframe>
						</div>						
					</div>
				<?php } ?>
				
			<?php } ?>
		</div>
	</div>






