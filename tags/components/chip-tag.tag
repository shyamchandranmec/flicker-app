<chip-tag>
    <div class="chip tag"  onclick={filterList}>{opts.data}</div>

    <script>
        filterList() {
            app.filter = true;
            app.eventBus.trigger(app.constants.filterOnTags, opts.data)
        }
    </script>

</chip-tag>