<!-- Bukti (jika ada) -->
<?php if (!empty($pengaduan['foto'])): ?>
    <div class="section-title">Bukti / Lampiran</div>
    <div class="bukti">
        <?php
        // jika bukti berupa array file
        $buktiList = is_array($pengaduan['foto']) ? $pengaduan['foto'] : explode(',', $pengaduan['foto']);
        foreach ($buktiList as $buktiFile):
            $buktiFile = trim($buktiFile);
            if (empty($buktiFile)) continue;
        ?>
            <?php if (preg_match('/\.(jpg|jpeg|png|gif)$/i', $buktiFile)): ?>
                <img src="foto_laporan/<?= esc($buktiFile) ?>" alt="bukti">
            <?php else: ?>
                <div class="small">File: <?= esc($buktiFile) ?></div>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
<?php endif; ?>