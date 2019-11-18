<!-- CONTENT -->
<div class="col-lg-8 col-md-8 col-sm-12 ">
	
	<div class="shadow-sm">
		<div class="contentpad">
			<h5 class="page-title mb-3">SAMBUTAN <?=strtoupper(__session('_headmaster'))?></h5>
			<div class="card-body pb-0 pt-0">
				<p class="card-text"><?=get_opening_speech()?></p>
			</div>
		</div>
	</div>
	<br>
	<!-- Get Random Posts -->
	
	<div class="shadow-sm">
		<div class="contentpad">
			<h5 class="page-title mt-3 mb-3">Baca Juga</h5>
			<?php $query = get_another_pages(_toInteger($this->uri->segment(2)), 5); if ($query->num_rows() > 0) { ?>
			<?php foreach($query->result() as $row) { ?>
				<div class="shadow-sm ">	
				<div class="contentpad">		
					<div class="row">
						
							<div class="card-body p-3">
								<h5 class="card-title"><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><?=$row->post_title?></a></h5>
								<div class="d-flex justify-content-between align-items-center mt-1">
								</div>
								<p class="card-text mb-0"><?=substr(strip_tags($row->post_content), 0, 165)?>...</p>
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
		</div>
	</div>
	
</div>
<?php $this->load->view('themes/minty/sidebar')?>
