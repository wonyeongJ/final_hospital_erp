// Notices
$(document).ready(function () {
    var table = $('.datatable').DataTable({
        'scrollCollapse': true,
        'autoWidth': false,
        'responsive': true,
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "language": {
            "info": "_START_-_END_ of _TOTAL_ entries",
            searchPlaceholder: "Search",
            paginate: {
                next: '<i class="ion-chevron-right"></i>',
                previous: '<i class="ion-chevron-left"></i>'
            }
        },
        'columnDefs': [
            { 'type': 'num', 'targets': 0 },
            { 'targets': [1, 2, 3, 4], 'orderable': false } // 열 인덱스 [1, 2, 3, 4]에 해당하는 열에 대해 소팅 비활성화 // Apply string sorting to the 0th column (Korean)
        ],
        'order': [0, 'desc'] // Sort the 0th column (Korean) in ascending order first, then sort the 1st column (numbers) in ascending order.
    });

    // Add PDF, Print, Copy, and CSV buttons
    new $.fn.dataTable.Buttons(table, {
        buttons: [
            {
                extend: 'pdfHtml5',
                text: 'PDF',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'print',
                text: 'Print',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'copyHtml5',
                text: 'Copy',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'csvHtml5',
                text: 'CSV',
                exportOptions: {
                    columns: ':visible'
                }
            }
        ]
    });

    table.buttons().container()
        .appendTo($('.dataTables_wrapper .col-md-6:eq(0)'));
});


// Civil complaints bulletin board,company clubs
$(document).ready(function () {
    var table = $('.datatable2').DataTable({
        'scrollCollapse': true,
        'autoWidth': false,
        'responsive': true,
        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
        "language": {
            "info": "_START_-_END_ of _TOTAL_ entries",
            searchPlaceholder: "Search",
            paginate: {
                next: '<i class="ion-chevron-right"></i>',
                previous: '<i class="ion-chevron-left"></i>'
            }
        },
        'order': [0, 'desc']
    });

    // Add PDF, Print, Copy, and CSV buttons
    new $.fn.dataTable.Buttons(table, {
        buttons: [
            {
                extend: 'pdfHtml5',
                text: 'PDF',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'print',
                text: 'Print',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'copyHtml5',
                text: 'Copy',
                exportOptions: {
                    columns: ':visible'
                }
            },
            {
                extend: 'csvHtml5',
                text: 'CSV',
                exportOptions: {
                    columns: ':visible'
                }
            }
        ]
    });

    table.buttons().container()
        .appendTo($('.dataTables_wrapper .col-md-6:eq(0)'));
});



