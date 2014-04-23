// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require d3
//= require_tree .

$(function() {



var width = 1140,
    height = 600;

    var path = d3.geo.path();

    var svg = d3.select(".map").append("svg")
    .attr("width", width)
    .attr("height", height);

    queue()
    .defer(d3.json, "zips_us_topo.json")
    .await(ready);

    function ready(error, us) {
      svg.append("g")
      .attr("class", "counties")
      .selectAll("path")
      .data(topojson.feature(us, us.objects.zip_codes_for_the_usa).features)
      .enter().append("path")
      .attr("class", "zip")
      .style("fill", "none")
      .style("stroke", "#CCC")
      .style("stroke-width", ".5px")
      .attr("data-zip", function(d) {return d.properties.zip; })
      .attr("data-state", function(d) {return d.properties.state; })
      .attr("data-name", function(d) {return d.properties.name; })
      .attr("d", path);
    }

})