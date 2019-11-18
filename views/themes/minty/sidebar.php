<script type="text/javascript">
var page = 1;
var total_page = "<?=$total_page;?>";
$(document).ready(function() {
	if (parseInt(total_page) == page || parseInt(total_page) == 0) {
		$('.more-comments').remove();
	}
});
</script>
<div class="col-lg-4 col-md-4 col-sm-12 sidebar">
	<!-- mostviews -->
	<div class="shadow-sm">
		<div class="card-body">
		<?php $query = get_popular_posts(5); if ($query->num_rows() > 0) { ?>
			<h5 class="page-title">Most Views</h5>
			<?php foreach($query->result() as $row) { ?>
					<div class="fa fa-rocket readmore grs">
						<a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>">
							<?=substr(strip_tags($row->post_title), 0, 35)?>...
						</a>
					</div>
				<br>
				<br>
			<?php } ?>
		<?php } ?>
		</div>
	</div>
	<br>
	

	<!-- Get Anther Posts 
	<div class="shadow-sm">
		<div class="card-body">
			<?php $query = $post_type == 'post' ? get_related_posts($query->post_categories, _toInteger($this->uri->segment(2)),1) : get_another_pages(_toInteger($this->uri->segment(2)), 5);
			if ($query->num_rows() > 0) 
			{ ?>

				<h5 class="page-title"><?=$post_type == 'post' ? 'Tulisan':'Halaman' ?> Lainnya</h5>
					<?php foreach($query->result() as $row) 
					{ ?>
						<div class="fa fa-paper-plane readmore grs">
							<a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>">
								<?=substr(strip_tags($row->post_title), 0, 35)?>
							</a>
						</div>
						<br>
						<br>
					<?php } ?>

			<?php } ?>
		</div>
	</div>
	<br>
	-->
	

	<!-- linkeksternal  -->
	<div class="shadow-sm">
		<div class="card-body">
			<h5 class="page-title <?=!in_array($this->uri->segment(1), ['sambutan-kepala-sekolah', 'sambutan-rektor', 'sambutan-ketua', 'sambutan-direktur']) ? 'mt-3' : ''?>">Link Eksternal</h5>
			<?php $links = get_links(); if ($links->num_rows() > 0) { ?>
				<?php foreach($links->result() as $row) { ?>
					<div class="readmore grs">
					<i class="fa fa-globe" aria-hidden="true"></i> <a href="<?=$row->link_url?>" target="<?=$row->link_target?>"> <?=$row->link_title?></a>
					</div>
					<br>
				<?php } ?>
			<?php } ?>
		</div>
	</div>
	<br>
		
	
	<!-- Arsip  -->
	<div class="shadow-sm">
		<div class="card-body">
			<?php $query = get_archives(date('Y')); if ($query->num_rows() > 0) { ?>
				<h5 class="page-title">Arsip Berita</h5>
				<?php foreach($query->result() as $row) { ?>
					<div class="readmore grs">
						<i class="fa fa-folder-open" aria-hidden="true"></i> <a href="<?=site_url('arsip/'.date('Y').'/'.$row->code)?>">
						<?=bulan($row->code)?> <?=date('Y')?>
					</a>
					</div>
					<br>
				<?php } ?>
			<?php } ?>
		</div>
	</div>
	<br>


</div>
<!-- /CONTENT -->
