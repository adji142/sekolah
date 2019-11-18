<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=isset($page_title) ? $page_title . ' | ' : ''?><?=__session('school_name')?></title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="keywords" content="<?=__session('meta_keywords');?>"/>
	<meta name="description" content="<?=__session('meta_description');?>"/>
	<meta name="subject" content="Situs Pendidikan">
	<meta name="copyright" content="<?=__session('school_name')?>">
	<meta name="language" content="Indonesia">
	<meta name="robots" content="index,follow" />
	<meta name="revised" content="Sunday, July 18th, 2010, 5:15 pm" />
	<meta name="Classification" content="Education">
	<meta name="author" content="Anton Sofyan, 4ntonsofyan@gmail.com">
	<meta name="designer" content="Anton Sofyan, 4ntonsofyan@gmail.com">
	<meta name="reply-to" content="4ntonsofyan@gmail.com">
	<meta name="owner" content="Anton Sofyan">
	<meta name="url" content="https://www.sekolahku.web.id">
	<meta name="identifier-URL" content="https://www.sekolahku.web.id">
	<meta name="category" content="Admission, Education">
	<meta name="coverage" content="Worldwide">
	<meta name="distribution" content="Global">
	<meta name="rating" content="General">
	<meta name="revisit-after" content="7 days">
	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Copyright" content="<?=__session('school_name');?>" />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta name="revisit-after" content="7" />
	<meta name="webcrawlers" content="all" />
	<meta name="rating" content="general" />
	<meta name="spiders" content="all" />
	<meta itemprop="name" content="<?=__session('school_name');?>" />
	<meta itemprop="description" content="<?=__session('meta_description');?>" />
	<meta itemprop="image" content="<?=base_url('media_library/images/'. __session('logo'));?>" />
	<meta name="csrf-token" content="<?=__session('csrf_token')?>">
	<link rel="icon" href="<?=base_url('media_library/images/'.__session('favicon'));?>">
	<link rel="alternate" type="application/rss+xml" title="<?=__session('school_name');?> Feed" href="<?=base_url('feed')?>" />
	

			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="keywords" content="Instruction Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
			Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
			<script type="application/x-javascript">
				addEventListener("load", function () {
					setTimeout(hideURLbar, 0);
				}, false);

				function hideURLbar() {
					window.scrollTo(0, 1);
				}
			</script>
			<?=link_tag('assets/iwf/css/bootstrap.css')?>
			<?=link_tag('assets/iwf/css/style.css')?>
			<?=link_tag('assets/iwf/css/owl.carousel.css')?>
			<?=link_tag('assets/iwf/css/owl.theme.css')?>
			<?=link_tag('assets/iwf/css/font-awesome.css')?>
			<?=link_tag('//fonts.googleapis.com/css?family=Work+Sans:200,300,400,500,600,700" rel="stylesheet')?>

			



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
	<div class="header">
	<div class="agileits_top_menu">
		<div class="w3l_header_left">
				<ul>
					<li><i class="fa fa-home" aria-hidden="true"></i><a href="<?=base_url()?>">Home</a></li>
					<li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:<?=__session('email')?>"><?=__session('email')?></a></li>
				</ul>
			</div>
			<div class="w3l_header_right">
				<div class="w3ls-social-icons text-left">
					<?php if (NULL !== __session('facebook') && __session('facebook')) { ?>
						<a class="facebook" href="<?=__session('facebook')?>"><i class="fa fa-facebook"></i></a>
					<?php } ?>
					<?php if (NULL !== __session('twitter') && __session('twitter')) { ?>
						<a class="twitter" href="<?=__session('facebook')?>"><i class="fa fa-twitter"></i></a>
					<?php } ?>
					<?php if (NULL !== __session('instagram') && __session('instagram')) { ?>
						<a class="instagram" href="<?=__session('instagram')?>"><i class="fa fa-instagra"></i></a>
					<?php } ?>
					<?php if (NULL !== __session('youtube') && __session('youtube')) { ?>
						<a class="youtube" href="<?=__session('youtube')?>"><i class="fa fa-youtube"></i></a>
					<?php } ?>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<div class="content white agile-info">
			<nav class="navbar navbar-default" role="navigation">
				<div class="container">
					<div class="navbar-header">
						<a class="navbar-brand" href="<?=base_url()?>">
							<img src="<?=base_url('media_library/images/' . __session('logo'))?>" width="70" height="70" class="mt-2 mr-4 mb-3">
						</a>
					</div>
					<!--/.navbar-header-->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<nav class="link-effect-2" id="link-effect-2">
							<ul class="nav navbar-nav">
									<a class="navbar-brand" href="#"></a>

								<li><i class="effect-3"></i></li>
								<?php
								$menus = get_menus();
								foreach ($menus as $menu) {
									echo '<li>';
									$url = $menu['menu_url'] == '#' ? $menu['menu_url'] : base_url() . $menu['menu_url'];
									if ($menu['menu_type'] == 'links') $url = $menu['menu_url'];
									echo '<a href="'. $url .'" target="'. $menu['menu_target'] .'"class="dropdown-toggle effect-3" data-toggle="dropdown">' . strtoupper($menu['menu_title']) . '</a>';
									$sub_nav = recursive_list($menu['children']);
									if ($sub_nav) echo '<ul class="dropdown-menu">' . $sub_nav . '</ul>';
									echo '</li>';
								}?>

							</ul>
						</nav>
					</div>
					<!--/.navbar-collapse-->
					<!--/.navbar-->
				</div>
			</nav>
		</div>
	</div>
	<!--/header-->

	
	<!-- banner -->
	<?php if ( ! $this->uri->segment(1)) { ?>
		<div id="carousel">
            <div id="header-carousel" class="owl-carousel owl-theme">

            <?php $query = get_image_sliders(); if ($query->num_rows() > 0) { ?>
               <?php $idx = 0; foreach($query->result() as $row) { ?>
               <div class="item">
               	
                 <img src="<?=base_url('media_library/image_sliders/'.$row->image);?>" class="img-fluid w-100">  
                    
                  <div class="carousel-text">
                     <div class="line">
                        <div class="col-md-4">
                           <p>
                           	<?=$row->caption;?>
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
               <?php $idx++; } ?>
            <?php } ?>
  
            </div>

        	<div class="stopper">
            <div id="q-carousel" class="owl-carousel owl-theme">
            	<?php $query = get_quotes(); if ($query->num_rows() > 0) { ?>
               		<?php $idx = 0; foreach($query->result() as $row) { ?>

                    <div class="item">
                    	 <div class="carousel-q">
                     		<div class="line">  
                     			<div class="col-md-4">   	
                    			<h4><?=$row->quote?></h4>
                	 			</div>
                	 			<div class="col-md-4">   	
                    			<h4><?=$row->quote_by?></h4>
                	 			</div>
               		 		</div>
               			</div>
                    </div>       	

                    <?php $idx++; } ?> 
           		<?php } ?>
            </div>
        	</div>




        </div>
     	
	<?php } ?>
	<!--//banner -->

	









	<!-- Content-->
	<section>
				<?php $this->load->view($content)?>
	</section>
	<!-- /Content-->





	<!-- footer -->
	<div class="footer_top_agileits">
		<div class="container">
			<div class="col-md-4 footer_grid">
				<h3>Tags</h3>
				
					<?php $query = get_tags(10); if ($query->num_rows() > 0) { ?>
						<ul class="footer_grid_list">
						<?php foreach ($query->result() as $row) { ?>
							
							<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
							<a href="<?=site_url('tag/'.$row->slug)?>"><?=$row->tag?></a>
							</li>
							
						<?php } ?>
						</ul>
					<?php } ?>		
			</div>

			<div class="col-md-4 footer_grid">
				<h3>Link Eksternal</h3>
				<ul class="footer_grid_list">
					<?php $links = get_links(); if ($links->num_rows() > 0) { ?>
						<?php foreach($links->result() as $row) { ?>
					<li><i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						<a href="<?=$row->link_url?>" data-toggle="modal" target="<?=$row->link_target?>"><?=$row->link_title?></a>
					</li>
						<?php } ?>
					<?php } ?>
				</ul>
			</div>

			<!--smaitinfo-->
			<div class="col-md-4 footer_grid">
				<img src="<?=base_url('media_library/images/' . __session('logo'))?>">
				<p><?=__session('street_address')?></p>
				<ul class="address">
					<li><i class="fa fa-globe" aria-hidden="true"></i><?=__session('website')?></li>
					<li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:<?=__session('email')?>"><?=__session('email')?></a></li>
					<li><i class="fa fa-phone" aria-hidden="true"></i><?=__session('phone')?></li>
				</ul>
			</div>
			<!--/smaitinfo-->

			<div class="clearfix"> </div>
		</div>
	</div>
	<div class="footer_w3ls">
		<div class="container">
					<div class="footer_bottom1">
						<p>© 2018 Instruction. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
					</div>
		</div>
	</div>
	<!-- //footer -->
	








	<a href="#home" class="scroll" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- js -->
	<script type="text/javascript" src="<?=base_url('assets/iwf/js/jquery-2.1.4.min.js')?>"></script>

	<script type="text/javascript" src="<?=base_url('assets/iwf/js/bootstrap.js')?>"></script>
	<!-- stats -->
	<script src="<?=base_url('assets/iwf/js/jquery.waypoints.min.js')?>"></script>
	<script src="<?=base_url('assets/iwf/js/jquery.countup.js')?>"></script>
	<script>
		$('.counter').countUp();
	</script>
	<!-- //stats -->
	<!-- owl carousel -->
	<script src="<?=base_url('assets/iwf/js/owl.carousel.js')?>"></script>
	<script type="text/javascript">
         jQuery(document).ready(function($) {  
            var owl = $('#header-carousel');
            owl.owlCarousel({
              nav: false,
              dots: false,
              items: 1,
              loop: true,
              navText: ["&#xf007","&#xf006"],
              autoplay: true,
              autoplayTimeout: 4000
           });
           var owl = $('#q-carousel');
           owl.owlCarousel({
              nav: false,
              dots: false,
              items: 1,
              loop: true,
              navText: ["&#xf007","&#xf006"],
              autoplay: true,
              autoplayTimeout: 3500
           });
         });	
          
      </script> 
	<!-- //owl carousel -->

</body>
</html>
