<?php
namespace App\Http\Controllers;

use App\Models\Lokasi;
use App\Models\Gambar_lokasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;


class LokasiController extends Controller
{
    public function index()
    {
        $lokasi = Lokasi::with('gambarLokasi')->get();
        return view('lokasi.layout', compact('lokasi'));
    }
    public function add()
    {
        return view('lokasi.add');
    }

    public function store(Request $request)
    {
        // Validasi sederhana
        $request->validate([
            'nama_lokasi' => 'required',
            'company' => 'required',
            'deskripsi' => 'required',
            'provinsi' => 'required',
            'kota' => 'required',
            'kecamatan' => 'required',
            'alamat' => 'required',
            'gambar.*' => 'image|mimes:jpeg,png,jpg|max:2048'
        ]);

        // 1. Simpan lokasi terlebih dahulu
        $lokasi = Lokasi::create([
            'nama_lokasi' => $request->nama_lokasi,
            'company' => $request->company,
            'deskripsi' => $request->deskripsi,
            'provinsi' => $request->provinsi,
            'kota' => $request->kota,
            'kecamatan' => $request->kecamatan,
            'alamat' => $request->alamat
        ]);

        // 2. Ambil ID lokasi baru untuk digunakan pada gambar
        $lokasiId = $lokasi->id_lokasi;

        // 3. Simpan gambar-gambar
        if ($request->hasFile('gambar')) {
            foreach ($request->file('gambar') as $file) {
                $path = $file->store('lokasi', 'public'); // simpan ke storage/app/public/lokasi
                Gambar_lokasi::create([
                    'fk_id_lokasi' => $lokasiId,
                    'gambar' => $path
                ]);
            }
        }

        return redirect()->route('lokasi.layout')->with('success', 'Data lokasi dan gambar berhasil disimpan!');
    }

    public function edit($id)
{
    $lokasi = Lokasi::with('gambarLokasi')->findOrFail($id);
    return view('lokasi.edit', compact('lokasi'));
}

public function update(Request $request, $id)
{
    $request->validate([
        'nama_lokasi' => 'required|string|max:255',
        'company' => 'required|string|max:255',
        'deskripsi' => 'required|string',
        'provinsi' => 'required|string',
        'kota' => 'required|string',
        'kecamatan' => 'required|string',
        'alamat' => 'required|string',
        'gambar.*' => 'nullable|image|mimes:jpeg,png,jpg|max:2048'
    ]);

    DB::beginTransaction();
    try {
        $lokasi = Lokasi::findOrFail($id);
        $lokasi->update([
            'nama_lokasi' => $request->nama_lokasi,
            'company' => $request->company,
            'deskripsi' => $request->deskripsi,
            'provinsi' => $request->provinsi,
            'kota' => $request->kota,
            'kecamatan' => $request->kecamatan,
            'alamat' => $request->alamat,
        ]);

        if ($request->hasFile('gambar')) {
            // Hapus gambar lama (jika perlu)
            foreach ($lokasi->gambarLokasi as $gambar) {
                Storage::delete('public/uploads/' . $gambar->nama_file);
                $gambar->delete();
            }

            // Upload gambar baru
            foreach ($request->file('gambar') as $file) {
                $namaFile = time() . '_' . $file->getClientOriginalName();
                $file->storeAs('public/uploads', $namaFile);

                GambarLokasi::create([
                    'fk_id_lokasi' => $lokasi->id,
                    'nama_file' => $namaFile,
                ]);
            }
        }

        DB::commit();
        return redirect()->route('lokasi.layout')->with('success', 'Data lokasi berhasil diperbarui!');
    } catch (\Exception $e) {
        DB::rollback();
        return back()->with('error', 'Terjadi kesalahan: ' . $e->getMessage());
    }
}

    public function destroy($id)
    {
        $lokasi = Lokasi::findOrFail($id);
        $lokasi->delete();
        return redirect()->route('lokasi.layout')->with('success', 'Lokasi berhasil dihapus.');
    }

    public function detail($id)
    {
        $lokasi = Lokasi::with('gambarLokasi')->findOrFail($id);
        return view('lokasi.detail', compact('lokasi'));
    }
}
