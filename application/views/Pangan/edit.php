<div class="container mt-5">
    <h1 class="text-center">Edit Data Pangan</h1>
    <?= form_open('pangan/edit/' . $pangan['ID_Pangan']); ?>
    <div class="mb-3">
        <label for="jenis_pangan" class="form-label">Jenis Pangan</label>
        <input type="text" name="jenis_pangan" id="jenis_pangan" value="<?= $pangan['Jenis_Pangan']; ?>" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Simpan</button>
    <a href="<?= site_url('pangan'); ?>" class="btn btn-secondary">Batal</a>
    <?= form_close(); ?>
</div>