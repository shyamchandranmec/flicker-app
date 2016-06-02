<photo-tags>
    <div if={this.showTags} class="card-action" >
        <chip-tag  each={item in opts.tags_array}  data = "{item}"></chip-tag>
    </div>
    <script>
        this.showTags = numOfTags() > 0 ? true : false;

        function numOfTags () {
            if (opts.tags_array.length == 1) {
                if (opts.tags_array[0] == "") {
                    return 0;
                }
            } else {
                return opts.tags_array.length;
            }
        }
    </script>
</photo-tags>