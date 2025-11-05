<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Laporan Pengaduan</title>
    <style>
        body {
            font-family: sans-serif;
            font-size: 12px;
        }

        h3 {
            text-align: center;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 5px;
            text-align: left;
        }

        th {
            background-color: #eee;
        }
    </style>
</head>

<body>
    <h3>
        Laporan Pengaduan
        <?php
        if (!empty($bulan) && !empty($tahun)) {
            echo "Bulan " . date('F', mktime(0, 0, 0, (int)$bulan, 1)) . " " . $tahun;
        } elseif (!empty($tahun)) {
            echo "Tahun " . $tahun;
        } else {
            echo "Semua Periode";
        }
        ?>
    </h3>


    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Judul</th>
                <th>Kategori</th>
                <th>Instansi</th>
                <th>Status</th>
                <th>Tanggal</th>
            </tr>
        </thead>
        <tbody>
            <?php if (count($pengaduan) > 0): ?>
                <?php $no = 1;
                foreach ($pengaduan as $row): ?>
                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= esc($row['judul']) ?></td>
                        <td><?= esc($row['nama_kategori']) ?></td>
                        <td><?= esc($row['nama_instansi']) ?></td>
                        <td><?= esc($row['status']) ?></td>
                        <td><?= date('d-m-Y', strtotime($row['created_at'])) ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="6" style="text-align:center;">Tidak ada data</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>

</html>