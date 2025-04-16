<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Artikel;
use Illuminate\Support\Facades\Storage;
use DataTables;

class ArtikelController extends Controller
{
    public function index()
    {
        return view('artikel.layout'); // halaman Blade yang sudah kamu buat
    }
    public function data(Request $request)
{
    try {
        $data = Artikel::select(['id_artikel', 'gambar', 'kategori', 'judul', 'company', 'tanggal']);
        return datatables()->of($data)->make(true);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}


    public function add()
    {
        return view('artikel.add'); // tampilkan form tambah artikel
    }

    public function edit($id)
    {
        $artikel = Artikel::findOrFail($id);
        return view('artikel.edit', compact('artikel'));
    }

    public function delete($id)
    {
        $artikel = Artikel::findOrFail($id);
        if ($artikel->gambar && Storage::disk('public')->exists('artikel/' . $artikel->gambar)) {
            Storage::disk('public')->delete('artikel/' . $artikel->gambar);
        }
        $artikel->delete();
        return redirect()->route('artikel.layout')->with('success', 'Artikel berhasil dihapus');
    }

    // Tambahkan store dan update jika ingin lengkap.
}

