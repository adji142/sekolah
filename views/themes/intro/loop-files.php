<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<script type="text/javascript">
	var page = 1;
	var total_page = "<?=$total_page;?>";
	console.log(total_page);
	$(document).ready(function() {
		if (parseInt(total_page) == page || parseInt(total_page) == 0) {
			$('.more-files').remove();
		}
	});
	function get_files() {
		page++;
		var data = {
			page_number: page,
			slug: '<?=$this->uri->segment(2)?>'
		};
		if ( page <= parseInt(total_page) ) {
			_H.Loading( true );
			$.post( _BASE_URL + 'public/download/get_files', data, function( response ) {
				_H.Loading( false );
				var res = _H.StrToObject( response );
				var rows = res.rows;
				var str = '';
				var no = parseInt($('.number:last').text()) + 1;
				for (var z in rows) {
					var row = rows[ z ];
					str += '<tr>';
					str += '<td class="number">' + no + '</td>';
					str += '<td>' + row.file_title + '</td>';
					str += '<td>' + (_H.FormatBytes(row.file_size * 1024)) + '</td>';
					str += '<td>' + row.file_ext + '</td>';
					str += '<td>' + row.file_counter + '</td>';
					str += '<td>';
					str += '<a href="' + _BASE_URL + 'public/download/force_download/' + row.id + '"><i class="fa fa-download"></i></a>';
					str += '</td>';
					str += '</tr>';
					no++;
				}
				var elementId = $("tbody > tr:last");
				$( str ).insertAfter( elementId );
				if ( page == parseInt(total_page) ) $('.more-files').remove();
			});
		}
	}
</script>




<div class="news">
	<div class="container ">

				<div class="col-md-8 col-xs-8 datew3-agileits">
				<h3 class="card-title"><?=strtoupper($page_title)?></h3>
				<table class="table table-striped table-bordered mb-0">
					<thead>
						<tr>
							<th width="40px">NO</th>
							<th>NAMA FILE</th>
							<th>UKURAN</th>
							<th>TIPE</th>
							<th>DIUNDUH</th>
							<th width="40px" class="text-center"><i class="fa fa-download"></i></th>
						</tr>
					</thead>
					<tbody>
						<?php $no = 1; foreach($query->result() as $row) { ?>
							<tr>
								<td class="number"><?=$no?></td>
								<td><?=$row->file_title?></td>
								<td><?=filesize_formatted($row->file_size * 1024)?></td>
								<td><?=$row->file_ext?></td>
								<td><?=$row->file_counter?> Kali</td>
								<td class="text-center">
									<a href="<?=site_url('public/download/force_download/'.$row->id)?>"><i class="fa fa-download"></i></a>
								</td>
							</tr>
							<?php $no++; } ?>
					</tbody>
				</table>

				</div>
				
	



		
<?php $this->load->view('themes/intro/sidebar')?>

<div class="clearfix"> </div>