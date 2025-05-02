@extends('layouts.app')

@section('content')
<div class="container">
    <h2>Edit Tipe Rumah</h2>

    <form action="{{ route('tipe_rumah.update', $tipeRumah->id) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <div class="form-group">
            <label for="fk_id_lokasi">Lokasi</label>
            <select name="fk_id_lokasi" id="fk_id_lokasi" class="form-control" required>
                @foreach($lokasi as $lok)
                    <option value="{{ $lok->id }}" {{ $lok->id == $tipeRumah->fk_id_lokasi ? 'selected' : '' }}>
                        {{ $lok->nama_lokasi }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="form-group">
            <label for="nama_lokasi">Nama Lokasi</label>
            <input type="text" name="nama_lokasi" class="form-control" value="{{ $tipeRumah->nama_lokasi }}" required>
        </div>

        <div class="form-group">
            <label for="luas_bangunan">Luas Bangunan (m²)</label>
            <input type="number" name="luas_bangunan" class="form-control" value="{{ $tipeRumah->luas_bangunan }}" required>
        </div>

        <div class="form-group">
            <label for="luas_tanah">Luas Tanah (m²)</label>
            <input type="number" name="luas_tanah" class="form-control" value="{{ $tipeRumah->luas_tanah }}" required>
        </div>

        <div class="form-group">
            <label for="harga">Harga</label>
            <input type="number" name="harga" class="form-control" value="{{ $tipeRumah->harga }}" required>
        </div>

        <div class="form-group">
            <label for="jumlah_kamar">Jumlah Kamar</label>
            <input type="number" name="jumlah_kamar" class="form-control" value="{{ $tipeRumah->jumlah_kamar }}" required>
        </div>

        <div class="form-group">
            <label for="jumlah_kamar_mandi">Jumlah Kamar Mandi</label>
            <input type="number" name="jumlah_kamar_mandi" class="form-control" value="{{ $tipeRumah->jumlah_kamar_mandi }}" required>
        </div>

        <div class="form-group">
            <label for="bonus">Bonus</label>
            <input type="text" name="bonus" class="form-control" value="{{ $tipeRumah->bonus }}">
        </div>

        <div class="form-group">
            <label for="is_promo">Status Promo</label>
            <select name="is_promo" class="form-control" required>
                <option value="0" {{ $tipeRumah->is_promo == 0 ? 'selected' : '' }}>Tidak Promo</option>
                <option value="1" {{ $tipeRumah->is_promo == 1 ? 'selected' : '' }}>Promo</option>
            </select>
        </div>

        <div class="form-group">
            <label for="gambar">Upload Gambar Baru (Opsional)</label>
            <input type="file" name="gambar[]" class="form-control" multiple>
            <small class="text-muted">Biarkan kosong jika tidak ingin menambah gambar baru.</small>
        </div>

        <div class="mb-3">
            <label>Gambar Rumah Saat Ini:</label>
            <div class="row">
                @foreach ($tipeRumah->gambar as $img)
                    <div class="col-md-3 mb-2">
                        <img src="{{ asset('storage/' . $img->gambar) }}" class="img-fluid rounded">
                    </div>
                @endforeach
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <a href="{{ route('tipe_rumah.layout') }}" class="btn btn-secondary">Kembali</a>
    </form>
</div>
@endsection
