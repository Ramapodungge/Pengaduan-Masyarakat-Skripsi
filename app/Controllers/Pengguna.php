<?php

namespace App\Controllers;

use App\Models\Madmin;
use App\Models\Mpengaduan;
use App\Models\Mmasyarakat;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class Pengguna extends BaseController
{
    protected $Madmin;
    protected $Mpengaduan;
    protected $Mmasyarakat;

    public function __construct()
    {
        $this->Madmin = new Madmin();
        $this->Mpengaduan = new Mpengaduan();
        $this->Mmasyarakat = new Mmasyarakat();
    }
    public function index()
    {
        $pengaduan_perstatus = $this->Mpengaduan->getPengaduanByDetailStatus();
        $operator = $this->Madmin->getoperator();
        $data = [
            'title' => 'Operator',
            'operator' => $operator,
            'pengaduan_perstatus' => $pengaduan_perstatus,
        ];
        return view('admin_pages/v_operator', $data);
    }
    public function masyarakat()
    {
        $pengaduan_perstatus = $this->Mpengaduan->getPengaduanByDetailStatus();
        $masyarakat = $this->Mmasyarakat->findAll();

        $data = [
            'title' => 'Masyarakat',
            'masyarakat' => $masyarakat,
            'pengaduan_perstatus' => $pengaduan_perstatus,
        ];
        return view('admin_pages/v_masyarakat', $data);
    }
    public function profile()
    {
        $id = session()->get('admin_id');

        $pengaduan_perstatus = $this->Mpengaduan->getPengaduanByDetailStatus();
        $pengguna1row = $this->Madmin->where('id_admin', $id)->findAll();
        if (!$pengguna1row) {
            return redirect()->back()->with('error', 'Data pengaduan tidak ditemukan');
        }

        // Karena hasil formulirGet berupa array banyak, kita ambil row pertama
        $penggunarow1 = $pengguna1row[0];
        $operator = $this->Madmin->getoperator();
        $data = [
            'title' => 'Profile',
            'operator' => $operator,
            'pengguna1row' => $penggunarow1,
            'pengaduan_perstatus' => $pengaduan_perstatus
        ];
        return view('admin_pages/v_akun_saya', $data);
    }
    public function ubah_akun($id_admin)
    {
        $data = [
            'id_admin' => $id_admin,
            'nama_admin' => $this->request->getVar('nama'),
            'password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT),
        ];
        $this->Madmin->save($data);
        return redirect()->back()->with('pesansimpan', 'Perubahan Berhasil Disimpan');
    }
}
