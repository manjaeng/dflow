var gulp = require("gulp");
// var sass = require("gulp-sass");
// var sourcemaps = require("gulp-sourcemaps");
// var rename = require("gulp-rename");
var cssmin = require("gulp-clean-css");
// var concat  = require("gulp-concat"); // 여러 js  병합
var concatCss = require("gulp-concat-css"); // 여러 css  병합
var urlAdjuster_mc = require("gulp-css-url-adjuster");

// var webserver = require("gulp-webserver");

///////////////////////////////////// MC //////////////////////////////////////
// var imgDomain_mc ="http:/\//dev-app.myomee.com:8081" ;
var imgDomain_mc ="http:/\//10.120.160.172:8081" ;
var css_mc = [
	"css/jquery-ui.css",
	"css/swiper.css",
	"css/base.css",
	"css/common.css",
	"css/member.css",
	"css/look.css",
	"css/home.css"
];
gulp.task("urlAdjuster_mc", function() {
	var d = new Date();
	var css_ver = d.getFullYear() +"_"+ d.getMonth() +"_"+ d.getDay() +"_"+ d.getHours() +"_"+ d.getMinutes() +"_"+ d.getSeconds();

	gulp.src(css_mc)
	    .pipe(urlAdjuster_mc({
			replace: ["../images",imgDomain_mc+"/resources2/app/images"],
	        // prepend: ,
	        append: "?v="+css_ver
	    }))
	    .pipe(cssmin({debug: true}, function(details) {
	        // console.log(details.name + ' : ' + details.stats.originalSize);
	        console.log(details.name + ' : ' + details.stats.minifiedSize);
	    }))
	    .pipe(concatCss("style.min.css"))
	    .pipe(cssmin())
	    .pipe(gulp.dest("css/"))
	    .on('end', function() {
	        console.log("완료")
	    });
});

gulp.task("watch_mc", function () {
    gulp.watch(css_mc, ["urlAdjuster_mc"]);
});

gulp.task("default", ["urlAdjuster_mc","watch_mc"]);

