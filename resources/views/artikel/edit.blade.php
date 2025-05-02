@extends('layouts.app')

@section('content')
@include('layouts.navbars.auth.topnav', ['title' => 'Edit Tipe Rumah'])

<div class="container-fluid py-4">
    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header pb-0">
                    <div class="d-flex align-items-center">
                        <p class="mb-0">Edit Tipe Rumah</p>
                    </div>
                </div>
                <div class="card-body">
                    @if (session('success'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <span class="alert-text"><strong>Berhasil!</strong> {{ session('success') }}</span>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    @endif

                    <form action="{{ route('tipe_rumah.update', $tipeRumah->id_tipe_rumah) }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <!-- Lokasi -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Lokasi</label>
                                    <select name="fk_id_lokasi" class="form-control" required>
                                        <option value="">-- Pilih Lokasi --</option>
                                        @foreach($lokasi as $l)
                                            <option value="{{ $l->id_lokasi }}" {{ $tipeRumah->fk_id_lokasi == $l->id_lokasi ? 'selected' : '' }}>
                                                {{ $l->nama_lokasi }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <!-- Nama Tipe -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Nama Tipe Rumah</label>
                                    <input type="text" name="nama_tipe" class="form-control" value="{{ $tipeRumah->nama_tipe }}" required>
                                </div>
                            </div>

                            <!-- Luas Bangunan -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Luas Bangunan (m²)</label>
                                    <input type="number" name="luas_bangunan" class="form-control" value="{{ $tipeRumah->luas_bangunan }}" required>
                                </div>
                            </div>

                            <!-- Luas Tanah -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Luas Tanah (m²)</label>
                                    <input type="number" name="luas_tanah" class="form-control" value="{{ $tipeRumah->luas_tanah }}" required>
                                </div>
                            </div>

                            <!-- Harga -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Harga</label>
                                    <input type="number" name="harga" class="form-control" value="{{ $tipeRumah->harga }}" required>
                                </div>
                            </div>

                            <!-- Jumlah Kamar -->
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Jumlah Kamar</label>
                                    <input type="number" name="jumlah_kamar" class="form-control" value="{{ $tipeRumah->jumlah_kamar }}" required>
                                </div>
                            </div>

                            <!-- Kamar Mandi -->
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>Kamar Mandi</label>
                                    <input type="number" name="jumlah_kamar_mandi" class="form-control" value="{{ $tipeRumah->jumlah_kamar_mandi }}" required>
                                </div>
                            </div>

                            <!-- Bonus -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Bonus</label>
                                    <textarea name="fasilitas_unggulan" rows="3" class="form-control" required>{{ $tipeRumah->fasilitas_unggulan }}</textarea>
                                </div>
                            </div>

                            <!-- Promo -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Promo</label>
                                    <select name="is_promo" class="form-control" required>
                                        <option value="0" {{ $tipeRumah->is_promo == 0 ? 'selected' : '' }}>Tidak</option>
                                        <option value="1" {{ $tipeRumah->is_promo == 1 ? 'selected' : '' }}>Ya</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Upload Gambar -->
                            <div class="col-12">
                                <div class="form-group">
                                    <label>Gambar Baru (kosongkan jika tidak diubah)</label>
                                    <input type="file" name="gambar[]" class="form-control" accept="image/*" multiple>
                                    @if ($tipeRumah->gambarRumah->count())
                                        <div class="mt-2">
                                            <small>Gambar Saat Ini:</small><br>
                                            @foreach($tipeRumah->gambarRumah as $gambar)
                                                <img src="{{ asset('storage/' . $gambar->nama_file) }}" alt="gambar rumah" width="100" class="me-2 mb-2">
                                            @endforeach
                                        </div>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <hr class="horizontal dark mt-4">
                        <button class="btn btn-primary btn-sm" type="submit">Update</button>
                        <a href="{{ route('tipe_rumah.layout') }}" class="btn btn-secondary btn-sm">Kembali</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
