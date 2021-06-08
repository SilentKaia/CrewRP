/*!
 *  Howler.js Radio Demo
 *  howlerjs.com
 *
 *  (c) 2013-2019, James Simpson of GoldFire Studios
 *  goldfirestudios.com
 *
 *  MIT License
 */

// Cache references to DOM elements.
var elms = ['station0',
    'title0',
    'live0',
    'playing0',
    'station1',
    'title1',
    'live1',
    'playing1',
    'station2',
    'title2',
    'live2',
    'playing2',
    'station3',
    'title3',
    'live3',
    'playing3',
    'station4',
    'title4',
    'live4',
    'playing4',
    'volumeBtn',
    'volume',
    'barEmpty',
    'barFull',
    'sliderBtn'];
elms.forEach(function (elm) {
    window[elm] = document.getElementById(elm);
});

/**
 * Radio class containing the state of our stations.
 * Includes all methods for playing, stopping, etc.
 * @param {Array} stations Array of objects with station details ({title, src, howl, ...}).
 */
var Radio       = function (stations) {
    var self = this;

    self.stations = stations;
    self.index    = 0;

    // Setup the display for each station.
    for (var i = 0; i < self.stations.length; i++) {
        window['title' + i].innerHTML = '<b>' + self.stations[i].freq + '</b> ' + self.stations[i].title;
        window['station' + i].addEventListener('click', function (index) {
            var isNotPlaying = (self.stations[index].howl && !self.stations[index].howl.playing());

            // Stop other sounds or the current one.
            radio.stop();

            // If the station isn't already playing or it doesn't exist, play it.
            if (isNotPlaying || !self.stations[index].howl) {
                radio.play(index);
            }
        }.bind(self, i));
    }
};
Radio.prototype = {
    /**
     * Play a station with a specific index.
     * @param  {Number} index Index in the array of stations.
     */
    play: function (index) {
        var self = this;
        var sound;

        index    = typeof index === 'number' ? index : self.index;
        var data = self.stations[index];

        // If we already loaded this track, use the current one.
        // Otherwise, setup and load a new Howl.
        if (data.howl) {
            sound = data.howl;
        } else {
            sound = data.howl = new Howl({
                                             src:    data.src,
                                             html5:  true, // A live stream can only be played through HTML5 Audio.
                                             format: ['mp3', 'aac']
                                         });
        }

        // Begin playing the sound.
        sound.play();
        sound.volume(0.2);
        // Toggle the display.
        self.toggleStationDisplay(index, true);

        // Keep track of the index we are currently playing.
        self.index = index;
    },

    /**
     * Stop a station's live stream.
     */
    stop: function () {
        var self = this;

        // Get the Howl we want to manipulate.
        var sound = self.stations[self.index].howl;

        // Toggle the display.
        self.toggleStationDisplay(self.index, false);

        // Stop the sound.
        if (sound) {
            sound.unload();
        }
    },

    volume: function (val) {
        var self = this;

        // Update the global volume (affecting all Howls).
        Howler.volume(val);

        // Update the display on the slider.
        var barWidth         = (val * 90) / 100;
        barFull.style.width  = (barWidth * 100) + '%';
        sliderBtn.style.left = (window.innerWidth * barWidth + window.innerWidth * 0.05 - 25) + 'px';
    },

    toggleVolume: function () {
        var self    = this;
        var display = (volume.style.display === 'block') ? 'none' : 'block';

        setTimeout(function () {
            volume.style.display = display;
        }, (display === 'block') ? 0 : 500);
        volume.className = (display === 'block') ? 'fadein' : 'fadeout';
    },

    /**
     * Toggle the display of a station to off/on.
     * @param  {Number} index Index of the station to toggle.
     * @param  {Boolean} state true is on and false is off.
     */
    toggleStationDisplay: function (index, state) {
        var self = this;

        // Highlight/un-highlight the row.
        window['station' + index].style.backgroundColor = state ? 'rgba(255, 255, 255, 0.33)' : '';

        // Show/hide the "live" marker.
        window['live' + index].style.opacity = state ? 1 : 0;

        // Show/hide the "playing" animation.
        window['playing' + index].style.display = state ? 'block' : 'none';
    }

};

// Setup our new radio and pass in the stations.
var radio = new Radio([{
    freq:  'CurveRadio.com',
    title: 'Curve Radio',
    src:   'http://162.241.178.83:8000/tcrp.ogg',
    howl:  null
}, {
    freq:  '104.7',
    title: 'The Crew RP Public Radio',
    src:   'http://162.241.178.83:8000/tcrp',
    howl:  null
}]);


volumeBtn.addEventListener('click', function () {
    radio.toggleVolume();
});
volume.addEventListener('click', function () {
    radio.toggleVolume();
});
barEmpty.addEventListener('click', function (event) {
    var per = event.layerX / parseFloat(barEmpty.scrollWidth);
    radio.volume(per);
});
sliderBtn.addEventListener('mousedown', function () {
    window.sliderDown = true;
});
sliderBtn.addEventListener('touchstart', function () {
    window.sliderDown = true;
});
volume.addEventListener('mouseup', function () {
    window.sliderDown = false;
});
volume.addEventListener('touchend', function () {
    window.sliderDown = false;
});

var move = function (event) {
    if (window.sliderDown) {
        var x      = event.clientX || event.touches[0].clientX;
        var startX = window.innerWidth * 0.05;
        var layerX = x - startX;
        var per    = Math.min(1, Math.max(0, layerX / parseFloat(barEmpty.scrollWidth)));
        radio.volume(per);
    }
};

volume.addEventListener('mousemove', move);
volume.addEventListener('touchmove', move);


