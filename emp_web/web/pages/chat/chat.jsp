<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2022/5/28
  Time: 10:37
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

    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amazeui.css">


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

    <div class="content-wrapper">
        <!-- Direct Chat -->
        <div class="row">
            <div class="col-md-8 col-md-offset-1">
                <!-- DIRECT CHAT PRIMARY -->
                <div class="box box-primary direct-chat direct-chat-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Direct Chat</h3>

                        <div class="box-tools pull-right">
                            <span data-toggle="tooltip" title="3 New Messages" class="badge bg-light-blue">3</span>
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                            </button>
                            <button type="button" class="btn btn-box-tool" data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle">
                                <i class="fa fa-comments"></i></button>
                            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body" >
                        <!-- Conversations are loaded here -->
                        <div id="chatarea" class="direct-chat-messages">

                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <form action="#" method="post">
                            <div class="input-group">
                                <input id="message" type="text" name="message" placeholder="Type Message ..." class="form-control">
                                <span class="input-group-btn">
                                    <button onclick="sendMessage()" type="button" class="btn btn-primary btn-flat">Send</button>
                                </span>
                            </div>
                        </form>
                    </div>
                    <!-- /.box-footer-->
                </div>
                <!--/.direct-chat -->
            </div>
            <!-- /.col -->
        <div class="admin-content" hidden>
            <div class="" style="width: 80%;float:left;">

                <!-- 接收者 -->
                <div class="" style="float: left">
                    <p class="am-kai">发送给 : <span id="sendto">全体成员</span><button class="am-btn am-btn-xs am-btn-danger" onclick="$('#sendto').text('全体成员')">复位</button></p>
                </div>
                <!-- 按钮区 -->
                <div class="am-btn-group am-btn-group-xs" style="float:right;">
                    <button class="am-btn am-btn-default" type="button" onclick="clearConsole()"><span class="am-icon-trash-o"></span> 清屏</button>
                    <button class="am-btn am-btn-default" type="button" onclick="checkConnection()"><span class="am-icon-bug"></span> 检查</button>
                    <button class="am-btn am-btn-default" type="button" onclick="sendMessage()"><span class="am-icon-commenting"></span> 发送</button>
                    <button class="am-btn am-btn-default" type="file" onclick="uploadImage()"><span class="am-icon-file-image-o"></span> 上传图片</button>
                    <button class="am-btn am-btn-default" type="file" onclick="sendImage()"><span class="am-icon-file-image-o"></span> 发送图片</button>
                </div>
            </div>
            <!-- 列表区 -->
            <div class="am-panel am-panel-default" style="float:right;width: 20%;">
                <div class="am-panel-hd">
                    <h3 class="am-panel-title">在线列表 [<span id="onlinenum"></span>]</h3>
                </div>
                <ul class="am-list am-list-static am-list-striped" id="list">
                </ul>
            </div>
        </div>

    </div>

