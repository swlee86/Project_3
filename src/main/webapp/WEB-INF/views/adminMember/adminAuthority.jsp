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
                    <li><a href="index.html">홈</a></li>
                    <li>
                        <span>관리자</span>
                    </li>
                    <li class="active">
                        <span>권한 부여</span>
                    </li>
                </ol>
            </div>
            <h2 class="font-light m-b-xs">
                	권한 관리
            </h2>
            <small>&nbsp;&nbsp;각각의 사원의 권한을 관리할 수 있습니다^^</small>
        </div>
    </div>
</div>

<div class="content animate-panel">
    <div class="row">
        <div class="col-lg-12">
            <div class="text-center m-b-xl">
            <div class="row">
            
                <div class="col-sm-3">
                    <div class="hpanel plan-box hyellow active">
                        <div class="panel-heading hbuilt text-center">
                            <h4 class="font-bold">대표</h4>
                        </div>
                        <div class="panel-body">
                            <table class="table">
                                <thead>
                                <tr>
                                    <td> 공통 권한</td>
                                </tr>
                                </thead>
                                
                                <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 관리자
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    	<input type="checkbox"> 사원 조회 및 이력 조회
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 사원 등록
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 사원 탈퇴 승인
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 사원 권한 부여
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 지점 관리
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 부서 관리
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 하위 부서 관리
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 직위 관리
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 전자 결재 승인
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 프로젝트 승인
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 프로젝트 작성
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 회사 정보 공유 게시판 관리
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 언론 게시판 관리
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 자유 게시판 관리
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox"> 업무 정보 공유 게시판 관리
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <a href="#" class="btn btn-warning btn-sm m-t-xs">적용</a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="hpanel plan-box hgreen">
                        <div class="panel-heading hbuilt text-center">
                            <h4 class="font-bold">Standard plan</h4>
                        </div>
                        <div class="panel-body">
                            <p class="text-muted">
                                Lorem ipsum dolor sit amet, illum fastidii dissentias quo ne. Sea ne sint animal iisque, nam an soluta sensibus.
                            </p>
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>
                                        Features
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Dashboard
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Project view
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Contacts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Calendar
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> AngularJS version
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-square-o"></i> Meteor version
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-square-o"></i> Support
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p class="text-muted">
                                Lorem ipsum dolor sit amet, illum fastidii dissentias quo ne. Sea ne sint animal iisque, nam an soluta sensibus.
                            </p>

                            <h3 class="font-bold">
                                $20/month
                            </h3>
                            <a href="#" class="btn btn-success btn-sm m-t-xs">Select plan</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="hpanel plan-box hblue">
                        <div class="panel-heading hbuilt text-center">
                            <h4 class="font-bold">Premium plan</h4>
                        </div>
                        <div class="panel-body">
                            <p class="text-muted">
                                Lorem ipsum dolor sit amet, illum fastidii dissentias quo ne. Sea ne sint animal iisque, nam an soluta sensibus.
                            </p>
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>
                                        Features
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Dashboard
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Project view
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Contacts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Calendar
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> AngularJS version
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Meteor version
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-square-o"></i> Support
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p class="text-muted">
                                Lorem ipsum dolor sit amet, illum fastidii dissentias quo ne. Sea ne sint animal iisque, nam an soluta sensibus.
                            </p>

                            <h3 class="font-bold">
                                $30/month
                            </h3>
                            <a href="#" class="btn btn-info btn-sm m-t-xs">Select plan</a>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-3">
                    <div class="hpanel plan-box hred">
                        <div class="panel-heading hbuilt text-center">
                            <h4 class="font-bold">Prestige plan</h4>
                        </div>
                        <div class="panel-body">
                            <p class="text-muted">
                                Lorem ipsum dolor sit amet, illum fastidii dissentias quo ne. Sea ne sint animal iisque, nam an soluta sensibus.
                            </p>
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>
                                        Features
                                    </td>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Dashboard
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Project view
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Contacts
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Calendar
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> AngularJS version
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Meteor version
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <i class="fa fa-check-square-o"></i> Support
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p class="text-muted">
                                Lorem ipsum dolor sit amet, illum fastidii dissentias quo ne. Sea ne sint animal iisque, nam an soluta sensibus.
                            </p>

                            <h3 class="font-bold">
                                $40/month
                            </h3>
                            <a href="#" class="btn btn-danger btn-sm m-t-xs">Select plan</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>