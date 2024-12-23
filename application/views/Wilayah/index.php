<div class="container mt-5">
    <h1 class="mb-4">Daftar Wilayah</h1>
    <a href="<?= site_url('wilayah/create') ?>" class="btn btn-sucess mb-3">Tambah Wilayah</a>
    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nama Wilayah</th>
                <th>Provinsi</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($wilayah as $w): ?>
                <tr>
                    <td><?= $w->ID_Wilayah ?></td>
                    <td><?= $w->Nama_Wilayah ?></td>
                    <td><?= $w->Provinsi ?></td>
                    <td>
                        <a href="<?= site_url('wilayah/edit/' . $w->ID_Wilayah) ?>" class="btn btn-warning btn-sm">Edit</a>
                        <a href="<?= site_url('wilayah/delete/' . $w->ID_Wilayah) ?>"
                            class="btn btn-danger btn-sm"
                            onclick="return confirm('Yakin ingin menghapus?')">Hapus</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>