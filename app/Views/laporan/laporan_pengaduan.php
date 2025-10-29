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

<body>
    <?php if (session()->get('level') == 'admin'): ?>
        <h3 class="center"><u>DAFTAR PENGADUAN</u></h3>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>Nama Pengadu</th>
                    <th>Judul</th>
                    <th>Tujuan</th>
                    <th>IsI</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 1;
                foreach ($pengaduan as $adu):
                ?>
                    <tr>
                        <td>
                            <?php if ($adu['tipe_aduan'] == 'Anonim') {
                                echo "Anonim";
                            } else {
                                echo $adu['nama_pengadu'];
                            } ?>
                        </td>
                        <td><?= $adu['judul'] ?></td>
                        <td><?= $adu['nama_instansi'] ?></td>
                        <td><?= $adu['isi'] ?></td>

                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    <?php endif ?>
    <?php if (session()->get('level') == 'operator'): ?>
        <h3 class="center"><u>DAFTAR PENGADUAN DI INSTANSI INI</u></h3>
        <table class="table" border="1">
            <thead>
                <tr>
                    <th>Nama Pengadu</th>
                    <th>Judul</th>
                    <th>Tujuan</th>
                    <th>IsI</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 1;
                foreach ($pengaduanOP as $adu):
                ?>
                    <tr>
                        <td>
                            <?php if ($adu['tipe_aduan'] == 'Anonim') {
                                echo "Anonim";
                            } else {
                                echo $adu['nama_pengadu'];
                            } ?>
                        </td>
                        <td><?= $adu['judul'] ?></td>
                        <td><?= $adu['nama_instansi'] ?></td>
                        <td><?= $adu['isi'] ?></td>

                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    <?php endif ?>
</body>

</html>