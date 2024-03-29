<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/static/h-ui.admin/css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>订单列表</title>

    <style>
        .tablecss{

            margin:0 auto;
            position:absolute;



        }
    </style>
</head>


<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
        <form action="${pageContext.request.contextPath}/order/getOrderLike.do" method="post">

            <input type="hidden" name="page" value="1">
            <input type="hidden" name="size" value="10">
            <input type="text" name="oid" id="oid" placeholder=" 订单编号" style="width:250px" class="input-text">
            <button name=""  class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜订单</button>
        </form>

    </div>


    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort">
            <thead>
            <tr class="text-c">

                <th>订单编号</th>
                <th width="100">商品名称</th>
                <th width="150">交易价格</th>
                <th>下单时间</th>
                <th width="60">订单状态</th>
                <th width="60">确认收货</th>
                <th>订单详情</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${orders.list}" var="order">
                <tr class="text-c">


                    <td>${order.oid}</td>
                    <td>${order.pname}</td>
                    <td>${order.order_price}</td>
                    <td>${order.order_date}</td>


                    <c:if test="${order.order_state eq '2'}">
                        <td class="td-status"><span class="label label-success radius">已完成</span></td>
                    </c:if>
                    <c:if test="${order.order_state eq '1'}">
                        <td class="td-status"><span class="label label-success radius">卖家已确认</span></td>
                    </c:if>
                    <c:if test="${order.order_state eq '0'}">
                        <td class="td-status"><span class="label label-success radius">待卖家确认</span></td>
                    </c:if>
                    <td class="td-status"><span class="label label-success radius"><a href="#" onclick="confirmOrder('${order.oid}')">确认收货</a></span></td>
                    <td class="td-status"><span class="label label-success radius"><a href="${pageContext.request.contextPath}/order/getOrderInformationByOid.do?oid=${order.oid}">订单详情</a></span></td>
                    <td class="td-manage"><a style="text-decoration:none" href="${pageContext.request.contextPath}/order/getOrderByOid.do?oid=${order.oid}" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" href="javascript:;"  onclick="deleteOrder('${order.oid}')" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="text-c" >
            <ul >
                <li>
                    <a href="${pageContext.request.contextPath}/order/getAllOrder.do?page=1&size=${orders.pageSize}" aria-label="Previus" >首页</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/order/getAllOrder.do?page=${orders.pageNum-1}&size=${orders.pageSize}">上一页</a><c:forEach begin="1" end="${orders.pages}" var="pageNum"> &nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/order/getAllOrder.do?page=${pageNum}&size=${orders.pageSize}">${pageNum}</a> &nbsp;&nbsp;&nbsp;</c:forEach>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/order/getAllOrder.do?page=${orders.pageNum+1}&size=${orders.pageSize}">下一页</a>&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/order/getAllOrder.do?page=${orders.pages}&size=${orders.pageSize}">尾页</a>
                </li>

            </ul>
        </div>
    </div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,5]}// 制定列不参与排序
        ]
    });

    /*图片-添加*/
    function picture_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-查看*/
    function picture_show(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-审核*/
    function picture_shenhe(obj,id){
        layer.confirm('审核文章？', {
                btn: ['通过','不通过'],
                shade: false
            },
            function(){
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                $(obj).remove();
                layer.msg('已发布', {icon:6,time:1000});
            },
            function(){
                $(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
                $(obj).remove();
                layer.msg('未通过', {icon:5,time:1000});
            });
    }

    function deleteOrder(oid) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/order/adminDeleteOrder.do",
            data: {"oid":oid},
            dataType: "json",
            async: false,
            success: function(data){
                var flag=data.flag;
                var msg=data.msg;
                if(flag=="1"){
                    alert(msg) ;
                    window.location.href="${pageContext.request.contextPath}/order/getAllOrder.do"

                }else if(flag=="2"){
                    alert(msg)
                }else if (flag=="3"){
                    alert(msg);
                }else {
                    alert(系统错误);
                }
            }
        });

    }




        function confirmOrder(adminoid) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/order/adminQueRenOrder.do",
                data: {"adminoid":adminoid},
                dataType: "json",
                async: false,
                success: function(data){
                    var flag=data.flag;
                    var msg=data.msg;
                    if(flag=="1"){
                        alert(msg) ;
                        window.location.href="${pageContext.request.contextPath}/order/getAllOrder.do"

                    }else if(flag=="2"){
                        alert(msg)
                    }else{
                        alert("系统错误");
                    }
                }
            });
        }




    /*图片-下架*/
    function picture_stop(obj,id){
        layer.confirm('确认要下架吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
            $(obj).remove();
            layer.msg('已下架!',{icon: 5,time:1000});
        });
    }

    /*图片-发布*/
    function picture_start(obj,id){
        layer.confirm('确认要发布吗？',function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
            $(obj).remove();
            layer.msg('已发布!',{icon: 6,time:1000});
        });
    }

    /*图片-申请上线*/
    function picture_shenqing(obj,id){
        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
        $(obj).parents("tr").find(".td-manage").html("");
        layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
    }

    /*图片-编辑*/
    function picture_edit(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*图片-删除*/
    function picture_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $.ajax({
                type: 'POST',
                url: '',
                dataType: 'json',
                success: function(data){
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                },
                error:function(data) {
                    console.log(data.msg);
                },
            });
        });
    }
</script>
</body>
</html>