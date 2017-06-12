<%--
  Created by IntelliJ IDEA.
  User: win8
  Date: 2017/6/1
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-static-top" style="margin-left: 0;">
    <div class="container">
        <div class="navbar-header">
            <a href="/user/Main.jsp" class="navbar-brand"><b>韩山师范学院</b>宿舍管理</a>
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                <i class="fa fa-bars"></i>
            </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
            <ul class="nav navbar-nav">
                <li ><a href="/user/Main.jsp">首页</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">查询入口<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/user/MySituation.jsp">我的请假</a></li>
                        <li><a href="/user/MyRepair.jsp">我的报修</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">申请入口 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/user/AddSituation.jsp">请假申请</a></li>
                        <li><a href="/user/AddRepair.jsp">报修申请</a></li>
                    </ul>
                </li>
            </ul>
                <div class="navbar-form navbar-left form-group">
                    <input type="text" class="form-control" id="reportSearch" placeholder="搜索本站...">
                    <button class="btn btn-black" type="submit" onclick="searchReport(1)">
                        <i class="glyphicon glyphicon-search"></i>
                    </button>
                </div>
        </div>
        <!-- /.navbar-collapse -->
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <img src="/static/upload/image/avatar.png" class="user-image" alt="User Image">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                    </a>
                    <ul class="dropdown-menu" style="border-color: #000000;">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <img src="/static/upload/image/avatar.png" class="img-circle" alt="User Image">

                            <p style="color: #000000;">
                                ${sessionScope.userName}
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="text-center">
                                <a href="/stulogout.do" class="btn btn-default btn-flat">注销登录</a>
                            </div>
                        </li>
                    </ul>
                </li>

            </ul>
        </div>
        <!-- /.navbar-custom-menu -->
    </div>
    <!-- /.container-fluid -->
</nav>

<script>
    var totalNum;
    var currentPage;
    var pageAmount;
    var pre = (currentPage-1);
    var next = (currentPage+1);
    function searchReport(page) {
        $("#mainContent").empty();
        var reportSearch=$("#reportSearch").val();
        $.ajax({
            type: 'post',
            url: '/reportSearch.do?page='+page+'&reportSearch='+reportSearch,
            async: false,
            success: function (data) {
                totalNum = data.totalNum;
                currentPage=data.pageNum;
                pageAmount =data.pageAmount;
                pre=(currentPage-1);
                next=(currentPage+1);
                $.each(data.data, function(i,item){
                    $("#mainContent").empty();
                    $("#mainContent").append('<div class="post">' +
                            '<div class="post-head"> ' +
                            '<h1 class="post-title"><a href="JavaScript:ReadReport('+(item.reportId)+')">'+item.reportTitle+'</a></h1>' +
                            '</div>' +
                            '<div class="post-meta" style="color: #959595;margin: 14px 0 0;">' +
                            '<span class="author">管理员:<a href="" target="_blank">'+item.reportAuthor+'</a> </span>· <time class="post-date">'+new Date((item.reportTime)).Format("yyyy-MM-dd hh:mm:ss")+'</time>' +
                            '</div>' +
                            '<div class="featured-media"> <a href="JavaScript:ReadReport('+(item.reportId)+')"> <img class="img-responsive center-block" src="'+item.reportImage+'" alt="" ></a>' +
                            '</div>' +
                            '<div class="post-content"> <p></p> <p>'+item.reportSummary+'</p> <p></p> ' +
                            '</div>' +
                            '<div class="post-permalink"> <a href="JavaScript:ReadReport('+(item.reportId)+')" class="btn btn-default">阅读全文</a></div> <footer class="post-footer clearfix"></footer>' +
                            '</div>');
                    var isimage = item.reportImage;
                    if(isimage==null){
                        $(".featured-media").empty();
                    }
                });
                if (pageAmount==1){
                    $("#mainContent").append('<nav class="pagination" role="navigation"><span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span> ');
                } else if(currentPage==pageAmount) {
                    $("#mainContent").append('<nav class="pagination" role="navigation">' +
                            '<a class="newer-posts" href="JavaScript:searchReport('+(pre)+')"> <i class="fa fa-angle-left"  style="background-color: #f4645f;color: white;"></i></a>' +
                            '<span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span>' +
                            '</nav>');
                }else if(pre==0){
                    $("#mainContent").append('<nav class="pagination" role="navigation"><span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span> ' +
                            '<a class="older-posts" href="JavaScript:searchReport('+(next)+')"><i class="fa fa-angle-right" style="background-color: #f4645f;color: white;"></i></a></nav>');
                } else {
                    $("#mainContent").append('<nav class="pagination" role="navigation">' +
                            '<a class=" newer-posts" href="JavaScript:searchReport('+(pre)+')"> <i class="fa fa-angle-left"  style="background-color: #f4645f;color: white;"></i></a>' +
                            '<span class="page-number">第 '+currentPage+' 页 / 共 '+pageAmount+' 页</span>' +
                            '<a class="older-posts" href="JavaScript:searchReport('+(next)+')"><i class="fa fa-angle-right"  style="background-color: #f4645f;color: white;"></i></a>' +
                            '</nav>');
                }
            }
        });

    }
</script>
