<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17/017
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/newhead.jsp" %>
<div class="tpl-content-wrapper">
    <div class="container-fluid am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                <div class="page-header-heading"><span class="am-icon-first-order page-header-heading-icon"></span> 用户管理</div>
            </div>
        </div>
    </div>

    <div class="row-content am-cf">
        <div class="row">
            <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                <div class="widget am-cf">
                    <div class="widget-head am-cf">
                        <div class="widget-title  am-cf">用户列表</div>
                    </div>
                    <div class="widget-body  am-fr">
                        <div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                            <div class="am-form-group">
                                <div class="am-btn-toolbar" href="${pageContext.request.contextPath}/bill/toAdd">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button type="button" class="am-btn am-btn-default am-btn-success"><span
                                                class="am-icon-plus" onclick="javascript:add()"> </span> 添加用户
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form method="get" action="${pageContext.request.contextPath }/user/findAll">
                            <input name="method" value="query" class="input-text" type="hidden">
                            <input type="hidden" name="pageIndex" value="1"/>
                            <div class="am-u-sm-12 am-u-md-6 am-u-lg-pull-2">
                                <div class="am-form-group tpl-table-list-select">
                                    <select data-am-selected="{btnSize: 'sm'}"  name="queryUserRole">
                                        <option value="0">用户角色</option>
                                        <c:forEach var="role" items="${roleList}">
                                            <option <c:if test="${role.id == queryUserRole }">selected="selected"</c:if>
                                                    value="${role.id}">${role.roleName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                    <input type="text" class="am-form-field" placeholder="用户名"  name="queryname" value="${queryUserName }">
                                    <span class="am-input-group-btn">
                                 <button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search"
                                         type="submit" >
                                 </button>
                                </span>
                                </div>
                            </div>



                        </form>

                        <div class="am-u-sm-12">
                            <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black "
                                   id="example-r">
                                <thead>
                                <tr>
                                    <th>用户编码</th>
                                    <th>用户名称</th>
                                    <th>性别</th>
                                    <th>年龄</th>
                                    <th>电话</th>
                                    <th>用户角色</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="user" items="${list }" varStatus="status">
                                <tr>
                                    <td>
                                        <span>${user.userCode }</span>
                                    </td>
                                    <td>
                                        <span>${user.userName }</span>
                                    </td>
                                    <td>
							<span>
								<c:if test="${user.gender==1}">男</c:if>
								<c:if test="${user.gender==2}">女</c:if>
							</span>
                                    </td>
                                    <td>
                                        <span>${user.age}</span>
                                    </td>
                                    <td>
                                        <span>${user.phone}</span>
                                    </td>
                                    <td>
                                        <span>${user.roleName}</span>
                                    </td>
                                    <td>
                                        <span><a class="viewUser" href="javascript:;"
                                                 userid=${user.id } username=${user.userName }>
                                                 <i class="am-icon-book"></i>>查看</a></span>
                                        <span><a class="modifyUser" href="javascript:;" userid=${user.id } username=${user.userName }> <i class="am-icon-pencil"></i> 编辑</a></span>
                                        <span><a class="deleteUser" href="javascript:del();" userid=${user.id } username=${user.userName } nowUser=${userSession.id }><i class="am-icon-trash"></i> 删除</a></span>
                                    </td>
                                </tr>
                                </c:forEach>
                            </table>
                            <input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
                            <c:import url="rollpage.jsp">
                                <c:param name="totalCount" value="${totalCount}"/>
                                <c:param name="currentPageNo" value="${currentPageNo}"/>
                                <c:param name="totalPageCount" value="${totalPageCount}"/>
                            </c:import>
                        </div>
                        </div>
                    <div class="zhezhao"></div>
                    <div class="remove" id="removeUse">
                        <div class="removerChid">
                            <h2>提示</h2>
                            <div class="removeMain">
                                <p>你确定要删除该用户吗？</p>
                                <a href="#" id="yes">确定</a>
                                <a href="#" id="no">取消</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="common/newfoot.jsp" %>
<script>
    function add(){
        window.location.href="${pageContext.request.contextPath}/user/toAdd";
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/userlist.js"></script>