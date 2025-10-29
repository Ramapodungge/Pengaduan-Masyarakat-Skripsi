  document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('confirm_password');
            const submitButton = document.getElementById('submitBtn');

            // Fungsi untuk memeriksa apakah password dan konfirmasi password cocok
            function checkPasswords() {
                const password = passwordInput.value;
                const confirmPassword = confirmPasswordInput.value;

                if (password !== confirmPassword) {
                    submitButton.disabled = true; // Nonaktifkan tombol jika password tidak cocok
                } else {
                    submitButton.disabled = false; // Aktifkan tombol jika password cocok
                }
            }

            // Event listener untuk memeriksa password saat input berubah
            passwordInput.addEventListener('input', checkPasswords);
            confirmPasswordInput.addEventListener('input', checkPasswords);
        });

        <?php if (session()->getFlashdata('pesanlogin')): ?>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "<?= session()->getFlashdata('pesanlogin') ?>",
                showConfirmButton: false,
                timer: 1500
            });
        <?php endif; ?>
        <?php if (session()->getFlashdata('pesansimpan')): ?>
            Swal.fire({
                position: "top-end",
                icon: "success",
                title: "<?= session()->getFlashdata('pesansimpan') ?>",
                showConfirmButton: false,
                timer: 1500
            });
        <?php endif; ?>

        // hapus fungsi
        function hapusInstansi(id) {
            // SweetAlert2 Konfirmasi Hapus
            Swal.fire({
                title: 'Yakin ingin menghapus instansi ini?',
                text: "Data yang dihapus tidak bisa dikembalikan!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus!',
                cancelButtonText: 'Batal',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    // Kirim permintaan untuk menghapus data menggunakan AJAX
                    fetch(`<?= site_url('hapus_instansi/') ?>` + id, {
                            method: 'DELETE'
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                Swal.fire(
                                    'Dihapus!',
                                    'Instansi telah dihapus.',
                                    'success'
                                );
                                // Reload halaman atau hapus baris data dari tabel
                                location.reload(); // Atau hapus baris secara manual
                            } else {
                                Swal.fire(
                                    'Gagal!',
                                    'Terjadi kesalahan saat menghapus data.',
                                    'error'
                                );
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            Swal.fire(
                                'Gagal!',
                                'Terjadi kesalahan, coba lagi nanti.',
                                'error'
                            );
                        });
                }
            });
        }

        function hapusKategori(id) {
            // SweetAlert2 Konfirmasi Hapus
            Swal.fire({
                title: 'Yakin ingin menghapus kategori ini?',
                text: "Data yang dihapus tidak bisa dikembalikan!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus!',
                cancelButtonText: 'Batal',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    // Kirim permintaan untuk menghapus data menggunakan AJAX
                    fetch(`<?= site_url('hapus_kategori/') ?>` + id, {
                            method: 'DELETE'
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                Swal.fire(
                                    'Dihapus!',
                                    'Kategori telah dihapus.',
                                    'success'
                                );
                                // Reload halaman atau hapus baris data dari tabel
                                location.reload(); // Atau hapus baris secara manual
                            } else {
                                Swal.fire(
                                    'Gagal!',
                                    'Terjadi kesalahan saat menghapus data.',
                                    'error'
                                );
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            Swal.fire(
                                'Gagal!',
                                'Terjadi kesalahan, coba lagi nanti.',
                                'error'
                            );
                        });
                }
            });
        }

        function hapusDeskripsi(id) {
            // SweetAlert2 Konfirmasi Hapus
            Swal.fire({
                title: 'Yakin ingin menghapus deskripsi ini?',
                text: "Data yang dihapus tidak bisa dikembalikan!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus!',
                cancelButtonText: 'Batal',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    // Kirim permintaan untuk menghapus data menggunakan AJAX
                    fetch(`<?= site_url('hapus_deskripsi/') ?>` + id, {
                            method: 'DELETE'
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                Swal.fire(
                                    'Dihapus!',
                                    'deskripsi telah dihapus.',
                                    'success'
                                );
                                // Reload halaman atau hapus baris data dari tabel
                                location.reload(); // Atau hapus baris secara manual
                            } else {
                                Swal.fire(
                                    'Gagal!',
                                    'Terjadi kesalahan saat menghapus data.',
                                    'error'
                                );
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            Swal.fire(
                                'Gagal!',
                                'Terjadi kesalahan, coba lagi nanti.',
                                'error'
                            );
                        });
                }
            });
        }

       

        // FULLSIZE GAMBA
        function showFullImage() {
            // Menyembunyikan thumbnail dan menampilkan gambar penuh
            document.getElementById("myImage").style.display = "none";
            document.getElementById("fullImage").style.display = "block";
        }

        function showThumbnail() {
            // Menampilkan kembali thumbnail dan menyembunyikan gambar penuh
            document.getElementById("myImage").style.display = "block";
            document.getElementById("fullImage").style.display = "none";
        }

        // validasi upload file
        document.getElementById('uploadForm').addEventListener('submit', function(event) {
            // Mendapatkan elemen file input
            const fileInput = document.getElementById('file');
            const errorMessage = document.getElementById('error-message');

            // Mendapatkan file yang dipilih
            const file = fileInput.files[0];

            // Cek apakah file ada
            if (!file) {
                errorMessage.textContent = "Harap pilih file terlebih dahulu.";
                errorMessage.style.display = "block";
                event.preventDefault(); // Mencegah form dikirim
                return;
            }

            // Validasi ekstensi file
            const allowedExtensions = ['pdf', 'docx', 'doc', 'txt', 'odt'];
            const fileExtension = file.name.split('.').pop().toLowerCase();
            if (!allowedExtensions.includes(fileExtension)) {
                errorMessage.textContent = "Ekstensi file tidak valid. Harap unggah file dengan ekstensi .pdf, .docx, .doc, .txt, atau .odt.";
                errorMessage.style.display = "block";
                event.preventDefault(); // Mencegah form dikirim
                return;
            }

            // Validasi ukuran file (maksimal 5MB dan minimal 2MB)
            const maxSize = 2 * 1024 * 1024; // 5MB dalam bytes

            if (file.size > maxSize) {
                errorMessage.textContent = "Ukuran file terlalu besar. Harap unggah file yang lebih kecil dari 2MB.";
                errorMessage.style.display = "block";
                event.preventDefault(); // Mencegah form dikirim
                return;
            }

            // Jika validasi sukses, sembunyikan pesan kesalahan
            errorMessage.style.display = "none";
        });