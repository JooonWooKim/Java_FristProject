<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
<%
		int num = Integer.parseInt(request.getParameter("num").trim());	//공백제거후 정수형으로 변환
		
		//데이터 베이스 접근
		BoardDAO bdao = new BoardDAO();
		//boardbean타입으로 하나의 게시글을 리턴
		BoardBean bean = bdao.getOneBoard(num);
		
%>
<center>
	<h2>게시글 보기</h2>
	<table width="600" border="1" bgcolor="skyblue">
		<tr height="40">
			<td align="center" width="120">글 번호</td>
			<td align="center" width="180"><%=bean.getNum() %>
			<td align="center" width="120">조회수</td>
			<td align="center" width="180"><%=bean.getReadcount() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">작성자</td>
			<td align="center" width="180"><%=bean.getWriter() %>
			<td align="center" width="120">작성일</td>
			<td align="center" width="180"><%=bean.getReg_date()%></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">이메일</td>
			<td align="center" width="180"><%=bean.getEmail() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">제목</td>
			<td align="center" width="180"><%=bean.getSubject() %></td>
		</tr>
		<tr height="80">
			<td align="center" width="120">글 내용</td>
			<td align="center" width="180"><%=bean.getContent() %></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4">
			<input type="button" value="답글쓰기" onclick="location.href='SessionMain.jsp?center=BoardReWriteForm.jsp?num=<%=bean.getNum()%> &ref=<%=bean.getRef()%> &re_step=<%=bean.getRe_step()%> &re_level=<%=bean.getRe_level()%>'">
			<input type="button" value="수정하기" onclick="location.href='SessionMain.jsp?center=BoardUpdateForm.jsp?num=<%=bean.getNum()%>'">
			<input type="button" value="삭제하기" onclick="location.href='SessionMain.jsp?center=BoardDeleteForm.jsp?num=<%=bean.getNum()%>'">
			<input type="button" value="목록보기" onclick="location.href='SessionMain.jsp?center=BoardList.jsp'">
	</table>
</center>
</body>
</html>