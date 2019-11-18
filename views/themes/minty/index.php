<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=isset($page_title) ? $page_title . ' | ' : ''?><?=__session('school_name')?></title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="//db.onlinewebfonts.com/c/7d53812c05da6f823fba7c90e8081aeb?family=Balloon+XBd+BT" rel="stylesheet" type="text/css"/>

	<script type="application/x-javascript">
				addEventListener("load", function () {
					setTimeout(hideURLbar, 0);
				}, false);

				function hideURLbar() {
					window.scrollTo(0, 1);
				}
			</script>
	

	<?=link_tag('assets/plugins/bootstrap-4/bootstrap.css')?>
	<?=link_tag('assets/css/font-awesome.min.css')?>
	<?=link_tag('assets/plugins/jquery.smartmenus/jquery.smartmenus.bootstrap-4.css')?>
	<?=link_tag('assets/plugins/jquery.smartmenus/sm-core.css')?>
	<?=link_tag('assets/plugins/jquery.smartmenus/sm-clean.css')?>
	<?=link_tag('assets/plugins/magnific-popup/magnific-popup.css')?>
	<?=link_tag('assets/css/loading.css')?>
	<?=link_tag('views/themes/minty/style.css')?>
	<?=link_tag('assets/plugins/slick/slick.css')?>
	<?=link_tag('assets/plugins/slick-theme.css')?>


	<script type="text/javascript">
		const _BASE_URL = '<?=base_url();?>';
		const _CURRENT_URL = '<?=current_url();?>';
		const _SCHOOL_LEVEL = '<?=__session('school_level');?>';
		const _ACADEMIC_YEAR = '<?=__session('_academic_year');?>';
		const _STUDENT = '<?=__session('_student');?>';
		const _IDENTITY_NUMBER = '<?=__session('_identity_number');?>';
		const _EMPLOYEE = '<?=__session('_employee');?>';
		const _HEADMASTER = '<?=__session('_headmaster');?>';
		const _MAJOR = '<?=__session('_major');?>';
		const _SUBJECT = '<?=__session('_subject');?>';
		const _RECAPTCHA_STATUS = '<?=(NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') ? 'true': 'false';?>'=='true';
	</script>
	<?php if (NULL !== __session('recaptcha_status') && __session('recaptcha_status') == 'enable') { ?>
		<script src="https://www.google.com/recaptcha/api.js?hl=id" async defer></script>
	<?php } ?>
	<script src="<?=base_url('assets/js/frontend.min.js')?>"></script>
</head>

