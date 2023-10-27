//공지사항, 사내동호회
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
            { 'type': 'num', 'targets': 0 } // 0번째 열에 문자열 정렬 적용 (한글)
        ],
        'order': [0, 'desc'] // 0번째 열 (한글) 먼저 오름차순 정렬, 그 후 1번째 열 (숫자) 오름차순 정렬
    });

    // PDF와 인쇄 버튼 추가
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
            }
        ]
    });

    table.buttons().container()
        .appendTo($('.dataTables_wrapper .col-md-6:eq(0)'));
});


// 민원게시판
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
        'order': [1, 'desc']
    });

    // PDF와 인쇄 버튼 추가
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
            }
        ]
    });

    table.buttons().container()
        .appendTo($('.dataTables_wrapper .col-md-6:eq(0)'));
});


