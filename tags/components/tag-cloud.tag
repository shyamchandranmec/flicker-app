<tag-cloud>
    <div id="tag-cloud">
    </div>

    <script>
        this.on("mount", function () {
            $('#tag-cloud ').jQCloud(opts.words,{
                width: 700,
                height: 350
            })
        })

        this.on("update", function () {
            $('#tag-cloud ').jQCloud('update', opts.words)
        })

        filterResult(e) {
            e.preventDefault();
            var tag = e.target.dataset.detail;
            app.eventBus.trigger(app.constants.filterOnTags, tag)
        }
    </script>
</tag-cloud>