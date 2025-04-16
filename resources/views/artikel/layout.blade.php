@extends('layouts.app', ['class' => 'g-sidenav-show bg-gray-100'])

@section('content')
@include('layouts.navbars.auth.topnav', ['title' => 'Artikel'])
<div class="container-fluid py-4">
    <div class="row">
        <div class="col-12">
            <div class="card mb-4">
                <div class="card-header pb-0 d-flex align-items-center">
                    <h6>Artikel</h6>
                    <a href="{{ route('artikel.add') }}" class="btn bg-gradient-primary btn-sm ms-auto">
                        <span class="fa fa-plus">&nbsp;</span> Tambah
                    </a>
                </div>
                <div class="card-body px-0 pt-0 pb-2">
                    <div class="table-responsive px-5 py-2">
                        <table id="dataTable-artikel" class="table align-items-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-center">Foto</th>
                                    <th class="text-center">Kategori</th>
                                    <th class="text-center">Judul</th>
                                    <th class="text-center">Publikasi</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- DataTables Script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<script>
    $(document).ready(function() {
        $('#dataTable-artikel').DataTable({
            language: {
                url: "https://cdn.datatables.net/plug-ins/1.11.5/i18n/Indonesian.json",
                paginate: {
                    previous: "<",
                    next: ">"
                },
            },
            pageLength: 10,
            ajax: {
                url: '{{ route("artikel.data") }}',
                type: 'POST',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                dataSrc: ''
            },
            rowCallback: function(row, data) {
                $(row).on('click', function() {
                    window.location.href = '/artikel/' + data.id;
                });
            },
            columns: [
                {
                    data: 'gambar',
                    render: function(data) {
                        var path = '/storage/artikel/' + data;
                        return '<img src="' + path + '" class="img-fluid" style="max-width:100px;max-height:100px;">';
                    }
                },
                {
                    data: 'tanggal',
                    render: function(data) {
                        return '<p class="text-xs font-weight-bold mb-0">' + data + '</p>';
                    }
                },
                {
                    data: 'judul',
                    render: function(data, type, row) {
                        return '<p class="text-xs font-weight-bold mb-0">' + data + '</p><p class="text-xs text-secondary mb-0">' + row.company + '</p>';
                    }
                },
                {
                    data: 'tanggal',
                    render: function(data) {
                        return '<p class="text-xs font-weight-bold mb-0">' + data + '</p>';
                    }
                },
                {
                    data: null,
                    render: function(data) {
                        return `
                            <a href="/artikel/${data.id}/edit" class="btn btn-sm bg-gradient-info">
                                <span class="fa fa-pencil"></span> Edit
                            </a>
                            <a href="/artikel/${data.id}/delete" class="btn btn-sm bg-gradient-danger">
                                <span class="fa fa-trash"></span> Hapus
                            </a>`;
                    }
                }
            ]
        });
    });
</script>
@endsection