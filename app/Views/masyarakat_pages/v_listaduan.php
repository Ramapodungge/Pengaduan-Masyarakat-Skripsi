<div id="tabelAduan">

    <!-- Cek apakah data pengaduan kosong -->
    <?php if (empty($pengaduan)): ?>
        <div class="alert alert-warning">
            Data yang Anda cari tidak ditemukan.
        </div>
    <?php else: ?>
        <div class="position-relative profile-card-slider mt-lg-25">
            <?php foreach ($pengaduan as $adu): ?>
                <div class="job-card-harizontal">
                    <button
                        class="btn btn-rounded btn-white position-absolute d-xl-none top-100 start-50 p-10 translate-middle"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#jobInfoCardCollapse"
                        aria-expanded="false"
                        aria-controls="jobInfoCardCollapse">
                        <img
                            src="./assets-home/assets/icons/chevron-down.svg"
                            class="svg-inject text-primary is-16"
                            alt="" />
                    </button>
                    <div class="job-info">
                        <div class="job-image">
                            <img src="./assets-home/assets/kategori/layananpublik.svg" alt="" />
                        </div>
                        <div class="job-info-inner">
                            <h5 class="job-title">
                                <a><?= $adu['judul'] ?></a>
                            </h5>

                            <div class="job-author">
                                <a><?= $adu['nama_kategori'] ?></a>
                            </div>
                        </div>
                    </div>
                    <div
                        class="job-info-card-collapse collapse"
                        id="jobInfoCardCollapse">
                        <div class="job-info-card">
                            <div class="info-card">
                                <div
                                    class="info-card-icon bg-ufo-green-100 rounded-pill">
                                    <i class="fas fa-building"></i>
                                </div>
                                <div class="info-card-content">
                                    <h6 class="info-card-title">
                                        <?= $adu['nama_instansi'] ?>
                                    </h6>
                                    <div class="info-card-desc">Tujuan</div>
                                </div>
                            </div>
                            <div class="info-card">
                                <div class="info-card-icon bg-rajah rounded-pill">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="info-card-content">
                                    <h6 class="info-card-title"><?php if ($adu['tipe_aduan'] == 'Anonim') {
                                                                    echo "Anonim";
                                                                } else {
                                                                    echo $adu['nama_masyarakat'];
                                                                } ?></h6>
                                    <div class="info-card-desc">Nama Pelapor</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="job-action">
                        <?php if ($adu['status'] == "Diajukan") : ?>
                            <div
                                class="bg-majorelle-blue-200 text-white text-center flex-fill flex-md-nofill fw-semiBold py-12 px-43 rounded-pill">
                                <?= $adu['status'] ?>
                            </div>
                        <?php endif ?>
                        <?php if ($adu['status'] == "Terverifikasi") : ?>
                            <div
                                class="bg-ufo-green-100 text-white text-center flex-fill flex-md-nofill fw-semiBold py-12 px-43 rounded-pill">
                                <?= $adu['status'] ?>
                            </div>
                        <?php endif ?>
                        <?php if ($adu['status'] == "Dialokasi") : ?>
                            <div
                                class="bg-pumpkin text-white text-center flex-fill flex-md-nofill fw-semiBold py-12 px-43 rounded-pill">
                                <?= $adu['status'] ?>
                            </div>
                        <?php endif ?>
                        <?php if ($adu['status'] == "Dalam Proses") : ?>
                            <div
                                class="bg-mikado-yellow text-white text-center flex-fill flex-md-nofill fw-semiBold py-12 px-43 rounded-pill">
                                <?= $adu['status'] ?>
                            </div>
                        <?php endif ?>
                        <?php if ($adu['status'] == "Selesai") : ?>
                            <div
                                class="bg-lime-green text-white text-center flex-fill flex-md-nofill fw-semiBold py-12 px-43 rounded-pill">
                                <?= $adu['status'] ?>
                            </div>
                        <?php endif ?>
                        <?php if ($adu['status'] == "Ditolak") : ?>
                            <div
                                class="bg-orange-red text-white text-center flex-fill flex-md-nofill fw-semiBold py-12 px-43 rounded-pill">
                                <?= $adu['status'] ?>
                            </div>
                        <?php endif ?>
                    </div>
                </div>
            <?php endforeach ?>
            <!-- /.job-card-grid-harizontal-component -->
        </div>
    <?php endif; ?>

    <div class="d-flex justify-content-center mt-60">
        <?= $pager->links() ?>
    </div>
</div>