<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sun.student.model.vo.*"%>
<%
	ArrayList<Student> list = (ArrayList<Student>)request.getAttribute("list");
	//서블렛에서 리스트 보내주기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students Information</title>
<style>
    div, header, nav, footer, section, aside, article{
            border:1px solid red; 
            box-sizing: border-box;
            display:block;
        }

    .wrap{
            width:1000px;
            height:800px;
            margin:auto;
        }

    .wrap>*{width:100%;}

	table, th, td {
	 border : 1px black solid
	}
	
	table{
		width : max-content
		height = max-content
		margin = auto
	}
	
	th{
	background :  rgb(224,224,224)
	}

    th{
        color:black;
    }

        nav{height:5%;}

        nav{
                background-color: rgb(3,33,89);
                margin:5px 0px;
         }
        nav>ul{
                list-style-type: none;
                margin:0;
                padding:0;
                height:100%;
            }
        nav li{
            float:left;
            width:33%;
            height:100%;
            text-align:center;
            font-size:18px;
            line-height:35px;
        }
        nav li a{
            text-decoration:none;
            color:white;
        }
        nav li:hover{
            background-color:salmon;
            cursor:pointer;
        }

        caption{
            text-align:left;
        }
        
        header>section{
            height:100%;
            float:left;
        }
        
        #header_1{width:20%; position:relative;}
        
       header{height:15%;}

</style>
</head>
<body>
    <div class="wrap">
     <header>
            <section id="header_1">
                <a href="">
                	<!--왜 에러나요?ㅜㅜ -->
                    <img src='/Users/wangsubin/Backend/sunProject/WebContent/resources/images/logo/sunLogo1.png'>
                </a>
            </section>
        </header>
        <nav>
            <ul>
                <li><a href="#">학생 관리</a></li>
                <li><a href="#">교수 관리</a></li>
                <li><a href="#">강의 관리</a></li>
            </ul>
        </nav>
        
	<table>
        <caption>학생 목록</caption>
		<thead>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학부</th>
				<th>학과</th>
				<th>학년</th>
				<th>지도교수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
				<td>1</td>
			</tr>
			<tr>
				<td>2</td>
				<td>2</td>
				<td>2</td>
				<td>2</td>
				<td>2</td>
				<td>2</td>
			</tr>
			<tr>
				<td>3</td>
				<td>3</td>
				<td>3</td>
				<td>3</td>
				<td>3</td>
				<td>3</td>
			</tr>
		</tbody>
	</table>
 </div>
</body>
</html>