<main role="main" class="container">
		<div class="card">
			<div class="card-header">Data supplier</div>
			<div class="card-body">
				<a href="<?php echo base_url(); ?>supplier/create" class="btn btn-success">Create</a>
				<br/>
				<br/>
				<table class="table table-bordered">
					<tr>
						<th width="5%">No</th>
						<th>Nama</th>
						<th>Alamat </th>
						<th>Kota</th>
						<th>Telp</th>
						<th>Action</th>
					</tr>
					<?php 
					$no = 1;
					foreach($supplier as $row)
					{
						?>
						<tr>
							<td widtd="5%"><?php echo $no++; ?></td>
							<td><?php echo $row->NAMA_SUPPLIER; ?></td>
							<td><?php echo $row->ALAMAT; ?></td>
							<td><?php echo $row->KOTA; ?></td>
							<td><?php echo $row->TELP; ?></td>
							<td>
							<a href="<?php echo base_url(); ?>supplier/edit/<?php echo $row->KODE_SUPPLIER; ?>" class="btn btn-warning">Edit</a>
							<a href="<?php echo base_url(); ?>supplier/delete/<?php echo $row->KODE_SUPPLIER; ?>" class="btn btn-danger">Hapus</a>
							</td>
						</tr>
						<?php
					}
					?>
				</table>
			</div>
		</div>
</main>
