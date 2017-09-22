<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="../../../common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>${webTitle }-
        图片添加</title>
    <%@ include file="../../../common/header.jsp" %>
    <link rel="stylesheet" href="${staticServer}/assets/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet"
          href="${staticServer}/assets/components/bootstrap-multiselect/dist/css/bootstrap-multiselect.css"/>
    <link rel="stylesheet" href="${staticServer}/assets/select2/select2.css"/>
    <style>
        .control-label {
            padding-top: 4px !important;
        }

        .select2-container--default {
            width: 58% !important;
        }

        .select2-search--inline {
            width: 100% !important;
        }

        .select2-search__field {
            width: 100% !important;
        }
    </style>

</head>

<body class="no-skin">
<%@ include file="../../../common/top.jsp" %>

<div class="main-container" id="main-container">
    <%@ include file="../../../common/menu.jsp" %>
    <div class="main-content">
        <div class="main-content-inner">

            <div class="page-content">
                <div class="page-header">
                    <h1>
                      app启动页
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <form id="infoForm" name="infoForm" class="form-horizontal"
                              action="${dynamicServer}/cms/startupPage/save.do?type=${type}" method="post">
                            <div class="form-group ">
                                <h3 class="row header smaller lighter blue">
                                    <span class="col-xs-12"> 添加图片 </span><!-- /.col -->
                                </h3>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label ">图片</label>
                                <div class="col-sm-9 control-div">
                                    <ul id="imageUl" class="ace-thumbnails clearfix hidden"
                                        style=" display: inline-block;">
                                        <li>
                                            <a data-rel="colorbox">
                                                <img width="150" id="icon-img" alt="150x150" data-path="" src=""/>
                                                <div class="tools tools-top">
                                                    <a class="delPic"> <i class="ace-icon fa fa-times red">删除</i>
                                                    </a></div>
                                            </a>
                                        </li>
                                    </ul>
                                    <input type="hidden" id="imgUrl" name="imgUrl" value="">
                                    <a href="#icon-modal" class="btn btn-white btn-primary" data-toggle="modal"
                                       style="position: absolute;top: 2px;">
                                        <i class="ace-icon glyphicon glyphicon-picture bigger-110"></i> 选择图片
                                    </a>
                                    <span style="margin-left: 120px">    请上传正方形的图片</span>
                                    <label id="imgUrlTip"></label>

                                </div>
                            </div>
                            <c:if test="${type==0||type==4||type==1||type==3}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">跳转类型：</label>
                                <div class="col-sm-9">
                                    <select name="dispatcheObj" id="dispatcheObj" class="col-sm-12 col-lg-7" title="">
                                        <c:if test="${type==0}"><option value="0" selected="selected">无跳转</option></c:if>
                                        <option value="1" <c:if test="${type==1||type==4}">selected</c:if>>跳转到课程</option>
                                        <option value="2">代金券申领</option>
                                        <option value="3">其他活动页</option>

                                    </select>
                                </div>
                            </div>
                            </c:if>
                            <c:if test="${type==4||type==1||type==3}">
                                <div class="form-group" >
                                    <label class="col-sm-3 control-label">课程类型：</label>
                                    <div class="col-sm-9">
                                        <select name="courseObj" id="courseObj" class="col-sm-12 col-lg-7" title="">
                                            <option value="1">普通课程</option>
                                            <option value="2">限时抢购课程</option>
                                        </select>
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">课程名称：</label>
                                <div class="col-sm-9">
                                    <select name="courseNo" id="courseNo" class="col-sm-12 col-lg-7" style="width: 58.5%" title="">

                                    </select>
                                    <label id="courseNoTip"></label>
                                </div>
                            </div>
<c:if test="${type==4||type==1||type==3}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">限时抢购课程名称：</label>
                                <div class="col-sm-9">
                                    <select name="purchaseNo" id="purchaseNo" class="col-sm-12 col-lg-7" style="width: 58.5%" title="">
                                    </select>
                                    <label id="purchaseNoTip"></label>
                                </div>
                            </div>
