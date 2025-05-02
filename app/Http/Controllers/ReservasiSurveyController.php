<?php
namespace App\Http\Controllers;

use App\Models\Reservasi_lokasi;
use App\Models\Reservasi_survey;
use App\Models\Lokasi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReservasiSurveyController extends Controller
{
    public function index()
    {
        $reservasi = Reservasi_lokasi::with(['survey', 'lokasi'])->get();
        return view('reservasi_survey.layout', compact('reservasi'));
    }
    public function add()
    {
        $lokasi = Lokasi::all();
        return view('reservasi_survey.add', compact('lokasi'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'fk_id_lokasi' => 'required|exists:lokasi,id_lokasi',
            'nama_pemesan' => 'required',
            'nomor_telepon' => 'required',
            'email' => 'required|email',
            'tanggal_survey' => 'required|date',
            'jam_survey' => 'required',
            'status' => 'required|in:pending,dikonfirmasi,batal'
        ]);

        DB::beginTransaction();
        try {
            $survey = Reservasi_survey::create([
                'nama_pemesan' => $request->nama_pemesan,
                'nomor_telepon' => $request->nomor_telepon,
                'email' => $request->email,
                'tanggal_survey' => $request->tanggal_survey,
                'jam_survey' => $request->jam_survey,
                'catatan' => $request->catatan,
                'status' => $request->status,
            ]);

            Reservasi_lokasi::create([
                'fk_id_reservasi' => $survey->id_reservasi,
                'fk_id_lokasi' => $request->fk_id_lokasi
            ]);

            DB::commit();
            return redirect()->route('reservasi_survey.layout')->with('success', 'Reservasi berhasil disimpan.');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors('Gagal menyimpan reservasi: ' . $e->getMessage());
        }
    }
    public function edit($id)
    {
        // ... tampilan form edit
    }

    public function detail($id)
    {
        $reservasi = Reservasi_survey::with([
            'reservasiLokasi.lokasi.gambarLokasi'
        ])->findOrFail($id);

        return view('reservasi_survey.detail', compact('reservasi'));
    }
    
    public function destroy($id)
    {
        $reservasi = Reservasi_lokasi::findOrFail($id);
        $reservasi->delete();

        return redirect()->route('reservasi_survey.layout')->with('success', 'Data berhasil dihapus');
    }
}
