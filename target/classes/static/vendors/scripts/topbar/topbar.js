$(document).ready(function () {
    loadImportantNotices();

    function loadImportantNotices() {
        $.ajax({
            url: '/noticeImportantList',
            type: 'GET',
            dataType: 'json',
            success: function (noticeList) {
                // 첫 번째 행을 즉시 표시합니다.
                displayImportantNotice(noticeList[0]);

                // 각 이후 행을 일정한 간격으로 순차적으로 표시합니다.
                var index = 1;
                setInterval(function () {
                    displayImportantNotice(noticeList[index]);
                    index = (index + 1) % noticeList.length;
                }, 3000);
            },
            error: function (error) {
                console.error('중요 공지사항을 가져오는 중 오류가 발생했습니다:', error);
            }
        });
    }
        function displayImportantNotice(notice) {
			 $('.notice-row').remove();
            // Create a new row
            var row = $('<tr>').addClass('notice-row');

            if (notice.notImportant === 1) {
                row.css({
                    'margin-bottom': '2%', // Adjust this margin as needed
                    'padding': '10px' // Add padding for better spacing
                });
                var cell = $('<td>').addClass('notice-cell').append($('<span>').text('중요공지').css({
                    'border': '2px solid #ffc6c9',
                    'background-color': '#ffe3e4',
                    'color': '#ff4e59',
                    'padding': '5px' // Add padding for better styling
                }));
                row.append(cell);
            } else {
                row.css({
                    'margin-bottom': '2px', // Adjust this margin as needed
                    'padding': '10px' // Add padding for better spacing
                });
                row.append($('<td>').addClass('notice-cell').text(''));
            }

            row.append($('<td>').addClass('notice-cell').append($('<a>').attr('href', '/board/notice/data/' + notice.notCd).text(notice.notTitle).css({
                'color': 'black',
                'font-size': '20px' // Set font size for titles
            })));

            // Append the new row to the existing tbody
            $('.notice-table tbody').append(row);

            // Slide up the newly added row
            row.hide().slideDown();
        }
    });