</c:if>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">代金券名称：</label>
                                <div class="col-sm-9">
                                    <select name="voucherNo" id="voucherNo" class="col-sm-12 col-lg-7" style="width: 58.5%" title="">

                                    </select>
                                    <label id="voucherNoTip"></label>
                                </div>

                            </div>
                            <c:if test="${type==0||type==1||type==3}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">PC跳转链接：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="url" name="url" maxlength="256"
                                           class="col-xs-10 col-sm-7" placeholder=""
                                           title="" value="">
                                    <label id="urlTip"></label>
                                    <br><br><span>
                                           课程：http://www.932edu.net/lwgk/web/modules/course/courseinfo.html?courseNo=？;</span><br><br>
                                    <span> 代金券：http://www.932edu.net/lwgk/web/modules/voucher/voucher.html?voucherNo=？;</span>
                                </div>
                            </div>
                            </c:if>
                            <c:if test="${type==4}">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">APP跳转链接：</label>
                                    <div class="col-sm-9">
                                        <input type="text" id="appurl" name="appurl" maxlength="256"
                                               class="col-xs-10 col-sm-7" placeholder=""
                                               title="" value="">

                                        <label id="appurlTip"></label>
                                    </div>

                                </div>
                            </c:if>
                            <%--<div class="form-group">--%>
                                <%--<label class="col-sm-3 control-label">图片类型：</label>--%>
                                <%--<div class="col-sm-9">--%>
                                    <%--<select name="type" id="type" class="col-sm-12 col-lg-7" title="">--%>
                                        <%--<option value="0" selected="selected">启动页</option>--%>
                                        <%--<option value="1">轮播图</option>--%>
                                        <%--<option value="2">app分享</option>--%>
                                        <%--<option value="3">PC侧页</option>--%>
                                    <%--</select>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <c:if test="${type!=2}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">是否生效：</label>
                                <div class="col-sm-9">
                                    <select name="state" id="state" class="col-sm-12 col-lg-7" title="">
                                        <option value="0" selected="selected">暂不生效</option>
                                        <option value="1">马上生效</option>
                                    </select>
                                </div>
                            </div>

                            </c:if>
                            <c:if test="${type!=2}">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">排序：</label>
                                <div class="col-sm-9">
                                    <input type="number" id="sort" name="sort" maxlength="11"
                                           class="col-xs-10 col-sm-7" placeholder=""
                                           title="" value="">
                                    <label id="sortTip"></label>
                                </div>
                            </div>
                            </c:if>



                            <div class="clearfix form-actions">
                                <div class="col-md-offset-4 col-md-8">
                                    <button class="btn btn-primary" type="submit">
                                        <i class="ace-icon fa fa-save bigger-110"></i> 保存
                                    </button>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button class="btn" type="button"
                                            onclick="backIndex(${type})">
                                        <i class="ace-icon fa fa-undo bigger-110"></i> 取消
                                    </button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <!-- /.main-content -->
            </div>
        </div>
    </div>
</div>
<div id="icon-modal" class="modal fade" tabindex="-21">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header no-padding">
                <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="white">&times;</span>
                    </button>
                    上传封面图片
                </div>
            </div>
            <div class="modal-body no-padding">
                <div class="widget-box" style="border: none">
                    <div class="widget-body">
                        <div class="widget-main">
                            <c:url value="${uploadServer}/common/upload.do" var="upload_url"/>
                            <form:form action="${upload_url}"
                                       enctype="multipart/form-data" method="post" id="icon-form">
                                <input type="hidden" name="file_type" value="icon">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <input name="file" type="file" id="icon-input"
                                               accept="image/png,image/jpeg,image/gif,image/bmp"/>
                                    </div>
                                    <div class="col-xs-12" align="center">
                                        <button class="btn btn-white btn-primary" type="submit">
                                            <i class="ace-icon fa fa-cloud-upload bigger-110"></i> 上传
                                        </button>
                                        <button class="btn btn-white btn-primary" type="button" id="closeicon-modal"
                                                data-dismiss="modal">
                                            <i class="ace-icon fa fa-undo bigger-110"></i> 取消
                                        </button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer no-margin-top"></div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<!-- /.main-container -->
