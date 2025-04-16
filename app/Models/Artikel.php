<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Artikel extends Model
{
    protected $table = 'artikel'; // Nama tabel
    protected $fillable = ['judul', 'gambar', 'kategori', 'company', 'tanggal'];
    protected $primaryKey = 'id_artikel';
    public $timestamps = false;


    // Jika ingin format tanggal otomatis
    //protected $dates = ['created_at', 'updated_at'];

    // Relasi jika punya model Kategori (opsional, tergantung kebutuhan)
    // public function kategoriRelasi()
    // {
    //     return $this->belongsTo(Kategori::class, 'kategori', 'id');
    // }
}

