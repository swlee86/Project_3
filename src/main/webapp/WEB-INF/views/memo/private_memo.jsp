<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <li><a href="index.do">Main</a></li>
                    <li>
                        <span>Private_memo</span>
                    </li>
                    <li class="active">
                        <span>Private_Memo_list</span>
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
        <div class="col-md-3">
            <div class="hpanel panel-group">
                <div class="panel-body">
                    <div class="text-center text-muted font-bold">Search note or add new</div>

                </div>
                <div class="panel-section">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search note....">
                           <span class="input-group-btn">
                                <button class="btn btn-default" onclick="location.href='memo_write.do'"><span class="glyphicon glyphicon-plus"></span></button>
                           </span>
                    </div>
                    <button type="button" data-toggle="collapse" data-target="#notes"
                            class="btn-sm visible-xs visible-sm collapsed btn-default btn btn-block m-t-sm">
                        All notes <i class="fa fa-angle-down"></i>
                    </button>
                </div>



                <div id="notes" class="collapse">
					<c:forEach var="list" items="${list}">
                    <div class="panel-body note-link">
                        <a href="private_memo.do?memo_no=${list.memo_no}">
                        <small class="pull-right text-muted">${list.memo_date}</small>
                            <h5>${list.title}</h5>
                        <div class="small">
                        ${list.memo_content}
                        </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="hpanel">

                <div class="panel-body" style="background: ${first_memo.color};">
					
                    <div class="text-center hidden">
                        We couldn't find any notes for you.
                    </div>

                    <div class="tab-content">
                    	<form method="post">
                    	<input type="hidden" name="update_memo_no" value="${memo_no_chk}">
                    	<input type="hidden" name="color_no" value="${first_memo.color_no}">
                    	<input type="hidden" name="title" value="${first_memo.title}">
                        <div id="note1" class="tab-pane active">
                            <div class="pull-right text-muted m-l-lg" >
                                ${first_memo.memo_date}
                            </div>
                            <h3>${first_memo.title }</h3>
                            <hr/>
                            <div class="note-content" style="background: ${first_memo.color};">
                                <textarea class="form-control" style="background: ${first_memo.color};" name="memo_content">${first_memo.memo_content}</textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default"><i class="fa fa-thumbs-o-up"></i> Save</button>
                                <button type="button" onclick="location.href='removememo.do?memo_no=${memo_no_chk}'"class="btn btn-sm btn-default"><i class="fa fa-trash"></i> Remove</button>
                            </div>
                        </div>
                        </form>


                    </div>

                </div>

            </div>
        </div>
    </div>
</div>