<%@ include file="../../../common/js.jsp" %>

<script src="${staticServer}/assets/js/jquery.validation/jquery.validate.js"></script>
<script src="${staticServer}/assets/js/jquery.validation/jquery.validate.zh-CN.js"></script>
<script src="${staticServer}/assets/js/jquery.validation/additional-methods.js"></script>

<script src="${staticServer}/assets/js/jquery.form.js"></script>
<script src="${staticServer}/assets/select2/select-topic-tags.js"></script>
<script src="${staticServer}/assets/select2/select2.full.js"></script>
<script type="text/javascript">
    var $lwCourseIds = $('#courseNo');
    var $lwPurchaseIds = $('#purchaseNo');
    var $lwVoucherIds = $('#voucherNo');
        $(function () {
            /*下拉选择课程*/
            $lwCourseIds.select2({
                tags: true,
//            multiple: true,
                createTag: function (params) {
                    console.log(arguments);
                    return null;
                },
                placeholder: '请输入要关联的课程',
                language: {
                    noResults: function () {
                        return '没有找到该课程';
                    },
                    inputTooShort: function () {
                        return '请至少输入1个字符';
                    }
                },
                ajax: {
                    url: "${dynamicServer}/cms/course/getListByName.do",
                    type: "get",
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            name: params.term,
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {
                        params.page = params.page || 1;

                        return {
                            results: data
                        };
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                },
                minimumInputLength: 1,
                templateResult: function (course) {
                    return course.name|| course.text;
                },
                templateSelection: function (course) {
                    return course.name|| course.text;
                }
            });
            /*下拉选择抢购活动*/
            $lwPurchaseIds.select2({
                tags: true,
//            multiple: true,
                createTag: function (params) {
                    console.log(arguments);
                    return null;
                },
                placeholder: '请输入要关联的抢购活动',
                language: {
                    noResults: function () {
                        return '没有找到该活动';
                    },
                    inputTooShort: function () {
                        return '请至少输入1个字符';
                    }
                },
                ajax: {
                    url: "${dynamicServer}/cms/purchase/getListByName.do",
                    type: "get",
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            name: params.term,
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {
                        params.page = params.page || 1;

                        return {
                            results: data
                        };
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                },
                minimumInputLength: 1,
                templateResult: function (course) {
                    return course.name|| course.text;
                },
                templateSelection: function (course) {
                    return course.name|| course.text;
                }
            });
            /*下拉选择课程*/
            $lwVoucherIds.select2({
                tags: true,
//            multiple: true,
                createTag: function (params) {
                    console.log(arguments);
                    return null;
                },
                placeholder: '请输入要关联的代金券',
                language: {
                    noResults: function () {
                        return '没有找到该代金券';
                    },
                    inputTooShort: function () {
                        return '请至少输入1个字符';
                    }
                },
                ajax: {
                    url: "${dynamicServer}/cms/voucher/getListByName.do",
                    type: "get",
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            name: params.term,
                            page: params.page
                        };
                    },
                    processResults: function (data, params) {
                        params.page = params.page || 1;
                        return {
                            results: data
                        };
                    },
                    cache: true
                },
                escapeMarkup: function (markup) {
                    return markup;
                },
                minimumInputLength: 1,
                templateResult: function (course) {
                    return course.name|| course.text;
                },
                templateSelection: function (course) {
                    return course.name|| course.text;
                }
            });

            /*validate验证*/
            $("#infoForm").validate({
                errorElement: "label",
                errorClass: "validError",
                errorPlacement: function (error, element) {
                    error.appendTo($("#" + element.attr('id') + "Tip"));
                },
                rules: {
                    imgUrl: {
                        required: true
                    },
                    dispatcheObj: {
                        required: true
                    },
                    courseNo: {
                        required: true
                    },
                    purchaseNo: {
                        required: true
                    },
                    voucherNo: {
                        required: true
                    },
                    url:{
                        required: true
                    },
                    appurl:{
                        required: true
                    },
                    sort: {
                        required: true,
                        maxlength: 255
                    }

                },
                <%--submitHandler: function (form) {--%>
                    <%--$("#infoForm").ajaxSubmit({--%>
                        <%--success: function (data) {--%>
<%--//                            $('#modal-edit').modal('hide');--%>
<%--//                            table.draw();--%>
                            <%--window.location.href("${dynamicServer}/cms/startupPage/index.do?type=${type}");--%>
                        <%--}--%>
                    <%--});--%>
                <%--}--%>
            });

            if ( $('#dispatcheObj').val() == 0) {
                $("#courseNo").parent().parent().hide();
                $("#voucherNo").parent().parent().hide();
                $("#url").parent().parent().hide();
                $("#courseObj").parent().parent().hide();
            } else if ($('#dispatcheObj').val() == 1) {
                $("#courseObj").parent().parent().show();

                $("#courseNo").parent().parent().show();
                $("#voucherNo").parent().parent().hide();
                $("#url").parent().parent().hide();
                $("#appurl").parent().parent().hide();
            } else if($('#dispatcheObj').val() == 2)  {
                $("#courseNo").parent().parent().hide();
                $("#voucherNo").parent().parent().show();
                $("#url").parent().parent().hide();
                $("#appurl").parent().parent().hide();
                $("#courseObj").parent().parent().hide();
            }else if($('#dispatcheObj').val() == null ){
                $("#courseNo").parent().parent().hide();
                $("#voucherNo").parent().parent().hide();
                $("#courseObj").parent().parent().hide();
            }else{
                $("#courseNo").parent().parent().hide();
                $("#voucherNo").parent().parent().hide();
                $("#url").parent().parent().show();
                $("#appurl").parent().parent().show();
                $("#courseObj").parent().parent().hide();
            }
            /*选择发放对象*/
            $("#dispatcheObj").on('change', function () {
                switch($("#dispatcheObj").val()){
                    case '0':
                        $("#courseNo").parent().parent().hide();
                        $("#voucherNo").parent().parent().hide();
                        $("#url").parent().parent().hide();
                        $("#courseObj").parent().parent().hide();
                        break;
                    case '1':
//                        $("#courseNo").parent().parent().show();
                        $("#courseObj").parent().parent().show();
                        $("#courseNo").parent().parent().show();
                        $("#voucherNo").parent().parent().hide();
                        $("#url").parent().parent().hide();
                        $("#appurl").parent().parent().hide();
                        break;
                    case '2':
                        $("#courseNo").parent().parent().hide();
                        $("#voucherNo").parent().parent().show();
                        $("#url").parent().parent().hide();
                        $("#appurl").parent().parent().hide();
                        $("#courseObj").parent().parent().hide();
                        break;
                    case '3':
                        $("#courseNo").parent().parent().hide();
                        $("#voucherNo").parent().parent().hide();
                        $("#url").parent().parent().show();
                        $("#appurl").parent().parent().show();
                        $("#courseObj").parent().parent().hide();
                        break;
                    default:

                }

            });

            if ($('#courseObj').val() == 1) {
                $("#courseNo").parent().parent().show();
                $("#purchaseNo").parent().parent().hide();
            } else if ($('#courseObj').val() == 2) {
                $("#courseNo").parent().parent().hide();
                $("#purchaseNo").parent().parent().show();
            }
            $("#courseObj").on('change', function () {
                switch($("#courseObj").val()) {
                    case '1':
                        $("#courseNo").parent().parent().show();
                        $("#purchaseNo").parent().parent().hide();
                        break;
                    case '2':
                        $("#courseNo").parent().parent().hide();
                        $("#purchaseNo").parent().parent().show();
                        break;
                }
            });
//        $("#infoForm").validate({
//            errorElement: "label",
//            errorClass: "valiError",
//            errorPlacement: function (error, element) {
//                error.appendTo($("#" + element.attr('id') + "Tip"));
//            },
//            rules: {
//                imgUrl: {
//                    required: true,
//                },
//
//
//            },
//            submitHandler: function (form) {
//                form.submit();
//            }
//        });

        //操作背景图片
        $('#icon-input').ace_file_input({
            style: 'well',
            btn_choose: '点击选择',
            btn_change: null,
            no_icon: 'ace-icon fa fa-picture-o',
            droppable: false,
            allowExt: ["jpeg", "jpg", "png", "gif", "bmp"],
            allowMime: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"],
            thumbnail: 'large',
            maxSize: 1024000,
            before_remove: function () {
                return true;
            }
        }).on('change', function () {
            var $icon_input = $('#icon-input');
            if ($icon_input.val() == '') {
                $icon_input.ace_file_input('reset_input');
            }
        }).on('file.error.ace', function (ev, info) {
            if (info.error_count['ext'] || info.error_count['mime'])
                $.notify({message: "请选择图片!", z_index: 1051});
            if (info.error_count['size'])
                $.notify({message: "图片大小不超过1M!!", z_index: 1051});
        });
        var $icon_form = $("#icon-form");
        $icon_form.on('submit', function () {
            var imgcheck = $("#icon-input").val();
            if (imgcheck === '') {
                return false;
            }
            $icon_form.ajaxSubmit({
                type: 'post', // 提交方式 get/post
                url: $icon_form.attr('action'),
                dataType: 'json',
                success: function (result) {
                    if (result && result.success) {
                        var img_path = result.createFilePath;
                        $("#closeicon-modal").click();
                        $("[name=imgUrl]").val(img_path);
                        var img_url = '${imageServer}' + img_path;

                        var $icon_img = $("#icon-img");
                        if ($icon_img.attr("src") != '') {
                            $.ajax({
                                url: '${uploadServer}/common/delFile.do',
                                data: {
                                    path: $icon_img.attr("data-path")
                                },
                                type: 'GET',
                                success: function (result) {
                                    if (result.success) {
                                        $icon_img.attr("src", img_url);
                                        $icon_img.attr("data-path", img_path);
                                        $("#imageUl").removeClass("hidden");
                                    } else {
                                        $.notify({message: "文件路径错误!", z_index: 15111});
                                    }
                                }
                            })
                        } else {
                            $icon_img.attr("src", img_url);
                            $icon_img.attr("data-path", img_path);
                            $("#imageUl").removeClass("hidden");
                            $('#iconTip').html('');
                        }
                        return;
                    }

                    alert((result && result.message) || '上传失败');
                }
            });
            return false;
        });
        $("#imageUl").on('click', '.delPic', function () {
            var that = $(this);
            var path = that.closest("li").find("img").attr("data-path");
            $.ajax({
                url: '${uploadServer}/common/delFile.do',
                data: {
                    path: path
                },
                type: 'GET',
                success: function (result) {
                    if (result.success) {
                        $("#iconTip").html('');
                        $("#imageUl").addClass("hidden");
                        $("[name=icon]").val('');
                        $("#icon-img").attr("src", "");
                    } else {
                        $.notify({message: "文件路径错误!", z_index: 15111});
                    }
                }
            })
        });


    });


//    $('#infoForm').submit(function() {
//
//        $(this).ajaxSubmit({
//            success: function (data) {
//                alert(data.message);
//                $('#modal-edit').modal('hide');
//                table.draw();
//            }
//        });
//        return false;
//    });

    function backIndex(type) {
        window.location.href = "${dynamicServer}/cms/startupPage/index.do?type="+type;
    };

</script>
</body>
</html>