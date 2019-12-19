<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 18:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/newhead.jsp" %>
<div class="tpl-content-wrapper">
    <div class="container-fluid am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                <div class="page-header-heading"><span class="am-icon-first-order page-header-heading-icon"></span> 密码管理</div>
            </div>
        </div>
    </div>
    <div class="row-content am-cf">

        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title am-fl">密码修改</div>
                        <div class="widget-function am-fr">
                            <a href="javascript:;" class="am-icon-cog"></a>
                        </div>
                    </div>
                    <div class="widget-body am-fr">

                            <form  class="am-form tpl-form-border-form tpl-form-border-br" id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/pwdUpdate">
                                <input type="hidden" name="method" value="savepwd">
                                <!--div的class 为error是验证错误，ok是验证成功-->
                                <div class="info">${message}</div>

                                <div class="am-form-group" >
                                    <label for="oldPassword"  class="am-u-sm-3 am-form-label">旧密码：</label>

                                    <div class="am-u-sm-6  am-u-sm-pull-3">
                                        <input type="password" name="oldpassword" id="oldpassword" value="">
                                        <font color="red"></font>
                                    </div>

                                </div>

                                <div class="am-form-group" >
                                    <label for="newPassword"  class="am-u-sm-3 am-form-label">新密码：</label>

                                    <div class="am-u-sm-6  am-u-sm-pull-3">
                                        <input type="password" name="newpassword" id="newpassword" value="">
                                        <font color="red"></font>
                                    </div>

                                </div>

                                <div class="am-form-group">
                                    <label for="rnewpassword" class="am-u-sm-3 am-form-label">确认新密码：</label>
                                    <div class="am-u-sm-6  am-u-sm-pull-3">
                                    <input type="password" name="rnewpassword" id="rnewpassword" value="">
                                        <font color="red"></font>
                                    </div>
                                </div>
                                <div class="providerAddBtn">
                                    <!--<a href="#">保存</a>-->
                                    <input type="button" name="save" id="save" value="保存" onclick="save()">
                                </div>
                            </form>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

</div>



<%@include file="common/newfoot.jsp" %>
<script>
    function save(){
        if(confirm("确定要修改密码？")){
            $("#userForm").submit();
        }
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/pwdmodify.js"></script>