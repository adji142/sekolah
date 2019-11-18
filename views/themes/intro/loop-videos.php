<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<script type="text/javascript">
	var page = 1;
	var total_page = "<?=$total_page;?>";
	$(document).ready(function() {
		if (parseInt(total_page) == page || parseInt(total_page) == 0) {
			$('.more-videos').remove();
		}
	});

	function get_videos() {
		page++;
		var data = {
			page_number: page
		};
		if ( page <= parseInt(total_page) ) {
			$.post( _BASE_URL + 'public/gallery_videos/get_videos', data, function( response ) {
				var res = _H.StrToObject( response );
				var rows = res.rows;
				var str = '';
				for (var z in rows) {
					var row = rows[ z ];
					str += '<div class="col-md-4 mb-3 videos">';
					str += '<div class="embed-responsive embed-responsive-16by9">';
					str += '<iframe class="embed-responsive-item" src="https:' + row.post_content + '" allowfullscreen></iframe>';
					str += '</div>';
					str += '</div>';
				}
				var el = $("div.videos:last");
				$( str ).insertAfter(el);
				if (page == parseInt(total_page)) $('.more-videos').remove();
			});
		}
	}
</script>

<div class="news">
	<div class="container ">
		<div class="col-md-8 col-xs-8 datew3-agileits">
	
			<div class="gallery-grids">
				<?php foreach($query->result() as $row) { ?>
					<div class="col-md-6 w3-agileits">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe class="embed-responsive-item" src="<?=$row->post_content?>" allowfullscreen></iframe>
						</div>						
					</div>
				<?php } ?>
			</div>

			<script src="js/lightbox-plus-jquery.min.js"> </script>
		</div>
	
<?php $this->load->view('themes/intro/sidebar')?>

<div class="clearfix"> </div>
