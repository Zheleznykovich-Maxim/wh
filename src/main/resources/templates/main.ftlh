<#import "parts/common.ftlh" as c>
<@c.page>
<div class="mb-3">
    <form method="get" action="/main" class="row row-cols-lg-auto g-2 align-items-center">
        <div class="col-12">
            <div class="input-group">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            </div>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Submit</button>
        </div>
    </form>
</div>


<a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Add new Message
</a>

<div class="collapse mt-3" id="collapseExample">
    <div class="form-group">
        <form method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <div class="input-group">
                    <input type="text" name="text" class="form-control" placeholder="Введите сообщение" />
                </div>
            </div>
            <div class="mb-3">
                <div class="input-group">
                    <input type="text" name="tag" class="form-control" placeholder="Тэг">
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Choose file</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<div class="row row-cols-1 row-cols-md-3 g-4 mt-1">
    <#list messages as message>
    <div class="col">
        <div class="card">
            <#if message.filename??>
            <img src="/img/${message.filename}" class="card-img-top">
            </#if>
            <div class="card-body">
                <b>${message.id}</b>
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
        </div>
        </div>
    </div>
    <#else>
        No message
    </#list>
</div>
</@c.page>