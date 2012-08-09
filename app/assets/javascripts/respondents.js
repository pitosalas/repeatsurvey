    $(function() {
        /** This code runs when everything has been loaded on the page */
        /* Inline sparklines take their values from the contents of the tag */

        $('.inlinesparkline').sparkline('html', {type: 'line',
                    width: '120',
                    height: '30',
                    lineColor: '#ff5656',
                    chartRangeMax: 5,
                    chartRangeMin: 0});

    });
