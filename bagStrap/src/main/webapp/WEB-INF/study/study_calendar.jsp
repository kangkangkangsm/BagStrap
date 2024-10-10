<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- <jsp:include page="/layout/sharedHeader.jsp"></jsp:include> -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <title>MyCalendar</title>
    <style>
        #calendar {
            width: 80%;  /* 캘린더의 너비를 필요에 따라 조정 */
            height: 60%; /* 캘린더의 높이를 필요에 따라 조정 */
            margin: 0 auto; /* 캘린더를 수평으로 중앙 정렬 */
        }
        #calendarBtn {
            margin: 10px 0;
        }
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                editable: true,
                selectable: true,
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                },
                views: {
                    dayGridMonth: {
                        buttonText: 'Month'
                    },
                    timeGridWeek: {
                        buttonText: 'Week'
                    },
                    timeGridDay: {
                        buttonText: 'Day'
                    },
					listMonth:{
						buttonText: 'List'
					}
                },
                events: [], // 초기 이벤트 x
                select: function(info) {
                   
                    window.selectedInfo = info; // 선택된 정보를 전역 변수에 저장
                },
                eventClick: function(info) {
                    currentEvent = info.event; // 클릭한 이벤트 저장
                }
            });

            calendar.render();

            // 일정 추가
            document.getElementById('add').addEventListener('click', function() {
                if (window.selectedInfo) {
                    var title = prompt('일정 제목을 입력하세요:');
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: window.selectedInfo.startStr,
                            end: window.selectedInfo.endStr,
                            allDay: window.selectedInfo.allDay
                        });
                        calendar.unselect(); // 선택 해제
                        window.selectedInfo = null; // 선택된 정보 초기화
                    }
                } else {
                    alert('일정을 추가할 날짜를 선택하세요.');
                }
            });

            // 일정 수정
            document.getElementById('edit').addEventListener('click', function() {
                if (window.currentEvent) {
                    var newTitle = prompt('새 일정 제목을 입력하세요:', window.currentEvent.title);
                    if (newTitle) {
                        window.currentEvent.setProp('title', newTitle);
                    }
                } else {
                    alert('편집할 일정을 먼저 선택하세요.');
                }
            });

            // 일정 삭제
            document.getElementById('delete').addEventListener('click', function() {
                if (window.currentEvent) {
                    if (confirm('정말로 이 일정을 삭제하시겠습니까?')) {
                        window.currentEvent.remove();
                        window.currentEvent = null; // 현재 이벤트 초기화
                    }
                } else {
                    alert('삭제할 일정을 먼저 선택하세요.');
                }
            });
        });
    </script>
</head>
<body>
    <div id="calendarBtn">
        <button id="add">추가</button>
        <button id="edit">변경</button>
        <button id="delete">삭제</button>
    </div>
    <div id='calendar'></div>
</body>
</html>