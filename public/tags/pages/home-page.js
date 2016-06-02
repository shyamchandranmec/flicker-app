riot.tag2('home-page', '<flickr-header></flickr-header> <photos-container photos="{this.filteredPhotos}"></photos-container>', '', '', function(opts) {
        var self = this;
        this.photos = [];
        this.filteredPhotos = [];
        this.filter = null;
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
        function filterPhotos () {
            var filteredPhotos = self.photos.map(function (photo) {
                return photo;
            })
            self.filteredPhotos = filteredPhotos;
        }

        function getRecentPhotosFromFlickr (page) {
            app.flickr.photos.getRecent({
                api_key: "8fa29b577794b9c0bdf8a8dbdb7024e2",
                extras: "tags,url_m",
                per_page: app.perPage,
                page: page
            }, function (err, res) {
                self.photos = self.photos.concat(res.photos.photo);
                filterPhotos();
                self.update()
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
                filterPhotos();
                self.update()
            })
        }

});

