<div class="col-md-3 col-xs-3 datew3-agileits">


<!-- Get Arsip -->
	<?php $query = get_archives(date('Y')); if ($query->num_rows() > 0) { ?>
		<h5>Arsip <?=date('Y')?></h5>
		<?php foreach($query->result() as $row) { ?>
			<a href="<?=site_url('arsip/'.date('Y').'/'.$row->code)?>">
				<?=bulan($row->code)?>
				<small><?=$row->count?></small>
			</a>
		<?php } ?>
	<?php } ?>
	<!--/Get Arsip -->

	

<!-- Get Anther Posts -->
			<?php $query = $post_type == 'post' ? get_related_posts($query->post_categories, _toInteger($this->uri->segment(2))) : get_another_pages(_toInteger($this->uri->segment(2)), 5); if ($query->num_rows() > 0) { ?>
				<h5><?=$post_type == 'post' ? 'Tulisan':'Halaman'?> Lainnya</h5>
				<?php foreach($query->result() as $row) { ?>
					
							<h5 class="card-title"><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><?=$row->post_title?></a></h5>
							
							
								<small class="text-muted"><?=date('d/m/Y H:i', strtotime($row->created_at))?> WIB - <?=$row->post_author?></small>
								
							
					
					
				<?php } ?>
			<?php } ?>
			</div>
<!-- /CONTENT -->

