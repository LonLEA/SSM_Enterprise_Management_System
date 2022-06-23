<%--
  Created by IntelliJ IDEA.
  User: LeaLON
  Date: 2022/5/20
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>EMP of LonLEA</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>
<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">
    <!-- 页面头部 -->
    <jsp:include page="header.jsp"/>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="aside.jsp"/>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- 项目列表 -->
        <section class="content">
            <div class="row">
                <div class="col-md-6">
                    <div class="box box-solid">
                        <div class="box-header with-border">
                            <h3 class="box-title">项目列表</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-group" id="accordion">
                                <div class="panel box box-primary">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                进行中
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="box-body">
                                            <table id="dataList1" class="table table-bordered table-striped table-hover dataTable">
                                                <thead>
                                                <tr>
                                                    <th class="sorting">项目名</th>
                                                    <th class="sorting">开始时间</th>
                                                    <th class="sorting">结束时间</th>
                                                    <th class="sorting">状态</th>
                                                    <th class="text-center">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="dproject" items="${sessionScope.projects}">
                                                    <c:if test="${dproject.status == 1}">
                                                    <tr>
                                                        <td>${dproject.projectName}</td>
                                                        <td>${dproject.beginTimeStr}</td>
                                                        <td>${dproject.endTimeStr}</td>
                                                        <td>${dproject.statusStr}</td>
                                                        <td class="text-center">
                                                            <button type="button" class="btn bg-olive btn-xs"
                                                                    onclick='location.href="${pageContext.request.contextPath}/projects/findById.do?id=${dproject.id}"'>详情</button>
                                                        </td>
                                                    </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel box box-danger">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                暂停
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTwo" class="panel-collapse collapse">
                                        <div class="box-body">
                                            <table id="dataList2" class="table table-bordered table-striped table-hover dataTable">
                                                <thead>
                                                <tr>
                                                    <th class="sorting">项目名</th>
                                                    <th class="sorting">开始时间</th>
                                                    <th class="sorting">结束时间</th>
                                                    <th class="sorting">状态</th>
                                                    <th class="text-center">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="dproject" items="${sessionScope.projects}">
                                                    <c:if test="${dproject.status == 0}">
                                                        <tr>
                                                            <td>${dproject.projectName}</td>
                                                            <td>${dproject.beginTimeStr}</td>
                                                            <td>${dproject.endTimeStr}</td>
                                                            <td>${dproject.statusStr}</td>
                                                            <td class="text-center">
                                                                <button type="button" class="btn bg-olive btn-xs"
                                                                        onclick='location.href="${pageContext.request.contextPath}/projects/findById.do?id=${dproject.id}"'>详情</button>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel box box-success">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                已完成
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseThree" class="panel-collapse collapse">
                                        <div class="box-body">
                                            <table id="dataList3" class="table table-bordered table-striped table-hover dataTable">
                                                <thead>
                                                <tr>
                                                    <th class="sorting">项目名</th>
                                                    <th class="sorting">开始时间</th>
                                                    <th class="sorting">结束时间</th>
                                                    <th class="sorting">状态</th>
                                                    <th class="text-center">操作</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="dproject" items="${sessionScope.projects}">
                                                    <c:if test="${dproject.status == 2}">
                                                        <tr>
                                                            <td>${dproject.projectName}</td>
                                                            <td>${dproject.beginTimeStr}</td>
                                                            <td>${dproject.endTimeStr}</td>
                                                            <td>${dproject.statusStr}</td>
                                                            <td class="text-center">
                                                                <button type="button" class="btn bg-olive btn-xs"
                                                                        onclick='location.href="${pageContext.request.contextPath}/projects/findById.do?id=${dproject.id}"'>详情</button>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>

                <div class="col-md-6">
                    <!-- /.tab-pane -->
                    <div class="box box-solid" id="timeline">
                        <!-- The timeline -->
                        <ul class="timeline timeline-inverse">
                            <!-- timeline time label -->
                            <li class="time-label">
                                <span class="bg-red">&nbsp;&nbsp;紧&nbsp;&nbsp;急&nbsp;&nbsp; </span>
                            </li>
                            <!-- /.timeline-label -->
                            <!-- timeline item -->
                            <c:forEach var="daily" items="${sessionScope.dailys}">
                                <c:if test="${daily.state == 1}">
                                    <li>
                                        <i class="fa fa-envelope bg-blue"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i>${daily.dateStr}</span>
                                            <h3 class="timeline-header"><a>${daily.title}</a></h3>

                                            <div class="timeline-body">
                                                    ${daily.detail}
                                            </div>
                                            <div class="timeline-footer">
                                                <button class="btn btn-primary btn-xs"
                                                        onclick='location.href="${pageContext.request.contextPath}/dailys/finish.do?id=${daily.id}"'>完成</button>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>


                            <!-- timeline time label -->
                            <li class="time-label">
                                <span class="bg-green">&nbsp;&nbsp;常&nbsp;&nbsp;规&nbsp;&nbsp;</span>
                            </li>
                            <!-- /.timeline-label -->
                            <!-- timeline item -->
                            <c:forEach var="daily" items="${sessionScope.dailys}">
                                <c:if test="${daily.state == 2}">
                                    <li>
                                        <i class="fa fa-user bg-blue"></i>

                                        <div class="timeline-item">
                                            <span class="time"><i class="fa fa-clock-o"></i>${daily.dateStr}</span>
                                            <h3 class="timeline-header"><a>${daily.title}</a></h3>

                                            <div class="timeline-body">
                                                    ${daily.detail}
                                            </div>
                                            <div class="timeline-footer">
                                                <button class="btn btn-primary btn-xs"
                                                onclick='location.href="${pageContext.request.contextPath}/dailys/finish.do?id=${daily.id}"'>完成</button>
                                            </div>
                                        </div>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <!-- END timeline item -->
                            <li>
                                <i class="fa fa-clock-o bg-gray"></i>
                            </li>
                        </ul>
                    </div>
                    <!-- /.tab-pane -->
                </div>
            </div>
        </section>

