<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8" />
    <title>Log In | Sistem Informasi Pengaduan Masyarakat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc." />
    <meta name="author" content="Zoyothemes" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- App css -->
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

    <!-- Icons -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />

    <script src="assets/js/head.js"></script>


</head>

<body>
    <!-- Begin page -->
    <div class="account-page">
        <div class="container-fluid p-0">
            <div class="row align-items-center g-0 px-3 py-3 vh-100">

                <div class="col-xl-5">
                    <div class="row">
                        <div class="col-md-8 mx-auto">
                            <div class="card">
                                <div class="card-body">
                                    <div class="mb-0 p-0 p-lg-3">
                                        <div class="mb-0 border-0 p-md-4 p-lg-0">
                                            <div class="mb-4 p-0 text-lg-start text-center">
                                                <div class="auth-brand">
                                                    <a href="index.html" class="logo logo-light">
                                                        <span class="logo-lg">
                                                            <img src="assets/images/logo-light-3.png" alt="" height="24">
                                                        </span>
                                                    </a>
                                                    <a href="index.html" class="logo logo-dark">
                                                        <span class="logo-lg">
                                                            <img src="assets/images/logo-dark-3.png" alt="" height="24">
                                                        </span>
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="auth-title-section mb-4 text-lg-start text-center">
                                                <h3 class="text-dark fw-semibold mb-3">Selamat datang kembali! Silakan Masuk untuk melanjutkan..</h3>
                                                <p class="text-muted fs-14 mb-0">Masuk untuk dapat mengakses dashboard admin anda.</p>
                                            </div>

                                            <div class="saprator my-4"><span>Admin/Operator</span></div>

                                            <div class="pt-0">
                                                <form method="POST" action="loginproses" class="my-4">
                                                    <?= csrf_field() ?>
                                                    <div class="form-group mb-3">
                                                        <label for="emailaddress" class="form-label">Email address</label>
                                                        <input name="username" class="form-control" type="email" id="emailaddress" required="" placeholder="Masukan Email Anda">
                                                    </div>

                                                    <div class="form-group mb-3">
                                                        <label for="password" class="form-label">Password</label>
                                                        <input name="password" class="form-control" type="password" required="" id="password" placeholder="Masukan Password Anda">
                                                    </div>
                                                    <div class="form-group mb-3">
                                                        <label for="level" class="form-label">level</label>
                                                        <select name="level" id="level" class="form-control">
                                                            <option value="operator">Operator</option>
                                                            <option value="admin">Admin</option>
                                                        </select>
                                                    </div>
                                                    <?php if (session()->getFlashdata('pesanlogindulu')) : ?>
                                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                            <span class="fas fa-times fe-16 mr-2"></span> <?= session()->getFlashdata('pesanlogindulu'); ?>
                                                        </div>
                                                    <?php endif ?>
                                                    <?php if (session()->getFlashdata('pesanlogin')) : ?>
                                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                                            <span class="fas fa-times fe-16 mr-2"></span> <?= session()->getFlashdata('pesanlogin'); ?>
                                                        </div>
                                                    <?php endif ?>
                                                    <div class="form-group mb-0 row">
                                                        <div class="col-12">
                                                            <div class="d-grid">
                                                                <button class="btn btn-primary fw-semibold" type="submit"> Log In </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>

                                                <div class="text-center text-muted">
                                                    <p class="mb-0">Belum Punya Akun ?<a class='text-primary ms-2 fw-medium' href='buat_akun'>Buat Akun</a></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <div class="col-xl-7 d-none d-xl-inline-block">
                    <div class="account-page-bg rounded-4">
                        <div class="auth-user-review text-center">
                            <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                                <div class="carousel-inner">



                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- END wrapper -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.all.min.js"></script>
    <!-- Vendor -->
    <script src="assets/libs/jquery/jquery.min.js"></script>
    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/node-waves/waves.min.js"></script>
    <script src="assets/libs/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="assets/libs/jquery.counterup/jquery.counterup.min.js"></script>
    <script src="assets/libs/feather-icons/feather.min.js"></script>

    <!-- App js-->
    <script src="assets/js/app.js"></script>
    <script>
        <?php if (session()->getFlashdata('pesanbuat')): ?>
            Swal.fire({
                title: "Pesan Masuk",
                html: "<?= session()->getFlashdata('pesanbuat') ?>",
                icon: "success"
            });
        <?php endif; ?>
    </script>

</body>

</html>