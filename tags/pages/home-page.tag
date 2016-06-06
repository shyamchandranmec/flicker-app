<home-page>
    <flickr-header></flickr-header>
    <tag-cloud words={this.words}></tag-cloud>
    <photos-container photos={this.photos}></photos-container>
    <script>
        var self = this;
        this.photos = [];
        this.filter = null;
        this.words = [];
        this.on("mount", function () {
            getRecentPhotosFromFlickr(app.pageCount);
            $(window).scroll(function () {
                if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                    if (!app.filter) {
                        if (app.pageCount * app.perPage < app.maxResult) {
                            getRecentPhotosFromFlickr(++app.pageCount);
                        }
                    } else {
                        if (app.filterPageCount * app.perPage < app.maxResult) {
                            searchPhotosFromFlickr(app.filterTag, ++app.filterPageCount);
                        }
                    }
                }
            });

        });


        app.eventBus.on(app.constants.filterOnTags, function (tag) {
            app.filterPageCount = 1;
            app.filterTag = tag;
            self.photos = [];
            searchPhotosFromFlickr(app.filterTag, app.filterPageCount);
        });
        function createTagCloud () {
            var tagMapping = {};
            var words = [];
            self.photos.map(function (photo) {
                var tags = photo.tags.split(" ");
                for (var i = 0; i < tags.length; i++) {
                    if (tags[i].length > 0 && tags[i].length < 40) {
                        if (!tagMapping[tags[i]]) {
                            tagMapping[tags[i]] = 1;
                        } else {
                                tagMapping[tags[i]] += 1;
                        }
                    }
                }
            });
            for (var key in tagMapping) {
                words.push({
                    text: key,
                    weight: tagMapping[key],
                    handlers: {
                        click: function (e) {
                            app.eventBus.trigger(app.constants.filterOnTags, e.target.innerText)
                        }
                    }
                })
            }
            self.words = words;
            self.update()

        }


        function getRecentPhotosFromFlickr (page) {
            app.flickr.photos.getRecent({
                api_key: "8fa29b577794b9c0bdf8a8dbdb7024e2",
                extras: "tags,url_m",
                per_page: app.perPage,
                page: page
            }, function (err, res) {
                self.photos = self.photos.concat(res.photos.photo);
                createTagCloud();
            })
        }

        function searchPhotosFromFlickr (tag, page) {
            app.flickr.photos.search({
                api_key: "8fa29b577794b9c0bdf8a8dbdb7024e2",
                tags: [tag],
                extras: "tags,url_m",
                per_page: app.perPage,
                page: page
            }, function (err, res) {
                self.photos = self.photos.concat(res.photos.photo);
                createTagCloud();
            })
        }

    </script>
</home-page>