</div>
<script>

    var imgData =null;   //base64类型的图片数据
    /**
     *监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，
     *防止连接还没断开就关闭窗口，server端会抛异常。
     */
    window.onbeforeunload = function () {
        var is = confirm("确定关闭窗口？");
        if (is){
            ws.close();
        }
    };

    /**
     * 关闭连接
     */
    //关闭连接
    function closeWebSocket() {
        ws.close();
    }

    /**
     * 检查连接
     */
    function checkConnection(){
        if(ws != null){
            alert(ws.readyState == 0? "连接异常":"连接正常", { offset: 0});
        }else{
            alert("连接未开启!", { offset: 0, shift: 6 });
        }
    }

    /**
     * 发送信息给后台
     */
    function sendMessage(){
        var message = $("#message").val();
        var to = $("#sendto").text() == "全体成员"? "": $("#sendto").text();
        ws.send(JSON.stringify({
            message : {
                content : message,//输入框的内容
                from : '${sessionScope.user.username}',//登录成功后保存在Session.attribute中的username
                to : to      //接收人,如果没有则置空,如果有多个接收人则用,分隔
            },
            type : "message"
        }));
    }

    /**
     * 发送图片给后台
     */
    function sendImage(){
        var to = $("#sendto").text() == "全体成员"? "": $("#sendto").text();
        ws.send(JSON.stringify({
            message : {
                content : imgData,//图片的base64类型字符串
                from : '${username}',//登录成功后保存在Session.attribute中的username
                to : to      //接收人,如果没有则置空,如果有多个接收人则用,分隔
            },
            type : "image"
        }));
    }

    /**
     * 解析后台传来的消息
     * "massage" : {
     *              "from" : "xxx",
     *              "to" : "xxx",
     *              "content" : "xxx"
     *          },
     * "type" : {notice|message},
     * "list" : {[xx],[xx],[xx]}
     */
    function analysisMessage(message){
        message = JSON.parse(message);
        if(message.type == "message"){      //会话消息
            showChat(message.message);
        }
        if(message.type == "notice"){       //提示消息
            showNotice(message.message);
        }
        if(message.type == "image"){        //图片消息
            showImage(message.message);
        }
        if(message.list != null && message.list != undefined){      //在线列表
            //showOnline(message.list);
        }
    }

    /**
     * 展示会话信息
     */
    function showChat(message){
        var to = message.to == null || message.to == ""? "全体成员" : message.to;   //获取接收人
         /*message.from+ " 发送给: "+ to + "\n" + message.content+"<br/>";*/
        var html;
        if(message.from === "${sessionScope.user.username}"){
            html = "<div class='direct-chat-msg right'>"+
                "<div class='direct-chat-info clearfix'>"+
                "<span class='direct-chat-name pull-right'>"+message.from+"</span>"+
                "<span class='direct-chat-timestamp left'>23 Jan 2:00 pm</span>"+
                "</div>"+
                "<img class='direct-chat-img' src='' alt=''>"+
                "<div class='direct-chat-text'>"+
                message.content+
                "</div>"+
                "</div>";
        }else{
            html ="<div class='direct-chat-msg'>"+
                "<div class='direct-chat-info clearfix'>"+
                "<span class='direct-chat-name pull-left'>"+message.from+"</span>"+
                "<span class='direct-chat-timestamp pull-right'>23 Jan 2:00 pm</span>"+
                "</div>"+
                "<img class='direct-chat-img' src='' alt=''>"+
                "<div class='direct-chat-text'>"+
                message.content+
                "</div>"+
                "</div>";
        }
        $("#chatarea").append(html);
        $("#message").val("");  //清空输入区
        var chat = $("#chat-view");
        chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
    }

    /**
     * 展示提示信息
     */
    function showNotice(notice){
        $("#chat").append("<div><p class=\"am-text-success\" style=\"text-align:center\"><span class=\"am-icon-bell\"></span> "+notice+"</p></div>");
        var chat = $("#chat-view");
        //chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面
    }

    /**
     * 展示图片信息
     */
    function showImage(image) {
        var imgdata = image.content;
        var to = image.to == null || image.to == ""? "全体成员" : image.to;   //获取接收人
        var html = image.from+ " 发送给: "+ to + "\n" + "<img src=" + imgdata + ">" + "<br>";
        $("#chat").append(html);
        $("#message").val("");  //清空输入区
        $("#img").val("");      //清空上传的图片
        $("#imgdata").val("");  //清空base64类型的图片数据
        var imgShow = document.getElementById('imgShow');
        imgShow.setAttribute('src', "");//清空预览图片信息
        var chat = $("#chat-view");
        //chat.scrollTop(chat[0].scrollHeight);   //让聊天区始终滚动到最下面

    }

    /**
     * 展示在线列表
     */
    /*function showOnline(list){
        $("#list").html("");    //清空在线列表
        $.each(list, function(index, item){     //添加私聊按钮
            var li = "<li>"+item+"</li>";
            if('${username}' != item){    //排除自己
                li = "<li>"+item+" <button type=\"button\" class=\"am-btn am-btn-xs am-btn-primary am-round\" onclick=\"addChat('"+item+"');\"><span class=\"am-icon-phone\"><span> 私聊</button></li>";
            }
            $("#list").append(li);
        });
        $("#onlinenum").text($("#list li").length);     //获取在线人数
    }*/

    /**
     * 添加接收人
     */
    function addChat(user){
        var sendto = $("#sendto");
        var receive = sendto.text() == "全体成员" ? "" : sendto.text() + ",";
        if(receive.indexOf(user) == -1){    //排除重复
            sendto.text(receive + user);
        }
    }

    /**
     * 清空聊天区
     */
    function clearConsole(){
        $("#chat").html("");
    }

    /**
     * 发送系统消息
     * @param innerHTML
     */
    function setMessageInnerHTML(innerHTML) {
        $("#chat").append(innerHTML+"<br/>")
    };

    /**
     * 上传图片
     * 使用FileReader对象将本地图片转换为base64发送给服务端
     */

    function uploadImage() {
        var img = document.getElementById('img')
            , imgShow = document.getElementById('imgShow')
            , message = document.getElementById('message')
        var imgFile = new FileReader();
        imgFile.readAsDataURL(img.files[0]);
        imgFile.onload = function () {
            imgData = this.result; //base64数据
            imgShow.setAttribute('src', imgData);
        }
    }

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
        setSidebarActive("chat");
    })

</script>

</body>

</html>