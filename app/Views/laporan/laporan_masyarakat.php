<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $title ?></title>
    <style>
        .center {
            text-align: center;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .font {
            font-family: 'Times New Roman', Times, serif;
            font-size: 12px;
        }
    </style>
</head>
<?php foreach ($masyarakat as $mas) {
} ?>

<body>
    <h3 class="center"><u>MASYARAKAT TERDAFTAR</u></h3>
    <table class="table" border="1">
        <thead>
            <tr>
                <th class="font">No</th>
                <th class="font">Nama Masyarkat</th>
                <th class="font">Email</th>
                <th class="font">Alamat</th>
                <th class="font">No Telepon</th>
                <th class="font">Pekerjaan</th>
                <?php
                if ($mas['pekerjaan'] != 'Pelajar/Mahasiswa/Akademisi'): ?>
                    <th class="font">Instansi/Perusahaan</th>
                    <th class="font">jabatan</th>
                <?php endif ?>
                <?php if ($mas['pekerjaan'] == 'Pelajar/Mahasiswa/Akademisi'): ?>
                    <th class="font">Kampus</th>
                    <th class="font">Jurusan</th>
                <?php endif ?>

            </tr>
        </thead>
        <tbody>
            <?php
            $no = 1;
            foreach ($masyarakat as $mas):
            ?>
                <tr>
                    <td class="center font"><?= $no++ ?></td>
                    <td class="font"><?= $mas['nama_pengadu'] ?></td>
                    <td class="font"><?= $mas['email'] ?></td>
                    <td class="font"><?= $mas['alamat'] ?></td>
                    <td class="font"><?= $mas['no_telpon'] ?></td>
                    <td class="font"><?= $mas['pekerjaan'] ?></td>
                    <?php if ($mas['pekerjaan'] == 'Profesional' || $mas['pekerjaan'] == 'Wirausaha' || $mas['pekerjaan'] == 'Pemerintahan'): ?>

                        <td class="font"><?= $mas['instansi'] ?></td>
                        <td class="font"><?= $mas['jabatan'] ?></td>
                    <?php endif ?>
                    <?php if ($mas['pekerjaan'] == 'Petani' || $mas['pekerjaan'] == 'Nelayan' || $mas['pekerjaan'] == 'Lainnya'): ?>
                        <td class="font">-</td>
                        <td class="font">-</td>
                    <?php endif ?>
                    <?php if ($mas['pekerjaan'] == 'Pelajar/Mahasiswa/Akademisi'): ?>

                        <td class="font"><?= $mas['kampus'] ?></td>
                        <td class="font"><?= $mas['jurusan'] ?></td>
                    <?php endif ?>

                </tr>
            <?php endforeach ?>
        </tbody>
    </table>
</body>

</html>