</div>





    <script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script>
        $(document).ready(function() {
            // 选择框
            $(".select2").select2();

            // WYSIHTML5编辑器
            $(".textarea").wysihtml5({
                locale: 'zh-CN'
            });
        });


        // 设置激活菜单
        function setSidebarActive(tagUri) {
            var liObj = $("#" + tagUri);
            if (liObj.length > 0) {
                liObj.parent().parent().addClass("active");
                liObj.addClass("active");
            }
        }


        $(document).ready(function() {
            // 激活导航位置
            setSidebarActive("admin-index");

            // 列表按钮
            $("#dataList td input[type='checkbox']").iCheck({
                checkboxClass: 'icheckbox_square-blue',
                increaseArea: '20%'
            });
            // 全选操作
            $("#selall").click(function() {
                var clicks = $(this).is(':checked');
                if (!clicks) {
                    $("#dataList td input[type='checkbox']").iCheck("uncheck");
                } else {
                    $("#dataList td input[type='checkbox']").iCheck("check");
                }
                $(this).data("clicks", !clicks);
            });
        });
        $(document).ready(function(){
            $.post({
                url: "${pageContext.request.contextPath}/users/findByUsername.do",
                data: {username:
                        "${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}"},
                dataType: "json", //返回数据类型
                success: function(user){
                }
            });

            $.post({
                url: "${pageContext.request.contextPath}/projects/findByDepartmentId.do",
                data: {departmentId:"${sessionScope.user.department.id}"},
                dataType: "json", //返回数据类型
                success: function(projects){
                }
            });

            $.post({
                url: "${pageContext.request.contextPath}/dailys/findByUserId.do",
                data: {userId:"${sessionScope.user.id}"},
                dataType: "json", //返回数据类型
                success: function(dailys){
                }
            });
        })
    </script>
</body>
</html>
