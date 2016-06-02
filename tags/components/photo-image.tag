<photo-image>
    <div class="card-image">
        <img  name = "image" class="materialboxed" src="{opts.url}" data-title = "{opts.title}" height="{opts.height}">
        <span class="card-title">{opts.title.substring(0,20)}</span>
    </div>
    <script>
        this.on("update",function () {
            console.log("update")
            $('img', this.root).materialbox();
        })
    </script>
</photo-image>