<div class="col-lg-4 col-md-4 col-sm-12 sidebar">
	<!-- Sambutan Kepala Sekolah  -->
	<div class="shadow-sm">
		<?php if ( ! in_array($this->uri->segment(1), ['sambutan-kepala-sekolah', 'sambutan-rektor', 'sambutan-ketua', 'sambutan-direktur'])) { ?>
			<img src="<?=base_url('media_library/images/').__session('headmaster_photo');?>" class="card-img-top rounded-0">
			<div class="card-body">
				<h5 class="card-title text-center text-uppercase"><?=__session('headmaster')?></h5>
				<p class="card-text text-center mt-0 text-muted">- <?=__session('_headmaster')?> -</p>
				<p class="card-text text-justify"><?=word_limiter(strip_tags(get_opening_speech()), 20);?></p>
			</div>
			<div class="card-footer text-center">
				<small class="text-muted text-uppercase"><a href="<?=site_url(opening_speech_route());?>">Selengkapnya</a></small>
			</div>
		<?php } ?>
	</div>
	<br>

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
