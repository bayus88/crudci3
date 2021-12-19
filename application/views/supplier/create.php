  <div class="container">
		<div class="card">
			<div class="card-header">Create supplier</div>
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
			<form method="post" action="<?php echo base_url(); ?>supplier/save">
				<div class="form-group">
					<label for="nama">Nama Supplier</label>
					<input type="text" class="form-control" id="NAMA_SUPPLIER" name="NAMA_SUPPLIER">
				</div>

				<div class="form-group">
					<label for="alamat">Alamat Supplier</label>
					<input type="text" class="form-control" id="ALAMAT" name="ALAMAT">
				</div>

				<div class="form-group">
					<label for="kota">Kota </label>
					<input type="text" class="form-control" id="KOTA" name="KOTA">
				</div>

				<div class="form-group">
					<label for="telpon">Telpon</label>
					<input type="number" class="form-control" id="TELP" name="TELP">
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
			</div>
		</div>
	</div>


