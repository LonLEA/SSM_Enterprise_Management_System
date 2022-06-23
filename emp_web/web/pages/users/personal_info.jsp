<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/5/31
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <title>EMP OF LonLEA</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">
    
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

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
    <jsp:include page="../header.jsp"/>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="../aside.jsp"/>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>个人中心</h1>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-3">

                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img style="display: block"
                                 title="点击更换头像"
                                 data-toggle="modal" data-target="#ImgModal"
                                 class="btn profile-user-img img-responsive img-circle"
                                 src="${pageContext.request.contextPath}/users/get_base64_pto.do?id=${personalInfo.id}"
                                 alt="User profile picture">

                            <h3 class="profile-username text-center">${personalInfo.name}</h3>

                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>部门</b> <a class="pull-right">${personalInfo.department.departmentName}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>年龄</b> <a class="pull-right">${personalInfo.age}</a>
                                </li>
                                <li class="list-group-item">
                                    <b>联系方式</b> <a class="pull-right">${personalInfo.phone}</a>
                                </li>
                            </ul>

                            <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#editeModal"><b>修改</b></button>
                            <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#passwordModal"><b>修改密码</b></button>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <!--编辑模态框-->
                    <div id="editeModal" class="modal modal-primary" role="dialog">
                        <form action="${pageContext.request.contextPath}/users/updateInfo.do" method="post">
                            <input hidden name="id" type="text" value="${personalInfo.id}">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">修改资料</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="box-body">
                                            <div class="form-horizontal">

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">姓名:</label>
                                                    <div class="col-sm-5">
                                                        <div class="input-group">
                                                            <input name="name" type="text" class="form-control" value="${personalInfo.name}" placeholder="姓名"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">年龄:</label>
                                                    <div class="col-sm-5">
                                                        <div class="input-group">
                                                            <input name="age" type="text" class="form-control" value="${personalInfo.age}" placeholder="年龄"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">联系方式:</label>
                                                    <div class="col-sm-5">
                                                        <div class="input-group">
                                                            <input name="phone" type="text" class="form-control" value="${personalInfo.phone}" placeholder="联系方式"/>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>



                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-outline">保存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                        </form>
                        <!-- /.modal-dialog -->
                    </div>
                    <!--添加模态框/-->
                    <!--编辑模态框-->
                    <div id="passwordModal" class="modal modal-primary" role="dialog">
                        <form action="${pageContext.request.contextPath}/users/updatePwd.do" method="post">
                            <input hidden name="id" type="text" value="${personalInfo.id}">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">修改密码</h4>
                                    </div>
                                    <div class="modal-body">

                                        <div class="box-body">
                                            <div class="form-horizontal">

                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label">新密码:</label>
                                                    <div class="col-sm-5">
                                                        <div class="input-group">
                                                            <input name="password" type="password" class="form-control"  placeholder="新密码"/>
                                                        </div>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>



                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-outline">保存</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>
                        </form>
                        <!-- /.modal-dialog -->
                    </div>
                    <!--添加模态框/-->

                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#daily" data-toggle="tab">日常事务</a></li>
                            <li><a href="#project" data-toggle="tab">提交项目</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="daily">
                                <!-- 数据表格 -->
                                <div class="table-box">

                                    <!--工具栏-->
                                    <div class="pull-left">
                                        <div class="form-group form-inline">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal"><i class="fa fa-file-o"></i> 新建</button>
                                            </div>
                                        </div>
                                    </div>
                                    <!--工具栏/-->
                                    <!--添加模态框-->
                                    <div id="addModal" class="modal modal-primary" role="dialog">
                                        <form action="${pageContext.request.contextPath}/dailys/add.do" method="post">
                                            <input hidden name="userId" type="text" value="${personalInfo.id}">
                                            <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title">添加日常</h4>
                                                </div>
                                                <div class="modal-body">


                                                    <div class="box-body">
                                                        <div class="form-horizontal">

                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">标题:</label>
                                                                <div class="col-sm-5">
                                                                    <div class="input-group">
                                                                        <input name="title" type="text" class="form-control" placeholder="输入标题"/>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">日期:</label>
                                                                <div class="col-sm-5">
                                                                    <div class="input-group">
                                                                        <div class="input-group-addon">
                                                                            <i class="fa fa-calendar"></i>
                                                                        </div>
                                                                        <input name="date" type="text" class="form-control pull-right datepicker-a3" />
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label rowHeight2x">内容:</label>
                                                                <div class="col-md-10 data rowHeight2x">
                                                                    <textarea name="detail" class="form-control" rows="3" placeholder="请输入..."></textarea>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label">选框:</label>
                                                                <div class="col-sm-5">
                                                                    <div class="radio">
                                                                        <label><input type="radio" name="state" value="0" checked="checked">完成</label>
                                                                        <label><input type="radio" name="state" value="1">紧急</label>
                                                                        <label><input type="radio" name="state" value="2">常规</label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>



                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
                                                    <button type="submit" class="btn btn-outline">保存</button>
                                                </div>
                                            </div>
                                            <!-- /.modal-content -->
                                        </div>
                                    </form>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!--添加模态框/-->

                                    <!--头像模态框-->
                                    <div id="ImgModal" class="modal modal-primary" role="dialog">
                                        <form action="${pageContext.request.contextPath}/users/updateImg.do?"
                                              enctype="multipart/form-data"
                                              method="post">
                                            <input hidden name="userId" type="text" value="${personalInfo.id}">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span></button>
                                                        <h4 class="modal-title">更换头像</h4>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="box-body">
                                                            <div class="form-horizontal">

                                                                <div class="form-group">
                                                                    <label class="col-sm-2 control-label"></label>
                                                                    <div class="col-sm-5">
                                                                        <div class="input-group">
                                                                            <label for="img">选择头像</label>
                                                                            <input type="file" name="file" id="img">
                                                                            <p class="help-block">请选择较小的JPG格式的图片</p>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>



                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
                                                        <button type="submit" class="btn btn-outline">保存</button>
                                                    </div>
                                                </div>
                                                <!-- /.modal-content -->
                                            </div>
                                        </form>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!--添加模态框/-->

                                    <!--数据列表-->
                                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                        <thead>
                                        <tr>
                                            <th class="sorting">标题</th>
                                            <th class="sorting">日期</th>
                                            <th class="sorting">状态</th>
                                            <th class="text-center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="daily" items="${dailyList}">
                                            <tr>
                                                <td>${daily.title}</td>
                                                <td>${daily.dateStr}</td>
                                                <td>${daily.stateStr}</td>
                                                <td class="text-center">
                                                    <button type="button" class="btn bg-olive btn-xs"
                                                            onclick='location.href="${pageContext.request.contextPath}/dailys/delete.do?id=${daily.id}"'>删除</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--数据列表/-->

                                </div>
                                <!-- 数据表格 /-->
                            </div>
                            <!-- /.tab-pane -->

                            <div class="tab-pane" id="project">
                                <!-- 数据表格 -->
                                <div class="table-box">
                                    <!--数据列表-->
                                    <table id="data" class="table table-bordered table-striped table-hover dataTable">
                                        <div class="box-header with-border">
                                            <h3 class="box-title">项目列表</h3>
                                        </div>
                                        <!-- /.box-header -->
                                        <div class="box-body">
                                            <div class="box-group" id="accordion">
                                                <div class="panel box box-primary">
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
                                                                                <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                                                                        data-target="#fileModal" onclick="Values('${dproject.id}')">提交文件</button>
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
                                    </table>
                                    <!--数据列表/-->
                                </div>
                                <!-- 数据表格 /-->
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.nav-tabs-custom -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <!-- 内容区域 /-->
    <!--文件上传模态框-->
    <div id="fileModal" class="modal modal-primary" role="dialog">
        <form action="${pageContext.request.contextPath}/projects/uploadFile.do?"
              enctype="multipart/form-data"
              method="post">

            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">上传文件</h4>
                    </div>
                    <div class="modal-body">

                        <div class="box-body">
                            <div class="form-horizontal">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label"></label>
                                    <div class="col-sm-5">
                                        <div class="input-group">
                                            <input hidden id="fileUploadId" name="id" type="text" value="">
                                            <label for="upload">上传文件</label>
                                            <input id="upload" type="file" name="file">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-outline">保存</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
        </form>
        <!-- /.modal-dialog -->
    </div>
    <!--文件上传模态框/-->
    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0
        </div>
        <strong>Copyright &copy; 2020 <a href="http://www.lonlea.cn">LonLEA</a>.</strong>
    </footer>
    <!-- 底部导航 /-->

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
    function Values(ID){
        $("#fileUploadId").val(ID);
    }

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
        setSidebarActive("self-manage");
    });

    $(document).ready(function() {
        $('.datepicker-a3').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
    });
</script>
</body>
</html>
