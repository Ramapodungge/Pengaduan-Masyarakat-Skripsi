<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

$routes->get('/masuk_admin', 'Login::index');
$routes->get('/buat_akun', 'Login::buat');
$routes->get('/akun_saya', 'Pengguna::profile');
// proses kategori
$routes->post('/simpan_kategori', 'Kategori::proses');
$routes->post('/ubah_kategori/(:num)', 'Kategori::proses_ubah/$1');
$routes->delete('/hapus_kategori/(:segment)', 'Kategori::hapus/$1');
//proses deksripsi
$routes->post('/tambah_deskripsi', 'Kategori::proses_deskripsi');
$routes->post('/ubah_deskripsi/(:num)', 'Kategori::proses_ubah_deskripsi/$1');
$routes->delete('/hapus_deskripsi/(:segment)', 'Kategori::hapus_deskripsi/$1');

// proses instansi
$routes->post('/simpan_instansi', 'Instansi::proses');
$routes->post('/ubah_instansi/(:num)', 'Instansi::proses_ubah/$1');
$routes->delete('/hapus_instansi/(:segment)', 'Instansi::hapus/$1');

// proses buat akun
$routes->post('/buatproses', 'Login::proses_buat');
// proses login
$routes->post('/loginproses', 'Login::proses_login');
$routes->get('/keluar_admin', 'Login::keluar');
// ADMIN PAGES
$routes->get('/dashboard', 'Admin::index');
$routes->get('/daftaraduan', 'AduanAdmin::index');
$routes->get('/daftaraduanoperator', 'AduanAdmin::operatoraduan');
$routes->get('/detail_pengaduan/(:num)', 'AduanAdmin::detail/$1');
$routes->get('/pengguna-masyarakat', 'Pengguna::masyarakat');
$routes->get('/instansi', 'Instansi::index');
$routes->get('/kategori', 'Kategori::index');
$routes->get('/operator', 'Pengguna::index');
$routes->get('/laporan/pengaduan_laporan', 'AduanAdmin::viewlaporan');

//proses pengaduan
$routes->post('/terima_pengaduan/(:num)', 'AduanAdmin::proses_terima/$1');
$routes->post('/alokasi_pengaduan/(:num)', 'AduanAdmin::proses_alokasi/$1');
$routes->post('/proses_pengaduan/(:num)', 'AduanAdmin::proses_pengadu/$1');
$routes->post('/selesai_pengaduan/(:num)', 'AduanAdmin::proses_selesai/$1');
$routes->post('/tolak_pengaduan/(:num)', 'AduanAdmin::proses_tolak/$1');

//proses proses masyarakat
$routes->post('/regis_masyrakat', 'Masyarakat::proses_regis');
$routes->post('/login_masyrakat', 'Masyarakat::proses_login');
$routes->post('/reset-password-masyrakat/(:num)', 'Masyarakat::proses_resetpass/$1');
$routes->post('/update-data-masyrakat/(:num)', 'Masyarakat::proses_update_data_profile/$1');
$routes->get('/logout_masyarakat', 'Masyarakat::keluar_masyarakat');
//masyarakat pages
$routes->get('/', 'Masyarakat::index');
$routes->get('/aduan_masyarakat', 'Masyarakat::aduan');
$routes->get('/detail_aduan_masyarakat/(:num)', 'Masyarakat::detail_aduan/$1');
$routes->get('/buataduan', 'Masyarakat::buat');
$routes->get('/profile', 'Masyarakat::akunku');
$routes->get('/masuk_masyarakat', 'Masyarakat::login');
$routes->get('/daftar_masyarakat', 'Masyarakat::daftar');
$routes->get('/masyarakat-pages', 'Masyarakat::masyarakat');

//proses feedback
$routes->post('/proses_feedback', 'Masyarakat::proses_feedback');
$routes->post('/proses_edit_feedback/(:num)', 'Masyarakat::proses_edit_feedback/$1');

//proses buat aduan
$routes->post('/buat_aduan', 'Masyarakat::proses_buat_aduan');

// proses cari penaduan
$routes->get('/Pengaduan/search', 'Masyarakat::search');

//laporan
$routes->get('/laporan_masyarakat', 'Admin::laporan_masyarakat');
$routes->get('/laporan_pengaduan', 'Admin::laporan_pengaduan');
$routes->get('/formulir_pengaduan/(:num)', 'Admin::formulir/$1');

//untuk link download
$routes->get('download_bukti/(:any)', 'Masyarakat::download/$1');
