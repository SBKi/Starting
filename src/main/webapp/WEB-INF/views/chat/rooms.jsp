<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div>
		<c:forEach var="room" items="${list}">
			<ul>
				<li><a href="/chat/room?id=beomki123">${room.roomid}</a></li>
			</ul>
		</c:forEach>
		</div>
	</div>
	<form action="room" method="post">
		<input type="text" name="id" class="form-control">
		<button class="btn btn-secondary btn-create">개설하기</button>
	</form>
      <script type="text/javascript">
            $(document).ready(function(){

                var roomId = ${room.roomid};

                if(roomId != null)
                    alert(roomId + "방이 개설되었습니다.");

                $(".btn-create").on("click", function (e){
                    e.preventDefault();

                    var name = $("input[name='id']").val();

                    if(name == "")
                        alert("Please write the name.")
                    else
                        $("form").submit();
                });

            });
        </script>
</body>
</html>