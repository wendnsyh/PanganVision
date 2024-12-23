<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Data Pangan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Tambah Data Pangan</h1>
        <?= form_open('pangan/add'); ?>
            <div class="mb-3">
                <label for="jenis_pangan" class="form-label">Jenis Pangan</label>
                <input type="text" name="jenis_pangan" id="jenis_pangan" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Simpan</button>
            <a href="<?= site_url('pangan'); ?>" class="btn btn-secondary">Batal</a>
        <?= form_close(); ?>
    </div>
</body>
</html>