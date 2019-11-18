<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<section class="sidebar">
	<ul class="sidebar-menu" data-widget="tree">

		<?php if (in_array('dashboard', __session('user_privileges'))) { ?>
			<li class="<?=isset($dashboard) ? 'active':'';?>">
				<a href="<?=site_url('dashboard');?>">
					<i class="fa fa-dashboard"></i> <span>BERANDA</span>
				</a>
			</li>
		<?php } ?>

		<li>
			<a href="<?=base_url();?>" target="_blank">
				<i class="fa fa-rocket"></i> <span>LIHAT SITUS</span>
			</a>
		</li>

		<!-- @namespace Employee Menu -->
		<?php if (__session('user_type') === 'employee' && in_array('employee_profile', __session('user_privileges'))) { ?>
			<li class="<?=isset($employee_profile) ? 'active':'';?>">
				<a href="<?=site_url('employee_profile');?>">
					<i class="fa fa-user"></i> <span>PROFIL</span>
				</a>
			</li>
			<li class="<?=isset($posts) ? 'active':'';?>">
				<a href="<?=site_url('posts');?>">
					<i class="fa fa-edit"></i> <span>TULISAN</span>
				</a>
			</li>
		<?php } ?>

		<!-- @namespace Student Menu -->
		<?php if (__session('user_type') === 'student' && in_array('student_profile', __session('user_privileges'))) { ?>
			<li class="<?=isset($student_profile) ? 'active':'';?>">
				<a href="<?=site_url('student_profile');?>">
					<i class="fa fa-edit"></i> <span>PROFIL</span>
				</a>
			</li>
			<li class="<?=isset($achievements) ? 'active':'';?>">
				<a href="<?=site_url('achievements');?>">
					<i class="fa fa-trophy"></i> <span>PRESTASI</span>
				</a>
			</li>
			<li class="<?=isset($scholarships) ? 'active':'';?>">
				<a href="<?=site_url('scholarships');?>">
					<i class="fa fa-money"></i> <span>BEASISWA</span>
				</a>
			</li>
			<li class="<?=isset($posts) ? 'active':'';?>">
				<a href="<?=site_url('posts');?>">
					<i class="fa fa-edit"></i> <span>TULISAN</span>
				</a>
			</li>
		<?php } ?>

		<!-- @namespace Administrator Menu -->
		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<?php if (in_array('blog', __session('user_privileges'))) { ?>
				<li class="treeview <?=isset($blog) ? 'active':'';?>">
					<a href="#">
						<i class="fa fa-edit"></i> <span>BLOG</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li <?=isset($image_sliders) ? 'class="active"':'';?>><a href="<?=site_url('blog/image_sliders');?>"><i class="fa fa-sign-out"></i> Gambar Slide</a></li>
						<li <?=isset($messages) ? 'class="active"':'';?>><a href="<?=site_url('blog/messages');?>"><i class="fa fa-sign-out"></i> Pesan Masuk</a></li>
						<li <?=isset($links) ? 'class="active"':'';?>><a href="<?=site_url('blog/links');?>"><i class="fa fa-sign-out"></i> Tautan</a></li>
						<li <?=isset($pages) ? 'class="active"':'';?>><a href="<?=site_url('blog/pages');?>"><i class="fa fa-sign-out"></i> Halaman</a></li>
						<li class="treeview <?=isset($posts) ? 'active':'';?>">
							<a href="#"><i class="fa fa-sign-out"></i> Tulisan <i class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li <?=isset($all_posts) ? 'class="active"':'';?>><a href="<?=site_url('blog/posts');?>"><i class="fa fa-sign-out"></i> Semua Tulisan</a></li>
								<li <?=isset($post_create) ? 'class="active"':'';?>><a href="<?=site_url('blog/posts/create');?>"><i class="fa fa-sign-out"></i> Tambah Baru</a></li>
								<li <?=isset($post_categories) ? 'class="active"':'';?>><a href="<?=site_url('blog/post_categories');?>"><i class="fa fa-sign-out"></i> Kategori Tulisan</a></li>
								<li <?=isset($post_comments) ? 'class="active"':'';?>><a href="<?=site_url('blog/post_comments');?>"><i class="fa fa-sign-out"></i> Komentar</a></li>
								<li <?=isset($tags) ? 'class="active"':'';?>><a href="<?=site_url('blog/tags');?>"><i class="fa fa-sign-out"></i> Tags</a></li>
							</ul>
						</li>
						<li <?=isset($videosp) ? 'class="active"':'';?>><a href="<?=site_url('blog/videosp');?>"><i class="fa fa-sign-out"></i> Video Profile</a></li>
						<li <?=isset($social_account_settings) ? 'class="active"':'';?>><a href="<?=site_url('blog/social_account');?>"><i class="fa fa-sign-out"></i> Jejaring Sosial</a></li>
					</ul>
				</li>
			<?php } ?>
		<?php } ?>

		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<?php if (in_array('plugins', __session('user_privileges'))) { ?>
				<li class="treeview <?=isset($plugins) ? 'active':'';?>">
					<a href="#">
						<i class="fa fa-plug"></i> <span>PLUGINS</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li <?=isset($banners) ? 'class="active"':'';?>><a href="<?=site_url('plugins/banners');?>"><i class="fa fa-sign-out"></i> Iklan</a></li>
						<li class="treeview <?=isset($pollings) ? 'active':'';?>">
							<a href="#"><i class="fa fa-sign-out"></i> Jajak Pendapat <i class="fa fa-angle-left pull-right"></i></a>
							<ul class="treeview-menu">
								<li <?=isset($questions) ? 'class="active"':'';?>><a href="<?=site_url('plugins/questions');?>"><i class="fa fa-sign-out"></i> Pertanyaan</a></li>
								<li <?=isset($answers) ? 'class="active"':'';?>><a href="<?=site_url('plugins/answers');?>"><i class="fa fa-sign-out"></i> Jawaban</a></li>
							</ul>
						</li>
					</ul>
				</li>
			<?php } ?>
		<?php } ?>

		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<?php if (in_array('media', __session('user_privileges'))) { ?>
				<li class="treeview <?=isset($media) ? 'active':'';?>">
					<a href="#">
						<i class="fa fa-upload"></i> <span>MEDIA</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li <?=isset($files) ? 'class="active"':'';?>><a href="<?=site_url('media/files');?>"><i class="fa fa-sign-out"></i> File</a></li>
						<li <?=isset($file_categories) ? 'class="active"':'';?>><a href="<?=site_url('media/file_categories');?>"><i class="fa fa-sign-out"></i> Kategori File</a></li>
						<li <?=isset($albums) ? 'class="active"':'';?>><a href="<?=site_url('media/albums');?>"><i class="fa fa-sign-out"></i> Album Foto</a></li>
						<li <?=isset($videos) ? 'class="active"':'';?>><a href="<?=site_url('media/videos');?>"><i class="fa fa-sign-out"></i> Video</a></li>	
					</ul>
				</li>
			<?php } ?>
		<?php } ?>

		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<?php if (in_array('appearance', __session('user_privileges'))) { ?>
				<li class="treeview <?=isset($appearance) ? 'active':'';?>">
					<a href="#">
						<i class="fa fa-paint-brush"></i> <span>TAMPILAN</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li <?=isset($menus) ? 'class="active"':'';?>><a href="<?=site_url('appearance/menus');?>"><i class="fa fa-sign-out"></i> Menu</a></li>
						<li <?=isset($themes) ? 'class="active"':'';?>><a href="<?=site_url('appearance/themes');?>"><i class="fa fa-sign-out"></i> Tema</a></li>
					</ul>
				</li>
			<?php } ?>
		<?php } ?>

		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<?php if (in_array('users', __session('user_privileges'))) { ?>
				<li class="treeview <?=isset($users) ? 'active':'';?>">
					<a href="#">
						<i class="fa fa-users"></i> <span>PENGGUNA</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<?php if (__session('user_type') == 'super_user') { ?>
							<li <?=isset($administrator) ? 'class="active"':'';?>><a href="<?=site_url('users/administrator');?>"><i class="fa fa-sign-out"></i> Administrator</a></li>
						<?php } ?>
						<li <?=isset($modules) ? 'class="active"':'';?>><a href="<?=site_url('users/modules');?>"><i class="fa fa-sign-out"></i> Daftar Modul</a></li>
						<li <?=isset($user_groups) ? 'class="active"':'';?>><a href="<?=site_url('users/user_groups');?>"><i class="fa fa-sign-out"></i> Grup Pengguna</a></li>
						<li <?=isset($user_privileges) ? 'class="active"':'';?>><a href="<?=site_url('users/user_privileges');?>"><i class="fa fa-sign-out"></i> Hak Akses</a></li>
					</ul>
				</li>
			<?php } ?>
		<?php } ?>

		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<?php if (in_array('settings', __session('user_privileges'))) { ?>
				<li class="treeview <?=isset($settings) ? 'active':'';?>">
					<a href="#">
						<i class="fa fa-wrench"></i> <span>PENGATURAN</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu">
						<li <?=isset($media_settings) ? 'class="active"':'';?>><a href="<?=site_url('settings/media');?>"><i class="fa fa-sign-out"></i> Media</a></li>
						<li <?=isset($writing_settings) ? 'class="active"':'';?>><a href="<?=site_url('settings/writing');?>"><i class="fa fa-sign-out"></i> Menulis</a></li>
						<li <?=isset($reading_settings) ? 'class="active"':'';?>><a href="<?=site_url('settings/reading');?>"><i class="fa fa-sign-out"></i> Membaca</a></li>
						<li <?=isset($school_profile_settings) ? 'class="active"':'';?>><a href="<?=site_url('settings/school_profile');?>"><i class="fa fa-sign-out"></i> Profil <?=__session('school_level') >= 5 ? 'Kampus' : 'Sekolah'?></a></li>
						<li <?=isset($general_settings) ? 'class="active"':'';?>><a href="<?=site_url('settings/general');?>"><i class="fa fa-sign-out"></i> Umum</a></li>
					</ul>
				</li>
			<?php } ?>
		<?php } ?>

		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<?php if (in_array('maintenance', __session('user_privileges'))) { ?>
				<li class="treeview">
					<a href="#">
						<i class="fa fa-medkit"></i> <span>PEMELIHARAAN</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
					<ul class="treeview-menu" style="margin-bottom: 20px">
						<li><a href="<?=site_url('maintenance/backup_database');?>"><i class="fa fa-database"></i> Backup Database</a></li>
						<li><a href="<?=site_url('maintenance/backup_apps');?>"><i class="fa fa-download"></i> Backup Apps</a></li>
					</ul>
				</li>
			<?php } ?>
		<?php } ?>

		<?php if (__session('user_type') === 'super_user' || __session('user_type') === 'administrator') { ?>
			<li class="profile-menu">
				<a href="<?=site_url('profile');?>">
					<i class="fa fa-power-off"></i> <span>UBAH PROFIL</span>
				</a>
			</li>
		<?php } ?>

		<li class="change-password-menu">
			<a href="<?=site_url('change_password');?>">
				<i class="fa fa-power-off"></i> <span>UBAH KATA SANDI</span>
			</a>
		</li>

		<li class="power-off-menu">
			<a href="<?=site_url('logout');?>">
				<i class="fa fa-power-off"></i> <span>KELUAR</span>
			</a>
		</li>

	</ul>
	<br>
</section>
