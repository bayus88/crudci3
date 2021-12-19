  <div class="container">
		<div class="card">
			<div class="card-header">Edit supplier</div>
			<div class="card-body">
			<?php 
			if(validation_errors() != false)
			{
				?>
				<div class="alert alert-danger" role="alert">
					<?php echo validation_errors(); ?>
				</div>
				<?php
			}
			?>
			<form method="post" action="<?php echo base_url(); ?>supplier/update">
				<input type="hidden" name="KODE_SUPPLIER" id="KODE_SUPPLIER" value="<?php echo $supplier->KODE_SUPPLIER; ?>"/>
				<div class="form-group">
					<label for="nama">Nama</label>
					<input type="text" value="<?php echo $supplier->NAMA_SUPPLIER; ?>" class="form-control" id="NAMA_SUPPLIER" name="NAMA_SUPPLIER">
				</div>

				<div class="form-group">
					<label for="Alamat">Alamat</label>
					<input type="text" value="<?php echo $supplier->ALAMAT; ?>" class="form-control" id="ALAMAT" name="ALAMAT">
				</div>
				<div class="form-group">
					<label for="Kota">Kota</label>
					<input type="text" value="<?php echo $supplier->KOTA; ?>" class="form-control" id="KOTA" name="KOTA">
				</div>
				<div class="form-group">
					<label for="Telpon">Telpon</label>
					<input type="number" value="<?php echo $supplier->TELP; ?>" class="form-control" id="TELP" name="TELP">
				</div>

				

				<button type="submit" class="btn btn-primary">Update</button>
			</form>
			</div>
		</div>
	</div>

