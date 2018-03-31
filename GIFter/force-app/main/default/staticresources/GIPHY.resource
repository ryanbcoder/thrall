window._GIPHY = (function() {
    var apiKey = "changethis_foZBbgyFntDZErTySgzKAPzlY2HuBg7z";
    var _results = null;

    return { //public API
        getApiKey: function() {
            return apiKey;
        },
        getResults: function() {
            return _results;
        },
        setResults: function(results) {
          _results = results
        }
    };
}());

