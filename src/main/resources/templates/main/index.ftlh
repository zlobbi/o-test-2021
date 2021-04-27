<#import "/spring.ftl" as spring/>
<#import "../layout/main.ftlh" as main/>
<#import "../layout/form.ftlh" as form/>
<#import "../layout/vertForm.ftl" as vertForm/>

<@main.render {} >
    <div class="row">
        <div class="col-md-8">
            <div class="col-md-12">
                <div class="panel border border-dark">
                    <div class="panel-header"></div>
                    <div class="panel-body">
                        <div id="calendar"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="panel border border-dark">
                <div class="panel-header"></div>
                <div class="panel-title text-center mt-4">
                    <h2>День</h2>
                </div>
                <div class="panel-body">
                    <div class="day-title text-center mb-3">
                        <h3 id="day-title-text" class="text-warning">Выберите день!</h3>
                    </div>
                    <div id="non-selected-hidden-block" class="hidden">
                        <div class="day-tasks-list mb-3">
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action list-group-item-primary">
                                    This is a
                                    <span class="badge badge-info badge-pill">14</span>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action list-group-item-success">
                                    This is a success list group item
                                    <span class="badge badge-success">14</span>
                                </a>
                                <a href="#" class="list-group-item list-group-item-action list-group-item-danger">
                                    This is a danger list group item
                                    <span class="badge badge-danger">14</span>
                                </a>
                            </div>
                        </div>
                        <div id="new-task-add">
                            <div id="new-task" class="panel hidden">
                                <div class="panel-body">
                                    <form action="/" method="post" id="new-task-form" class="">
                                        <div class="form-group d-flex justify-content-between">
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="meeting" name="type"
                                                       class="custom-control-input">
                                                <label class="custom-control-label" for="meeting">Meeting</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="task" name="type"
                                                       class="custom-control-input">
                                                <label class="custom-control-label" for="task">Task</label>
                                            </div>
                                            <div class="custom-control custom-radio custom-control-inline">
                                                <input type="radio" id="dinner"
                                                       name="type" class="custom-control-input">
                                                <label class="custom-control-label" for="dinner">Dinner</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="task-title">Title</label>
                                            <input type="text" class="form-control" id="new-task-title"
                                                   placeholder="title">
                                        </div>
                                        <div class="form-group">
                                            <label for="new-task-description">Description</label>
                                            <textarea class="form-control" id="new-task-description"
                                                      rows="2"></textarea>
                                        </div>
                                        <div class="">
                                            <@vertForm.inputDateTime "domain.start"/>
                                        </div>
                                        <div class="btn-group d-flex">
                                            <button id="new-task-form-submit-btn" type="submit"
                                                    class="btn btn-info">submit
                                            </button>
                                            <button id="new-task-form-reject-btn" type="button"
                                                    class="btn btn-danger">reject
                                            </button>
                                        </div>
                                        <div class="form-group">
                                            <#--                                                <@spring.formRadioButtons "domain.type" types "&nbsp;" 'class="styled" required'/>-->
<#--                                            <@form.inputColor "domain.end"/>-->
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id="new-task-btn" class="">
                                <button type="button" class="btn btn-block btn-info">+</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<#--    </div>-->
</@main.render>