<body>
	<!-- header -->
	<header>
		<!-- top bar -->
		<div class="top-bar">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-7 col-sm-12 col-xs-12">
						<div class="top-header">
							<img src="<?=base_url('media_library/images/' . __session('logo'))?>" class="mt-2 mr-4">
							<ul class="list-unstyled top-left mt-3">
								<li><h3 class="font-weight-bold brand"><?=strtoupper(__session('school_name'))?></h3></li>
								<li><?=__session('tagline')?></li>
							</ul>
						</div>
					</div>
					<div class="col-md-5 col-sm-12 col-xs-12 mt-3 ">
						<ul class="list-inline float-right top-right">
							<li class="list-inline-item pl-3 pr-0"><i class="fa fa-envelope"></i> </i> <?=__session('email');?></li>
							<li class="list-inline-item pl-3 pr-0"><i class="fa fa-phone"></i> <?=__session('phone');?></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- /topbar -->

		<!-- navigation menu -->
		<div class="menu-bar" data-toggle="sticky-menu">
			<div class="container">
				<nav class="navbar navbar-expand-lg ">
					<a class="navbar-brand" href="#"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="fa fa-align-justify text-white"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<ul id="main-menu" class="sm sm-clean">
							<li><a href="<?=base_url()?>"><i class="fa fa-home"></i></a></li>
							<?php
							$menus = get_menus();
							foreach ($menus as $menu) {
								echo '<li>';
								$url = $menu['menu_url'] == '#' ? $menu['menu_url'] : base_url() . $menu['menu_url'];
								if ($menu['menu_type'] == 'links') $url = $menu['menu_url'];
								echo '<a href="'. $url .'" target="'. $menu['menu_target'] .'">' . strtoupper($menu['menu_title']) . '</a>';
								$sub_nav = recursive_list($menu['children']);
								if ($sub_nav) echo '<ul>' . $sub_nav . '</ul>';
								echo '</li>';
							}?>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<!-- /navigation menu -->

		
		<?php if ( ! $this->uri->segment(1)) { ?>
			<!--  video profile 
	    	<div class="embed-responsive embed-responsive-16by9">
				<video autoplay="true" class="embed-responsive-item" src="media_library/video/profile.mp4" allowfullscreen></video>
			</div>-->

			<?php $query = get_videosp(1); if ($query->num_rows() > 0) { ?>
				<?php foreach($query->result() as $row) { ?>
					<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<?=$row->post_content?>?&autoplay=1" allowfullscreen></iframe>
					</div>		
				<?php } ?>
			<?php } ?>

			<!-- /video profile -->

			<!-- berita terbaru -->
			<div class="container">
			<div class="container col-lg-4 p-5">
				<h4 class="page-title mb-3">Berita Terbaru</h4>
			</div>
									
			
			    <div  class="row items-container">
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
			
			<!-- /berita terbaru -->
    	<?php } ?>
    	
	</header>
	<!-- /header -->

	<!-- content -->
	<section>
		<div class="container mt-2">
			<div class="row">
		
			<?php $this->load->view($content)?>
		</div>
	</div>
			
	</section>
	<!-- /content -->
	
	<!-- footer -->
	<footer>
		<div class="container-fluid primary-footer">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-xs-12 text-md-left mb-2 mt-2"><!--hubungi kami-->
						<h6 class="page-title">Hubungi Kami</h6>
						<p><?=__session('school_name')?> &sdot; <?=__session('tagline')?></p>
						<dl class="row">
							<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-map-marker"></span> Alamat</dt>
							<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('street_address')?></dd>
							<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-envelope"></span> Email</dt>
							<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('email')?></dd>
							<dt class="col-lg-4 col-md-4 col-sm-12"><span class="fa fa-phone"></span> Telepon</dt>
							<dd class="col-lg-8 col-md-8 col-sm-12"><?=__session('phone')?></dd>
							
						</dl>
					</div><!--/hubungi kami-->
					<!--<div class="col-md-3 col-xs-12 text-md-left mb-2 mt-2">tags
						<h6 class="page-title">Tags</h6>
						<div class="tag-content-block tag">
							<?php $query = get_tags(10); if ($query->num_rows() > 0) { ?>
								<?php foreach ($query->result() as $row) { ?>
									<a href="<?=site_url('tag/'.$row->slug)?>"><?=$row->tag?></a>
								<?php } ?>
							<?php } ?>
						</div>
					</div>/tags-->
					<div class="col-md-4 col-xs-12 text-md-left mb-2 mt-2"><!--link eksternal-->
						<h6 class="page-title">Link Eksternal</h6>
						<?php $links = get_links(); if ($links->num_rows() > 0) { ?>
							<?php foreach($links->result() as $row) { ?>
								<div class="readmore grs">
								<i class="fa fa-globe" aria-hidden="true"></i> <a href="<?=$row->link_url?>" target="<?=$row->link_target?>"> <?=$row->link_title?></a>
								</div>
								<br>
							<?php } ?>
						<?php } ?>
					</div><!--/link eksternal-->
					<div class="col-md-4 col-xs-12 text-md-left mb-2 mt-2"><!--ikuti kami-->
						<h6 class="page-title">Ikuti Kami</h6>
						<ul class="list-unstyled float-left">
							<?php if (NULL !== __session('facebook') && __session('facebook')) { ?>
								<li class="float-left"><a href="<?=__session('facebook')?>" title="Facebook"><i class="fa fa-facebook social-icon facebook" aria-hidden="true"></i></a></li>
							<?php } ?>
							<?php if (NULL !== __session('twitter') && __session('twitter')) { ?>
								<li class="float-left"><a href="<?=__session('facebook')?>" title="Twitter"><i class="fa fa-twitter social-icon twitter" aria-hidden="true"></i></a></li>
							<?php } ?>
							<?php if (NULL !== __session('instagram') && __session('instagram')) { ?>
								<li class="float-left"><a href="<?=__session('instagram')?>" title="Instagram"><i class="fa fa-instagram social-icon instagram" aria-hidden="true"></i></a></li>
							<?php } ?>
							<?php if (NULL !== __session('youtube') && __session('youtube')) { ?>
								<li class="float-left"><a href="<?=__session('youtube')?>" title="Instagram"><i class="fa fa-youtube social-icon youtube" aria-hidden="true"></i></a></li>
							<?php } ?>
						</ul>
					</div><!--/ikuti kami-->
				</div>
			</div>
		</div>
		<div class="container-fluid secondary-footer">
			<div class="container copyright">
				<div class="row pt-1 pb-1">
					<div class="col-md-6 col-xs-12 text-md-left text-center">
						<?=copyright(2019, base_url(), __session('school_name'))?>
					</div>
					<div class="col-md-6 col-xs-12 text-md-right text-center">
						Powered by <a href="<?=$this->config->item('website');?>" target="_blank"><?=$this->config->item('webmaster');?></a>
					</div>
				</div>
			</div>
		</div>

	</footer>
	<!-- /footer -->

	<div id="search_form">
		<form action="<?=site_url('hasil-pencarian')?>" method="POST">
			<input type="search_form" name="keyword" autocomplete="off" placeholder="Masukan kata kunci pencarian" />
			<button type="submit" class="btn btn-lg btn btn-outline-light rounded-0"><i class="fa fa-search"></i> CARI</button>
		</form>
	</div>
	<a href="javascript:" id="return-to-top" class="rounded-lg"><i class="fa fa-angle-double-up"></i></a>

	<script src="<?=base_url('assets/plugins/slick/slick.min.js')?>"></script>

	<script type="text/javascript">
		(function($) {	
	"use strict";	

	$('.items-container').slick({
		infinite: true,
		arrows: false,
		autoplay: true,
		slidesToShow: 3,
		slidesToScroll: 1,
		fade: false,
		dots: false,
		responsive: [
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 1,
					arrows: false
				}
			},
			{
				breakpoint: 525,
				settings: {
					slidesToShow: 1,
					arrows: false
				}
			}
		]
	});

	$('.items-container2').slick({
		infinite: true,
		arrows: false,
		autoplay: true,
		slidesToShow: 3,
		slidesToScroll: 1,
		fade: false,
		dots: false,
		responsive: [
			{
				breakpoint: 991,
				settings: {
					slidesToShow: 1,
					arrows: false
				}
			},
			{
				breakpoint: 525,
				settings: {
					slidesToShow: 1,
					arrows: false
				}
			}
		]
	});

	})(window.jQuery);

      </script> 
</body>
</html>
