<?php
function formatTanggalIndonesiaWITA($datetime)
{
    // Set zona waktu ke WITA (Asia/Makassar)
    date_default_timezone_set('Asia/Makassar');

    // Array bulan dalam bahasa Indonesia
    $bulanIndo = [
        1 => 'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    ];

    // Ubah string datetime menjadi objek DateTime
    $tanggal = new DateTime($datetime);

    // Format ke bentuk tanggal Indonesia
    $hari = $tanggal->format('d'); // Hari
    $bulan = $bulanIndo[(int)$tanggal->format('m')]; // Bulan dalam bahasa Indonesia
    $tahun = $tanggal->format('Y'); // Tahun
    $jam = $tanggal->format('H:i:s'); // Jam dengan detik

    return "$hari $bulan $tahun $jam WITA";
}
?>
<!doctype html>
<html lang="id">

<head>
    <meta charset="utf-8" />
    <title>Formulir Pengaduan - <?= esc($pengaduan['id_pengaduan'] ?? '') ?></title>
    <style>
        /* --- Reset minimal --- */
        * {
            box-sizing: border-box;
        }

        body {
            font-family: "DejaVu Sans", "Helvetica", Arial, sans-serif;
            font-size: 12px;
            color: #222;
            margin: 0;
            padding: 0;
        }

        .page {
            padding: 24px;
        }

        /* --- Kop surat --- */
        .kop {
            display: flex;
            align-items: center;
            border-bottom: 3px solid #020305ff;
            padding-bottom: 12px;
            margin-bottom: 18px;
        }

        .kop .logo {
            width: 84px;
            height: 84px;
            background: #f2f4ff;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 16px;
            border-radius: 8px;
        }

        .kop .logo img {
            max-width: 72px;
            max-height: 72px;
        }

        .kop .alamat {
            line-height: 1.15;
        }

        .kop .judul {
            font-size: 18px;
            font-weight: 700;
            color: #0a0d11ff;
        }

        .kop .sub {
            font-size: 11px;
            color: #444;
        }

        /* --- Grid info --- */
        .grid {
            display: flex;
            gap: 18px;
            margin-bottom: 14px;
        }

        .col {
            flex: 1;
        }

        .box {
            border: 1px solid #e6e9ef;
            padding: 10px 12px;
            border-radius: 8px;
            background: #fff;
        }

        .label {
            font-size: 11px;
            color: #6b7280;
            margin-bottom: 6px;
            display: block;
        }

        .value {
            font-weight: 600;
            color: #111827;
        }

        /* --- Isi laporan --- */
        .section-title {
            margin-top: 18px;
            margin-bottom: 8px;
            font-weight: 700;
            color: #0e121aff;
            font-size: 13px;
        }

        .isi-laporan {
            border: 1px solid #e6e9ef;
            padding: 12px;
            border-radius: 6px;
            min-height: 80px;
            white-space: pre-wrap;
            background: #fff;
        }

        /* --- Table histori --- */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th,
        td {
            border: 1px solid #e6e9ef;
            padding: 8px 10px;
            font-size: 12px;
            vertical-align: top;
        }

        th {
            background: #f8fafc;
            font-weight: 700;
            color: #101316ff;
            text-align: left;
        }

        .small {
            font-size: 11px;
            color: #6b7280;
        }

        /* --- Bukti --- */
        .bukti {
            margin-top: 10px;
        }

        .bukti img {
            max-width: 160px;
            max-height: 120px;
            border: 1px solid #ddd;
            padding: 4px;
            border-radius: 6px;
        }

        /* --- Footer signature --- */
        .signature {
            margin-top: 28px;
            display: flex;
            justify-content: space-between;
            gap: 12px;
        }

        .sig-box {
            width: 45%;
            text-align: center;
            border-top: 1px solid #d1d5db;
            padding-top: 8px;
            font-size: 12px;
        }

        /* --- Page break helper --- */
        .page-break {
            page-break-after: always;
        }

        /* small screens for PDF viewer */
        @media print {
            .kop .logo {
                width: 72px;
                height: 72px;
            }
        }
    </style>
</head>

<body>
    <div class="page">

        <!-- Kop / Header -->
        <div class="kop">
            <div class="logo">
                <!-- Jika ingin pakai file logo, isi src dengan base64 atau path absolut -->
                <?php if (!empty($logo_path)): ?>
                    <img src="<?= esc($logo_path) ?>" alt="Logo">
                <?php else: ?>
                    <div style="font-weight:700;color:#0b5ed7;">LOGO</div>
                <?php endif; ?>
            </div>
            <div class="alamat">
                <div class="judul"><?= esc($organization_name ?? 'SISTEM PENGADUAN') ?></div>
                <div class="sub"><?= esc($organization_address ?? 'Alamat Instansi / Pemerintah Daerah') ?></div>
                <?php if (!empty($organization_contact)): ?>
                    <div class="sub"><?= esc($organization_contact) ?></div>
                <?php endif; ?>
            </div>
        </div>

        <!-- Judul Dokumen -->
        <h2 style="margin:0 0 12px 0;">Formulir Pengaduan</h2>
        <div class="small">No. Aduan: <strong><?= esc($pengaduan['id_pengaduan'] ?? '-') ?></strong> &nbsp; | &nbsp; Tanggal Buat: <strong><?= esc(formatTanggalIndonesiaWITA($pengaduan['created_at'])  ?? '-') ?></strong></div>

        <!-- Info Ringkas (pelapor, instansi, kategori) -->
        <div class="grid" style="margin-top:12px;">
            <div class="col">
                <div class="box">
                    <span class="label">Pelapor</span>
                    <div class="value"><?php if (($pengaduan['tipe_aduan'] ?? '') !== 'Anonim') : ?>
                            <?= esc($pengaduan['nama_pengadu'] ?? '-') ?>
                        <?php endif; ?></div>
                    <div class="small"><?php if (($pengaduan['tipe_aduan'] ?? '') !== 'Anonim') : ?>
                            NIK: <?= esc($pengaduan['id_masyarakat'] ?? '-') ?>
                        <?php endif; ?></div>
                    <?php if (!empty($pengaduan['alamat'])): ?>
                        <div class="small">Alamat: <?= esc($pengaduan['alamat']) ?></div>
                    <?php endif; ?>
                    <?php if (!empty($pengaduan['no_telpon'])): ?>
                        <div class="small">Telp: <?= esc($pengaduan['no_telpon']) ?></div>
                    <?php endif; ?>
                    <?php if (!empty($pengaduan['email'])): ?>
                        <div class="small">Email: <?= esc($pengaduan['email']) ?></div>
                    <?php endif; ?>
                </div>
            </div>

            <div class="col">
                <div class="box">
                    <span class="label">Informasi Aduan</span>
                    <div class="small">Kategori: <strong><?= esc($pengaduan['nama_kategori'] ?? '-') ?></strong></div>
                    <div class="small">Instansi Tujuan: <strong><?= esc($pengaduan['nama_instansi'] ?? '-') ?></strong></div>
                    <div class="small">Tipe Aduan: <strong><?= esc($pengaduan['tipe_aduan'] ?? '-') ?></strong></div>
                    <div class="small">Status Saat Ini: <strong><?= esc($pengaduan['status'] ?? '-') ?></strong></div>
                </div>
            </div>

            <div class="col" style="flex:0.9;">
                <div class="box">
                    <span class="label">Ringkasan</span>
                    <div class="value"><?= esc($pengaduan['judul'] ?? '-') ?></div>
                    <div class="small"><?php if (($pengaduan['tipe_aduan'] ?? '') !== 'Anonim') : ?>
                            NIK: <?= esc($pengaduan['id_masyarakat'] ?? '-') ?>
                        <?php endif; ?></div>
                </div>
            </div>
        </div>

        <!-- Isi Laporan -->
        <div class="section-title">Deskripsi / Isi Pengaduan</div>
        <div class="isi-laporan">
            <?= nl2br(esc($pengaduan['isi'] ?? '-')) ?>
        </div>


        <!-- Footer / Signature -->
        <div class="signature">
            <div>
                <div class="small" style="text-align:right;">Dicetak pada: <strong><?= formatTanggalIndonesiaWITA(date('Y-m-d H:i'))  ?></strong></div>
            </div>
            <div style="text-align:right;">
                <div class="small">Petugas Penanggung Jawab,</div>
                <div style="height:64px;"></div>
                <div class="sig-box" style="width:220px;margin-left:auto;">

                </div>
            </div>
        </div>

    </div>
</body>

</html>