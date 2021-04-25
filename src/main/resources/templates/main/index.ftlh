<#import "/spring.ftl" as spring/>
<#import "../layout/main.ftlh" as main/>

<@main.render {} >
    <div class="ui container">
        <div class="ui menu">
            <div class="header item">O-Test</div>
            <div class="right menu">
                <div class="item">
                    <div id="search-div" class="ui action left icon input">
                        <input type="text" placeholder="Search">
                        <button class="ui button">Search</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div id="calendar"></div>
                        <div class="ui grid">
                            <div class="ui sixteen column">
                                <div id="search-result">
                                    <div class="google">google</div>
                                    <div class="yandex">yandex</div>
                                    <div class="bing">bing</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-title text-center">
                        <h2>Day</h2>
                    </div>
                    <div class="panel-body">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br/>
    <div class="modal">
        <div class="modal__dialog">
            <div class="modal__content">
                <form action="#">
                    <div data-close class="modal__close">&times;</div>
                    <div class="modal__title"></div>
                    <input required placeholder="Event title" name="title" type="text" class="modal__input">
                    <textarea required placeholder="Event text" name="text" class="modal__text"></textarea>
                    <select required name="type" class="modal__input">
                        <option value="task">task</option>
                        <option value="meeting">meeting</option>
                        <option value="dinner">dinner</option>
                    </select>
                    <button class="btn btn_white btn_min">Add event</button>
                </form>
            </div>
        </div>
    </div>
</@main.render>
