<?= $this->extend('admin_pages/template/template_admin'); ?>

<?= $this->section('content'); ?>
<div class="container-fluid">
    <div class="py-3 d-flex align-items-sm-center flex-sm-row flex-column">
        <div class="flex-grow-1">
            <h4 class="fs-18 fw-semibold m-0">Dashboard</h4>
        </div>
    </div>

    <!-- Start Main Widgets -->
    <?php if (session()->get('level') == "admin"): ?>
        <div class="row">
            <div class="col-lg-4 col-md-12">
                <div class="col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="widget-first">

                                <div class="d-flex align-items-center mb-2">
                                    <div
                                        class="p-2 border border-primary border-opacity-10 bg-primary-subtle rounded-2 me-2">
                                        <div class="bg-primary rounded-circle widget-size text-center">
                                            <i data-feather="clipboard" class="text-white"></i>
                                        </div>
                                    </div>
                                    <h2 class="mb-0 text-dark">Total Pengaduan</h2>
                                </div>

                                <div class="d-flex justify-content-between align-items-center">
                                    <h3 class="mb-0 fs-22 text-white me-3"></h3>
                                    <div class="text-center">
                                        <h3 class=""><?= $total_pengaduan ?></h3>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="widget-first">

                                <div class="d-flex align-items-center mb-2">
                                    <div
                                        class="p-2 border border-secondary border-opacity-10 bg-secondary-subtle rounded-2 me-2">
                                        <div class="bg-secondary rounded-circle widget-size text-center">
                                            <i data-feather="paperclip" class="text-white"></i>
                                        </div>
                                    </div>
                                    <h2 class="mb-0 text-dark">Jumlah Pengaduan Baru Diajukan Dalam 3 hari terakhir</h2>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <h3 class="mb-0 fs-22 text-dark me-3"></h3>
                                    <div class="text-center">
                                        <h3 class=""> <?= $pengaduan_baru ?></h3>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="widget-first">

                                <div class="d-flex align-items-center mb-2">
                                    <div
                                        class="p-2 border border-secondary border-opacity-10 bg-secondary-subtle rounded-2 me-2">
                                        <div class="bg-success rounded-circle widget-size text-center">
                                            <i data-feather="check" class="text-white"></i>
                                        </div>
                                    </div>
                                    <h2 class="mb-0 text-dark">Jumlah Masyarakat Terdaftar</h2>
                                </div>

                                <div class="d-flex justify-content-between align-items-center">
                                    <h3 class="mb-0 fs-22 text-dark me-3"></h3>
                                    <div class="text-center">
                                        <h3 class=""> <?= $total_masyarakat ?></h3>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">Pie Chart Jumlah Per Status Pengaduan</h5>
                    </div>

                    <div class="card-body">
                        <div class="card-chart"> <canvas id="chartPengaduan"></canvas></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Main Widgets -->
        <div class="row">
            <div class="col-lg-6 col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="card-title mb-0">Jumlah Aduan Permasyarakat</h5>
                    </div><!-- end card header -->

                    <div class="card-body">
                        <table id="datatable" class="table table-bordered dt-responsive table-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>Nama Lengkap</th>
                                    <th>Jumlah Aduan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($berdasarkan_masyarakat as $mas): ?>
                                    <tr>
                                        <td><?= $mas['nama_pengadu'] ?></td>
                                        <td><?= $mas['jumlah_pengaduan'] ?></td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-12">
                <div class="card">

                    <div class="card-header">
                        <h5 class="card-title mb-0">Jumlah PerKategori</h5>
                    </div><!-- end card header -->

                    <div class="card-body">
                        <table id="datatable" class="table table-bordered dt-responsive table-responsive nowrap">
                            <thead>
                                <tr>
                                    <th>Nama Kategori</th>
                                    <th>Jumlah Aduan</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($berdasarkan_kategori as $kat): ?>
                                    <tr>
                                        <td><?= $kat['nama_kategori'] ?></td>
                                        <td><?= $kat['jumlah_pengaduan'] ?></td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    <?php endif ?>

    <?php if (session()->get('level') == "operator"): ?>
        <div class="row">
            <div class="col-lg-4 col-md-12">
                <div class="col-md-6 col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="widget-first">

                                <div class="d-flex align-items-center mb-2">
                                    <div
                                        class="p-2 border border-primary border-opacity-10 bg-primary-subtle rounded-2 me-2">
                                        <div class="bg-primary rounded-circle widget-size text-center">
                                            <i data-feather="clipboard" class="text-white"></i>
                                        </div>
                                    </div>
                                    <h2 class="mb-0 text-dark">Total Pengaduan</h2>
                                </div>

                                <div class="d-flex justify-content-between align-items-center">
                                    <h3 class="mb-0 fs-22 text-white me-3"></h3>
                                    <div class="text-center">
                                        <h3 class=""><?= $total_pengaduanOP ?></h3>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

                <div class="col-md-12 col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Jumlah Aduan Per Kategori</h5>

                        </div>
                        <div class="card-body ">
                            <div class="dt-responsive table-responsive nowrap">
                                <table id="datatable" class="table table-bordered ">
                                    <thead>
                                        <tr>
                                            <th>Nama Kategori</th>
                                            <th>Jumlah Aduan</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($berdasarkan_kategoriOP as $kat): ?>
                                            <tr>
                                                <td><?= $kat['nama_kategori'] ?></td>
                                                <td><?= $kat['jumlah_pengaduan'] ?></td>
                                            </tr>
                                        <?php endforeach ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">Jumlah Aduan Masyarakat di instansi ini</h5>
                    </div>

                    <div class="card-body">
                        <div class="dt-responsive table-responsive nowrap">
                            <table id="datatable2" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Nama Lengkap</th>
                                        <th>Jumlah Aduan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($berdasarkan_masyarakatOP as $mas): ?>
                                        <tr>
                                            <td><?= $mas['nama_pengadu'] ?></td>
                                            <td><?= $mas['jumlah_pengaduan'] ?></td>
                                        </tr>
                                    <?php endforeach ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php endif ?>

</div> <!-- container-fluid -->

<?= $this->endSection(); ?>