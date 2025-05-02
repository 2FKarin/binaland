<?php
namespace App\Http\Controllers;

use App\Models\Tipe_rumah;
use Illuminate\Http\Request;
use App\Models\Gambar_rumah;
use App\Models\Lokasi;
use Illuminate\Support\Facades\Storage;

class TipeRumahController extends Controller
{
    public function index()
    {
        $tipeRumah = Tipe_rumah::with(['lokasi', 'gambarRumah'])->get();
        return view('tipe_rumah.layout', compact('tipeRumah'));
    }
    public function add()
    {
        $lokasi = Lokasi::all();
        return view('tipe_rumah.add', compact('lokasi'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'fk_id_lokasi' => 'required|exists:lokasi,id_lokasi',
            'nama_lokasi' => 'required|string|max:255',
            'luas_bangunan' => 'required|numeric',
            'luas_tanah' => 'required|numeric',
            'harga' => 'required|numeric',
            'jumlah_kamar' => 'required|integer',
            'jumlah_kamar_mandi' => 'required|integer',
            'fasilitas_unggunlan' => 'required|string',
            'is_promo' => 'required|in:0,1',
            'gambar.*' => 'image|mimes:jpeg,png,jpg|max:2048'
        ]);

        $tipe = Tipe_rumah::create([
            'fk_id_lokasi' => $request->fk_id_lokasi,
            'nama_lokasi' => $request->nama_lokasi,
            'luas_bangunan' => $request->luas_bangunan,
            'luas_tanah' => $request->luas_tanah,
            'harga' => $request->harga,
            'jumlah_kamar' => $request->jumlah_kamar,
            'jumlah_kamar_mandi' => $request->jumlah_kamar_mandi,
            'fasilitas_unggulan' => $request->bonus,
            'is_promo' => $request->is_promo
        ]);

        if($request->hasFile('gambar')) {
            foreach ($request->file('gambar') as $file) {
                $path = $file->store('gambar_rumah', 'public');
                Gambar_rumah::create([
                    'fk_id_tipe_rumah' => $tipe->id_tipe_rumah,
                    'gambar' => $path
                ]);
            }
        }

        return redirect()->route('tipe_rumah.layout')->with('success', 'Tipe rumah berhasil ditambahkan.');
    }

    // Tambahan fungsi untuk CRUD lainnya
    public function show($id)
    {
        $tipe = Tipe_rumah::with(['lokasi', 'gambarRumah'])->findOrFail($id);
        return view('tipe_rumah.show', compact('tipe'));
    }

    public function destroy($id)
    {
        Tipe_rumah::findOrFail($id)->delete();
        return redirect()->route('tipe_rumah.layout')->with('success', 'Data berhasil dihapus');
    }

    public function edit($id)
    {
        $tipe = Tipe_rumah::findOrFail($id);
        return view('tipe_rumah.edit', compact('tipe'));
    }
}
