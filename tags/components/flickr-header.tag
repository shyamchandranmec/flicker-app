<flickr-header>
    <header>
        <nav>
            <div class="container">
                <div class="nav-wrapper">
                    <a href="/" class="brand-logo">Flickr {this.filterTag} </a>
                    <ul class="right right hide-on-med-and-down" id="nav-mobile">
                        <li>
                        </li>
                    </ul>
                    <a class="button-collapse" href="#" data-activates="nav-mobile"><i class="mdi-navigation-menu"></i></a>
                </div>

            </div>
        </nav>
    </header>
    <script>

        this.on("update", function () {
            if (app.filterTag) {
                this.filterTag = "| " + app.filterTag;
            }
        })
    </script>
</flickr-header>