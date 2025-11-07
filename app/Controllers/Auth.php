<?php

namespace App\Controllers;

use App\Models\Mmasyarakat;


use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class Auth extends BaseController
{
    protected $Mmasyarakat;
    public function __construct()
    {
        $this->Mmasyarakat = new Mmasyarakat();
    }
    public function forgotPassword()
    {
        return view('forgot_password');
    }

    public function sendResetLink()
    {
        $email = $this->request->getPost('email');
        $user = $this->Mmasyarakat->where('email', $email)->first();

        if (!$user) {
            return redirect()->back()->with('error', 'Email tidak ditemukan.');
        }

        // Generate token dan waktu kadaluarsa
        $token = bin2hex(random_bytes(32));
        $expires = date('Y-m-d H:i:s', strtotime('+1 hour'));

        $this->Mmasyarakat->update($user['nik'], [
            'reset_token' => $token,
            'token_expired' => $expires
        ]);

        // Kirim email (gunakan email bawaan CodeIgniter)
        $emailService = service('email');
        $emailService->setTo($email);
        $emailService->setFrom('admin@bonebolango.com', 'Admin');
        $emailService->setSubject('Reset Password Anda');
        $link = base_url("reset-password/$token");
        $message = "Hai {$user['nama_pengadu']}, klik link berikut untuk mengatur ulang password kamu: <a href='$link'>$link</a>";
        $emailService->setMessage($message);
        $emailService->send();

        return redirect()->back()->with('success', 'Link reset password telah dikirim ke email Anda.');
    }

    public function resetPassword($token)
    {
        $user = $this->Mmasyarakat->where('reset_token', $token)
            ->where('token_expired >=', date('Y-m-d H:i:s'))
            ->first();

        if (!$user) {
            return redirect()->to('masuk_masyarakat')->with('error', 'Token tidak valid atau sudah kadaluarsa.');
        }

        return view('reset_password', ['token' => $token]);
    }

    public function updatePassword()
    {
        $token = $this->request->getPost('token');
        $password = $this->request->getPost('password');

        $user = $this->Mmasyarakat->where('reset_token', $token)->first();

        if (!$user) {
            return redirect()->to('masuk_masyarakat')->with('error', 'Token tidak valid.');
        }

        $this->Mmasyarakat->update($user['nik'], [
            'password' => password_hash($password, PASSWORD_DEFAULT),
            'reset_token' => null,
            'token_expired' => null
        ]);

        return redirect()->to('masuk_masyarakat')->with('pesanlogin', 'Password berhasil diubah!');
    }
}
