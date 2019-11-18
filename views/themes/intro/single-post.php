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
<div class="news">
	<div class="container ">

				<div class="col-md-8 col-xs-8 datew3-agileits">
				<h3 class="card-title"><?=$query->post_title?></h3>
				<small class="text-muted float-right"><?=date('d/m/Y H:i', strtotime($query->created_at))?> - <?=$post_author?></small>
				
					<?php if ($post_type == 'post' && file_exists('./media_library/posts/large/'.$query->post_image)) { ?>
					<img src="<?=base_url('media_library/posts/large/'.$query->post_image)?>" class="img-responsive">
					<br>
					<p class="card-text"><?=$query->post_content?></p>
					<?php } ?>

				</div>
				
	



		
<?php $this->load->view('themes/intro/sidebar')?>

<div class="clearfix"> </div>
		