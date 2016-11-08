<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="col-md-3">
            <div class="hpanel panel-group">
                <div class="panel-body">
                    <div class="text-center text-muted font-bold">Search note or add new</div>

                </div>
                <div class="panel-section">

                    <div class="input-group" style="font-size: 100%">
                        <input type="text" class="form-control" placeholder="Search note...">
                           <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                <i class="glyphicon-customer glyphicon-plus"></i> </button>
                           </span>
                    </div>
                    <button type="button" data-toggle="collapse" data-target="#notes"
                            class="btn-sm visible-xs visible-sm collapsed btn-default btn btn-block m-t-sm">
                        All notes <i class="fa fa-angle-down"></i>
                    </button>
                </div>

                <div id="notes" class="collapse">

                    <div class="panel-body note-link">
                        <a href="#note1" data-toggle="tab">
                        <small class="pull-right text-muted">26.10.2016</small>
                            <h5>Publishing packages</h5>
                        <div class="small">
                            Many desktop publishing packages and web page editors now use Lorem
                        </div>
                        </a>
                    </div>

                    <div class="panel-body note-link">
                        <a href="#note2" data-toggle="tab">
                        <small class="pull-right text-muted">22.01.2016</small>
                        <h5>
                            Latin literature from
                        </h5>
                        <div class="small">
                            Lorem Ipsum, you need to be sure there
                        </div>
                            </a>
                    </div>

                    <div class="panel-body note-link">
                        <a href="#note3" data-toggle="tab">
                        <small class="pull-right text-muted">14.03.2016</small>
                        <h5>
                            The generated Lorem Ipsum
                        </h5>
                        <div class="small">
                            It has survived not only five centuries
                        </div>
                            </a>
                    </div>

                    <div class="panel-body note-link">
                        <a href="#note4" data-toggle="tab">
                        <small class="pull-right text-muted">07.10.2015</small>
                        <h5>
                            Neque porro quisquam
                        </h5>
                        <div class="small">
                            Finibus Bonorum et Malorum
                        </div>
                            </a>
                    </div>

                    <div class="panel-body note-link">
                        <a href="#note5" data-toggle="tab">
                        <small class="pull-right text-muted">12.04.2015</small>
                        <h5>
                            The first line of Lorem Ipsum
                        </h5>
                        <div class="small">
                            Lorem Ipsum which looks reasonable
                        </div>
                            </a>
                    </div>

                </div>



            </div>
        </div>
        <div class="col-md-9">
            <div class="hpanel">

                <div class="panel-body">

                    <div class="text-center hidden">
                        We couldn't find any notes for you.
                    </div>

                    <div class="tab-content">
                        <div id="note1" class="tab-pane active">
                            <div class="pull-right text-muted m-l-lg">
                                26.10.2016
                            </div>
                            <h3>Publishing packages</h3>
                            <hr/>
                            <div class="note-content">
                                <textarea class="form-control">
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.

Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.
                                </textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default"><i class="fa fa-thumbs-o-up"></i> Save</button>
                                <button class="btn btn-sm btn-default"><i class="fa fa-trash"></i> Remove</button>
                            </div>
                        </div>

                        <div id="note2" class="tab-pane">
                            <div class="pull-right text-muted m-l-lg">
                                22.01.2016
                            </div>
                            <h3>Latin literature from </h3>
                            <hr/>
                            <div class="note-content">
                                <textarea class="form-control">
Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.

It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.

Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

                                </textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default"><i class="fa fa-thumbs-o-up"></i> Save</button>
                                <button class="btn btn-sm btn-default"><i class="fa fa-trash"></i> Remove</button>
                            </div>
                        </div>

                        <div id="note3" class="tab-pane">
                            <div class="pull-right text-muted m-l-lg">
                                14.03.2016
                            </div>
                            <h3>The generated Lorem Ipsum </h3>
                            <hr/>
                            <div class="note-content">
                                <textarea class="form-control">
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.

Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.

Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

                                </textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default"><i class="fa fa-thumbs-o-up"></i> Save</button>
                                <button class="btn btn-sm btn-default"><i class="fa fa-trash"></i> Remove</button>
                            </div>
                        </div>

                        <div id="note4" class="tab-pane">
                            <div class="pull-right text-muted m-l-lg">
                                07.10.2015
                            </div>
                            <h3>Neque porro quisquam</h3>
                            <hr/>
                            <div class="note-content">
                                <textarea class="form-control">
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.

Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.
                                </textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default"><i class="fa fa-thumbs-o-up"></i> Save</button>
                                <button class="btn btn-sm btn-default"><i class="fa fa-trash"></i> Remove</button>
                            </div>
                        </div>

                        <div id="note5" class="tab-pane">
                            <div class="pull-right text-muted m-l-lg">
                                12.04.2015
                            </div>
                            <h3>The first line of Lorem Ipsum </h3>
                            <hr/>
                            <div class="note-content">
                                <textarea class="form-control">

Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.

Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

                                </textarea>
                            </div>
                            <div class="btn-group">
                                <button class="btn btn-sm btn-default"><i class="fa fa-thumbs-o-up"></i> Save</button>
                                <button class="btn btn-sm btn-default"><i class="fa fa-trash"></i> Remove</button>
                            </div>
                        </div>


                    </div>

                </div>

            </div>
        </div>
    </div>
</div>