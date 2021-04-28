<#import "/spring.ftl" as spring/>
<#import "../layout/main.ftlh" as main/>
<#import "../layout/vertForm.ftl" as vertForm/>

<@main.render {} >
    <div class="row">
        <div class="col-md-8 col-sm-12">
            <div class="panel border border-dark">
                <div class="panel-body">
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-12">
            <div class="panel border border-dark">
                <div class="panel-header"></div>
                <div class="panel-title text-center mt-4">
                    <h2><@spring.message "day"/></h2>
                </div>
                <div class="panel-body">
                    <div class="day-title text-center mb-2">
                        <h3 id="day-title-text" class="text-white py-1 bg-day"><@spring.message "select.day"/></h3>
                    </div>
                    <div id="non-selected-hidden-block" class="hidden">
                        <div id="tasks-list" class="day-tasks-list mb-3">
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-action list-group-item-primary">
                                    This is a
                                    <span class="badge badge-info badge-pill"></span>
                                </a>
                            </div>
                        </div>
                        <div id="new-task-add">
                            <div id="new-task" class="mt-4">
                                <form action="/" method="post" id="new-task-form">
                                    <@vertForm.radioButtonAsButton "domain.type" eventTypes true/>
                                    <@vertForm.inputText "domain.title" "text" true />
                                    <@vertForm.textAreaSimple "domain.description"/>
                                    <div class="btn-group d-flex">
                                        <@vertForm.inputSubmit "action.add" "btn btn-info"/>
                                        <@vertForm.inputCancel "action.cancel" "btn btn-danger"/>
                                    </div>
                                    <@vertForm.inputDateTime "domain.start"/>
                                    <@vertForm.inputText "domain.end"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</@main.render>
