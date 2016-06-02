/**
 * Created by shyam on 08/05/16.
 */
(function () {
    app.flickr = new Flickr({
        api_key: "8fa29b577794b9c0bdf8a8dbdb7024e2",
        progress: false
    });
  
    app.eventBus = riot.observable();
    app.randomIntFromInterval = function (min, max){
        return Math.floor(Math.random() * (max - min + 1) + min);
    };
})();