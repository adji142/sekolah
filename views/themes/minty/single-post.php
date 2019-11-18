<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<script type="text/javascript">
var page = 1;
var total_page = "<?=$total_page;?>";
$(document).ready(function() {
	if (parseInt(total_page) == page || parseInt(total_page) == 0) {
		$('.more-comments').remove();
	}
});
function get_post_comments() {
	page++;
	var data = {
		page_number: page,
		comment_post_id: '<?=$this->uri->segment(2)?>'
	};
	if ( page <= parseInt(total_page) ) {
		$.post( _BASE_URL + 'public/post_comments/get_post_comments', data, function( response ) {
			var res = _H.StrToObject( response );
			var rows = res.comments;
			var str = '';
			for (var z in rows) {
				var row = rows[ z ];
				str += '<div class="card rounded-0 border border-secondary mb-3 post-comments">';
				str += '<div class="card-body">';
				str += row.comment_content;
				str += '</div>';
				str += '<div class="card-footer">';
				str += '<small class="text-muted float-right">';
				str += row.created_at.substr(8, 2) + '/' + row.created_at.substr(5, 2) + '/' + row.created_at.substr(0, 4);
				str += ' ' + row.created_at.substr(11, 5);
				str += ' - ' + row.comment_author;
				str += '</small>';
				str += '</div>';
				str += '</div>';
			}
			var elementId = $(".post-comments:last");
			$( str ).insertAfter( elementId );
			if ( page == parseInt(total_page) ) $('.more-comments').remove();
		});
	}
}
</script>
<!-- CONTENT -->
<div class="col-lg-8 col-md-8 col-sm-12 ">
	<div class="shadow-sm">

		<div class="contentpad">
			<h4 class="page-title"><?=$query->post_title?></h4>
			<small class="text-muted"><?=date('d/m/Y H:i', strtotime($query->created_at))?> - <?=$post_author?></small>
			<?php if ($post_type == 'post' && file_exists('./media_library/posts/large/'.$query->post_image)) { ?>
				<img src="<?=base_url('media_library/posts/large/'.$query->post_image)?>" class="card-img-top w-100">
			<?php } ?>

				<p class="card-text"><?=$query->post_content?></p>
		</div>

	</div>
	<br>

	<!--  Komentar-->
	<?php if ($post_comments->num_rows() > 0) { ?>
	<div class="">
		<h5 class="page-title mt-3 mb-3">Komentar</h5>
		<?php foreach($post_comments->result() as $row) { ?>
			<div class="shadow-sm">
				<div class="card-body">
					<p class="card-text"><?=strip_tags($row->comment_content)?></p>
					<small class="text-muted float-right"><?=date('d/m/Y H:i', strtotime($row->created_at))?> - <?=$row->comment_author?></small>
				</div>
			</div>
		<?php } ?>
		<div class="justify-content-between align-items-center float-right mb-3 w-100 more-comments">
			<button type="button" onclick="get_post_comments()" class="btn action-button"><i class="fa fa-refresh"></i> Komentar Lainnya</button>
		</div>
	</div>
		<br>
	<?php } ?>

	<!-- Form Comment -->
	<?php if (
		(
			$query->post_comment_status == 'open' &&
			filter_var(__session((string) 'comment_registration'), FILTER_VALIDATE_BOOLEAN) &&
			$this->auth->hasLogin()
			) ||
			(
				$query->post_comment_status == 'open' &&
				__session('comment_registration') == 'false'
				)
			) { ?>
			<div class="">
				<h5 class="page-title mt-3 mb-3">Komentari Tulisan Ini</h5>
				<div class="shadow-sm mb-3">
					<div class="card-body">
						<div class="form-group row mb-2">
							<label for="comment_author" class="col-sm-3 control-label">Nama Lengkap <span style="color: red">*</span></label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm" id="comment_author" name="comment_author">
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="comment_email" class="col-sm-3 control-label">Email <span style="color: red">*</span></label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm" id="comment_email" name="comment_email">
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="comment_url" class="col-sm-3 control-label">URL</label>
							<div class="col-sm-9">
								<input type="text" class="form-control form-control-sm" id="comment_url" name="comment_url">
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="comment_content" class="col-sm-3 control-label">Komentar <span style="color: red">*</span></label>
							<div class="col-sm-9">
								<textarea class="form-control form-control-sm" id="comment_content" name="comment_content" rows="4"></textarea>
							</div>
						</div>
						<?php if (NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') { ?>
							<div class="form-group row mb-2">
								<label class="col-sm-3 control-label"></label>
								<div class="col-sm-9">
									<div class="g-recaptcha" data-sitekey="<?=$recaptcha_site_key?>"></div>
								</div>
							</div>
						<?php } ?>
						<div class="form-group row mb-0">
							<div class="offset-sm-3 col-sm-9">
								<input type="hidden" name="comment_post_id" id="comment_post_id" value="<?=$this->uri->segment(2)?>">
								<button type="button" onclick="post_comments(); return false;" class="btn action-button"><i class="fa fa-send"></i> Submit</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<?php } ?>

	<!-- get another post -->
	<div class="shadow-sm">
		<div class="col-lg-5 p-2">
			<h4 class="page-title mb-3">Berita Terbaru</h4>
		</div>
		<div  class="row items-container2">
			<?php $query = get_latest_posts(5); if ($query->num_rows() > 0) { ?>
			    <?php $idx = 0; foreach($query->result() as $row) { ?>
			        <div class="item p-2">
			            <div class="card shadow-sm" >	
							<div class="contentpad">
								<div class="p-1">		
									<a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><img src="<?=base_url('media_library/posts/large/'.$row->post_image)?>"  alt="<?=$row->post_title?>"></a>
								</div>
								<div class="p-1" text-align="center">
									<h5 class="card-title"><a href="<?=site_url('read/'.$row->id.'/'.$row->post_slug)?>"><?=strip_tags($row->post_title)?></a></h5>
								</div>
							</div>
						</div>             	
			        </div>
			    <?php $idx++; } ?>
			<?php } ?>
		</div>
	</div>

</div>
<?php $this->load->view('themes/minty/sidebar')?>
