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
                                        Akses akun Anda untuk melanjutkan laporan dan melihat
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
                                <form action="regis_masyrakat" method="post">
                                    <?= csrf_field() ?>
                                    <div class="row">
                                        <div class="col-lg-6 col-md-12 col-sm-12">
                                            <div class="form-group first">
                                                <label for="nik">NIK</label>
                                                <input type="text"
                                                    class="form-control"
                                                    id="nik"
                                                    maxlength="16"
                                                    onkeydown="validateNik(event)"
                                                    onblur="checkNikLength()"
                                                    name="nik"
                                                    required />
                                                <!-- Pesan Error NIK -->
                                                <span id="nik-error" class="error-message"></span><br>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12">
                                            <div class="form-group mb-4">
                                                <label for="nama lengkap">Nama Lengkap</label>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id="nama lengkap"
                                                    name="nama" required />
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label for="nik">Email</label>
                                                <input type="email" class="form-control" id="email"
                                                    name="email" required />
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12 mb-2">
                                            <div class="form-group">
                                                <label for="tanggal">Tanggal Lahir</label>
                                                <input
                                                    type="date"
                                                    class="form-control"
                                                    id="tanggal" required
                                                    name="tgl_lahir" />
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12">
                                            <div class="form-group mb-4">
                                                <label for="jk">Jenis Kelamin</label>
                                                <select name="jenkel" class="form-control" id="jk">
                                                    <option value="" hidden></option>
                                                    <option value="L">Laki-Laki</option>
                                                    <option value="P">Perempuan</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-12 col-sm-12">
                                            <div class="form-group">
                                                <label for="notelp">No Telp</label>
                                                <input
                                                    type="number"
                                                    class="form-control"
                                                    id="notelp"
                                                    name="notelp" required />
                                            </div>
                                        </div>
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
                                        <div class="col-lg-12 col-md-12 col-sm-12 mb-2">
                                            <div class="form-group">
                                                <label for="alamat">Alamat</label>
                                                <input type="text"
                                                    name="alamat"
                                                    class="form-control"
                                                    id="" required></input>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="form-group mb-4">
                                                <label for="pekerjaan">Pilih Pekerjaan:</label>
                                                <select class="form-control" id="pekerjaan" name="pekerjaan">
                                                    <option value="" hidden></option>
                                                    <option value="Pelajar/Mahasiswa/Akademisi">Pelajar/Mahasiswa/Akademisi</option>
                                                    <option value="Profesional">Profesional</option>
                                                    <option value="Wirausaha">Wirausaha</option>
                                                    <option value="Pemerintahan">Pemerintahan</option>
                                                    <option value="Petani">Petani</option>
                                                    <option value="Nelayan">Nelayan</option>
                                                    <option value="Lainnya">Lainnya</option>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Input Fields for Profesional and Wirausaha -->
                                        <div class="col-lg-12 col-md-12 col-sm-12 hidden" id="input-pelajar">
                                            <div class="form-group mb-4">
                                                <input type="text" class="form-control" id="kampus" name="kampus" placeholder="Nama Kampus">

                                                <input type="text" class="form-control" id="jurusan" name="jurusan" placeholder="Jurusan">
                                            </div>
                                        </div>


                                        <!-- Input Fields for Profesional and Wirausaha -->
                                        <div class="col-lg-12 col-md-12 col-sm-12 hidden" id="input-profesional-wirausaha">
                                            <div class="form-group mb-4">
                                                <input type="text" class="form-control" id="perusahaan" name="instansi" placeholder="Nama Instansi/Perusahaan">

                                                <input type="text" class="form-control" id="jabatan" name="jabatan" placeholder="Jabatan">
                                            </div>
                                        </div>
                                    </div>
                            </div>


                            <div class="d-flex mb-3 align-items-center">
                                <label class="control control--checkbox mb-0"><span class="caption">Apakah anda Warga Kecamatan Kabila ?</span>
                                    <input type="checkbox" name="warga_kabila" />
                                    <div class="control__indicator"></div>
                                </label>
                            </div>
                            <div class="d-flex mb-4 align-items-center">
                                <label class="control control--checkbox mb-0"><span class="caption">Saya telah membaca dan menyetujui Syarat dan Ketentuan Layanan</span>
                                    <input type="checkbox" name="setuju" id="setuju" onchange="toggleSubmitButton()" />
                                    <div class="control__indicator"></div>
                                </label>
                            </div>

                            <input
                                type="submit"
                                value="Sign Up"
                                class="btn text-white btn-block btn-primary"
                                id="submitBtn" onchange="toggleSubmitButton()" />
                            </form>
                            <small>Sudah Punya Akun? Login <a href="masuk_masyarakat">Disini</a></small>
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
            const checkbox = document.getElementById('setuju');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirm_password');
            const submitButton = document.getElementById('submitBtn');

            // Pastikan password dan konfirmasi password cocok
            const passwordsMatch = password.value === confirmPassword.value;

            // Tombol submit diaktifkan jika checkbox dicentang dan password cocok
            submitButton.disabled = !(checkbox.checked && passwordsMatch);
        }

        // Pastikan tombol submit dimulai dalam keadaan disabled saat halaman dimuat
        window.onload = function() {
            toggleSubmitButton(); // Cek status awal saat halaman dimuat
        }

        // Fungsi untuk hanya mengizinkan angka pada input NIK dan memeriksa panjangnya
        function validateNik(event) {
            const nik = document.getElementById('nik');
            const errorMessage = document.getElementById('nik-error');
            const maxLength = 16; // Batas maksimal NIK adalah 16 digit

            // Mengambil key yang ditekan
            const key = event.key;

            // Cek jika karakter yang dimasukkan bukan angka dan bukan backspace
            if (key < '0' || key > '9') {
                if (key !== 'Backspace') {
                    // Mencegah input selain angka dan backspace
                    event.preventDefault();
                }
            }

            // Cek panjang NIK setelah karakter dimasukkan (pastikan tidak lebih dari 16 digit)
            if (nik.value.length >= maxLength && key !== 'Backspace') {
                // Jika panjang NIK sudah 16 dan yang ditekan bukan tombol backspace, mencegah input lebih lanjut
                event.preventDefault();
            }

            // Menghapus pesan error jika NIK valid
            if (nik.value.length === 16) {
                errorMessage.textContent = ''; // Clear the error message
            }
        }

        // Fungsi untuk memvalidasi panjang NIK pada saat input selesai (untuk memberi peringatan jika kurang dari 16 digit)
        function checkNikLength() {
            const nik = document.getElementById('nik');
            const errorMessage = document.getElementById('nik-error');
            if (nik.value.length !== 16) {
                // Tampilkan pesan error jika panjang NIK tidak 16 digit
                errorMessage.textContent = 'NIK harus terdiri dari 16 digit.';
            } else {
                errorMessage.textContent = ''; // Clear the error message if valid
            }
        }

        window.onload = function() {
            // Tidak perlu fungsi lain saat halaman dimuat
        }

        // Pastikan jQuery sudah diimpor dalam HTML kamu.
        $(document).ready(function() {
            $('#pekerjaan').change(function() {
                var pekerjaan = $(this).val();

                // Sembunyikan semua input
                $('.hidden').hide();

                // Tampilkan input berdasarkan pilihan pekerjaan
                if (pekerjaan == 'Pelajar/Mahasiswa/Akademisi') {
                    $('#input-pelajar').show();
                } else if (pekerjaan == 'Profesional' || pekerjaan == 'Wirausaha' || pekerjaan == 'Pemerintahan') {
                    $('#input-profesional-wirausaha').show();
                }
            });
        });
    </script>

</body>

</html>