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
        $pengaduan_perstatus = $this->Mpengaduan->getPengaduanByDetailStatus();
        $operator = $this->Madmin->getoperator();
        $data = [
            'title' => 'Profile',
            'operator' => $operator,
            'pengaduan_perstatus' => $pengaduan_perstatus
        ];
        return view('admin_pages/v_akun_saya', $data);
    }
}
