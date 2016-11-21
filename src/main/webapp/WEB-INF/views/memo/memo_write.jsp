<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="normalheader transition animated fadeIn">
    <div class="hpanel">
        <div class="panel-body">
            <a class="small-header-action" href="">
                <div class="clip-header">
                    <i class="fa fa-arrow-up"></i>
                </div>
            </a>
            <div id="hbreadcrumb" class="pull-right m-t-lg">
                <ol class="hbreadcrumb breadcrumb">
                    <li><a href="index.html">Dashboard</a></li>
                    <li>
                        <span>App views</span>
                    </li>
                    <li class="active">
                        <span>Notes</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                Notes
            </h2>
            <small>Build notebook functionality in your app</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
    <div class="row">
        <div class="col-md-9">
            <div class="hpanel">
                <div class="panel-body">
                    <div class="text-center hidden">
                        We couldn't find any notes for you.
                    </div>

                    <div class="tab-content">
                        <div id="note" class="tab-pane active">
                        <form action="memo_write.do" method="post">
                            <h3><input type="text" class="form-control" name="title" placeholder="제목 입력"></h3>
                            <hr/>
                                   색상 : 
                            <select name="color_no">
                            	<c:forEach var="color" items="${color}">
                            	<option value="${color.color_no }">${color.color_name}</option>
                            	</c:forEach>
                            </select>
                            <hr/>
                            <div class="note-content">
                                <textarea class="form-control" placeholder="본문 입력" name="memo_content" wrap="hard"></textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default"><i class="fa fa-thumbs-o-up"></i> Save</button>
                                <button type="button" class="btn btn-sm btn-default"><i class="fa fa-trash"></i> Remove</button>
                            </div>
                        </form>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>