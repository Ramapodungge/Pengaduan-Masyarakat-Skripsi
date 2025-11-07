<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link
        href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
        rel="stylesheet" />
    <base href="<?= base_url('assets-login'); ?>">


    <link rel="stylesheet" href="assets-login/fonts/icomoon/style.css" />

    <link rel="stylesheet" href="assets-login/css/owl.carousel.min.css" />

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets-login/css/bootstrap.min.css" />

    <!-- Style -->
    <link rel="stylesheet" href="assets-login/css/style.css" />
    <link rel="stylesheet" href="assets-login/css/fa/all.css" />

    <title>Register | RuangSuara</title>
    <style>
        input[type="date"] {
            position: relative;
            color: transparent;
            /* sembunyikan teks default */
        }

        .hidden {
            display: none;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }

        .control input:checked~.control__indicator {
            background: #5f4bdb;
        }

        .control:hover input:not([disabled]):checked~.control__indicator,
        .control input:checked:focus~.control__indicator {
            background: #5f4bdb;
        }
    </style>
</head>

<body>
    <div class="content">
        <div class="container">
            <div class="row justify-content-center">
                <!-- <div class="col-md-6 order-md-2">
          <img src="images/undraw_file_sync_ot38.svg" alt="Image" class="img-fluid">
        </div> -->
                <div class="col-md-9 contents">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div class="form-block">
                                <div class="mb-4">
                                    <h3>Sign Up to <strong>RuangSuara</strong></h3>
                                    <p class="mb-4">
                                        Masukan Password baru Anda untuk melanjutkan proses dan melihat
                                        perkembangan penanganan.
                                    </p>
                                </div>
                                <div
                                    class="mb-4 bg-primary rounded p-3 text-white"
                                    style="font-size: 13px">
                                    <i class="fas fa-info-circle"></i>
                                    Mengapa Kami Meminta data ini?<br />Layanan RuangSuara!
                                    mengumpulkan data pribadi pengguna sebagai jaminan keabsahan
                                    dari aduan atau aspirasi yang disampaikan, pengenal
                                    identitas, memverifikasi akun dan mengirim notifikasi
                                    laporan,
                                </div>
                                <form action="reset-password" method="post">
                                    <?= csrf_field() ?>
                                    <input type="hidden" name="token" value="<?= esc($token) ?>">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12 col-sm-12 mb-2">
                                            <div class="form-group">
                                                <label for="password">Password</label>
                                                <input
                                                    type="password"
                                                    class="form-control"
                                                    id="password" oninput="toggleSubmitButton()"
                                                    name="password" required />
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label for="confirm_password">Konfirmasi Password</label>
                                                <input
                                                    type="password"
                                                    class="form-control"
                                                    id="confirm_password" oninput="toggleSubmitButton()"
                                                    name="confirm_password" required />
                                            </div>
                                        </div>

                                    </div>

                                    <input
                                        type="submit"
                                        value="Kirim"
                                        class="btn text-white btn-block btn-primary"
                                        id="submitBtn" onchange="toggleSubmitButton()" />
                                </form>
                            </div>


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
    <script src="assets-login/js/fa/all.js"></script>
    <script src="assets-login/js/main.js"></script>
    <script>
        <?php if (session()->getFlashdata('error')): ?>
            Swal.fire({
                title: "Pesan Masuk",
                html: "<?= session()->getFlashdata('error') ?>",
                icon: "error"
            });
        <?php endif; ?>
        <?php if (session()->getFlashdata('berhasil')): ?>
            Swal.fire({
                title: "Pesan Masuk",
                html: "<?= session()->getFlashdata('berhasil') ?>",
                icon: "success"
            });
        <?php endif; ?>
    </script>
    <script>
        const tanggal = document.getElementById("tanggal");

        tanggal.addEventListener("change", () => {
            if (tanggal.value) {
                tanggal.style.color = "#000"; // tampilkan tanggal setelah dipilih
            } else {
                tanggal.style.color = "transparent"; // sembunyikan kalau kosong
            }
        });

        // supaya di awal tetap hilang dd/mm/yyyy
        tanggal.style.color = "transparent";

        // Fungsi untuk mengecek status checkbox dan mencocokkan password
        function toggleSubmitButton() {
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirm_password');
            const submitButton = document.getElementById('submitBtn');

            // Pastikan password dan konfirmasi password cocok
            const passwordsMatch = password.value === confirmPassword.value;

            // Tombol submit diaktifkan jika checkbox dicentang dan password cocok
            submitButton.disabled = !(passwordsMatch);
        }

        // Pastikan tombol submit dimulai dalam keadaan disabled saat halaman dimuat
        window.onload = function() {
            toggleSubmitButton(); // Cek status awal saat halaman dimuat
        }
    </script>

</body>

</html>