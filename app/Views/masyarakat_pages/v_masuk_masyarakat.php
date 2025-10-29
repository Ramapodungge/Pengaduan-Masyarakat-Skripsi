<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="assets-login/fonts/icomoon/style.css">

    <link rel="stylesheet" href="assets-login/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets-login/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="assets-login/css/style.css">

    <title>Login | RuangSuara</title>
</head>

<body>



    <div class="content">
        <div class="container">
            <div class="row justify-content-center">
                <!-- <div class="col-md-6 order-md-2">
          <img src="images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
        </div> -->
                <div class="col-md-6 contents">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block">
                                <div class="mb-4">
                                    <h3>Log in to <strong>RuangSuara</strong></h3>
                                    <p class="mb-4">Akses akun Anda untuk melanjutkan laporan dan melihat
                                        perkembangan penanganan.</p>
                                    <?php if (session()->getFlashdata('pesanlogindulu')) : ?>
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            <span class="fas fa-times fe-16 mr-2"></span> <?= session()->getFlashdata('pesanlogindulu'); ?>
                                        </div>
                                    <?php endif ?>
                                </div>
                                <form action="login_masyrakat" method="post">
                                    <?= csrf_field() ?>
                                    <div class="form-group first">
                                        <label for="username">Username</label>
                                        <input type="text" name="username" class="form-control" id="username">

                                    </div>
                                    <div class="form-group last mb-4">
                                        <label for="password">Password</label>
                                        <input type="password" name="password" class="form-control" id="password">
                                    </div>
                                    <input type="submit" value="Log In" class="btn text-white btn-block btn-primary">
                                    <small>Belum Punya Akun? Daftar <a href="daftar_masyarakat">Disini</a></small>
                            </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.5.4/dist/sweetalert2.all.min.js"></script>
    <script src="assets-login/js/jquery-3.3.1.min.js"></script>
    <script src="assets-login/js/popper.min.js"></script>
    <script src="assets-login/js/bootstrap.min.js"></script>
    <script src="assets-login/js/main.js"></script>

    <script>
        <?php if (session()->getFlashdata('error')): ?>
            Swal.fire({
                title: "Pesan Masuk",
                html: "<?= session()->getFlashdata('error') ?>",
                icon: "error"
            });
        <?php endif; ?>
        <?php if (session()->getFlashdata('pesanlogin')): ?>
            Swal.fire({
                title: "Pesan Masuk",
                html: "<?= session()->getFlashdata('pesanlogin') ?>",
                icon: "success"
            });
        <?php endif; ?>
    </script>
</body>

</html>