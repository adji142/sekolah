<!-- CONTENT 
<div class="col-lg-8 col-md-8 col-sm-12 ">-->


	


	<!-- TULISAN POPULER 
	<?php $query = get_latest_posts(5); if ($query->num_rows() > 0) { ?>
		<h4 class="page-title mb-3">Tulisan Terbaru</h4>
		<?php foreach($query->result() as $row) { ?>
			<div class="shadow-sm rounded-0">	
				<div class="contentpad">		
					<div class="row">
						<div class="col-md-5">
							<img src="<?=base_url('media_library/posts/large/'.$row->post_image)?>"  alt="<?=$row->post_title?>">
						</div>
						<div class="col-md-7">
								<h5 class="card-title"><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><?=substr(strip_tags($row->post_title), 0, 35)?>...</a></h5>
								<div class="d-flex justify-content-between align-items-center mt-1">
									<small class="text-muted"><?=date('d/m/Y H:i', strtotime($row->created_at))?> WIB - <?=$row->post_author?></small>
								</div>
								<p class="card-text mb-0"><?=substr(strip_tags($row->post_content), 0, 160)?>...</p>
								<div class="readmore">
									<a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>">Read more</a>
								</div>
						</div>
					</div>
				</div>
			</div>
			<br>
		<?php } ?>
	<?php } ?>

	<!-- Photo Terbaru 
	<?php $query = get_albums(4); if ($query->num_rows() > 0) { ?>
		<h4 class="page-title mt-3 mb-3">Foto Terbaru</h4>
		<div class="row">
			<?php foreach($query->result() as $row) { ?>
				<div class="col-md-6 mb-3">
					<div class="shadow-sm">
						<img src="<?=base_url('media_library/albums/'.$row->album_cover)?>" class="ard-img rounded-0 img-fluid p-0" type ="button" onclick="photo_preview(<?=$row->id?>)">
						
						<div class="card-body ">
							<h6 class="card-title"><?=$row->album_title?></h6>
							<p class="card-text"><?=$row->album_description?></p>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>
	<?php } ?>

	<!-- Video Terbaru 
	<div class="container">
	<?php $query = get_videos(1); if ($query->num_rows() > 0) { ?>
	<h4 class="page-title mt-3 mb-3">Video Terbaru</h4>		
		<div class="row">
			<?php foreach($query->result() as $row) { ?>
				<div class="col-md-6 mb-3">
					<div class="shadow-sm">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?=$row->post_content?>" allowfullscreen></iframe>
						</div>
					</div>
				</div>
			<?php } ?>
		</div>	
	<?php } ?>

</div>-->


