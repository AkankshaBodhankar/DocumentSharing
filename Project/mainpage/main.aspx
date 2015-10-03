<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="mainpage_main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="Metro, a sleek, intuitive, and powerful framework for faster and easier web development for Windows Metro Style.">
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, metro, front-end, frontend, web development">
    <meta name="author" content="Sergey Pimenov and Metro UI CSS contributors">

    <link rel='shortcut icon' type='image/x-icon' href='../favicon.ico' />
    <title>Tiles examples :: Start Screen :: Metro UI CSS - The front-end framework for developing projects on the web in Windows Metro Style</title>

    <link href="css/metro.css" rel="stylesheet"/>
    <link href="../master/docs/css/metro-icons.css" rel="stylesheet"/>
    <link href="../master/docs/css/docs.css" rel="stylesheet"/>

    <script src="../../master/docs/js/jquery-2.1.3.min.js"></script>
    <script src="../../master/docs/js/metro.js"></script>
    <script src="../../master/docs/js/docs.js"></script>
    <script src="../../master/docs/js/prettify/run_prettify.js"></script>
    <script src="../../master/docs/js/ga.js"></script>

    <style>
        .tile-area-controls {
            position: fixed;
            right: 40px;
            top: 40px;
        }

        .tile-group {
            left: 100px;
        }

        .tile, .tile-small, .tile-sqaure, .tile-wide, .tile-large, .tile-big, .tile-super {
            opacity: 0;
            -webkit-transform: scale(.8);
            transform: scale(.8);
        }

        .charm.right-side {
            width: 300px;
            right: -300px;
        }

        #charmSettings .button {
            margin: 5px;
        }

        @media screen and (max-width: 640px) {
            .tile-area {
                overflow-y: scroll;
            }
            .tile-area-controls {
                display: none;
            }
        }

        @media screen and (max-width: 320px) {
            .tile-area {
                overflow-y: scroll;
            }

            .tile-area-controls {
                display: none;
            }

        }
    </style>

    <script>

        /*
         * Do not use this is a google analytics fro Metro UI CSS
         * */
        if (window.location.hostname !== 'localhost') {

            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-58849249-3', 'auto');
            ga('send', 'pageview');

        }

    </script>

    <script>
        (function ($) {
            $.StartScreen = function () {
                var plugin = this;
                var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;

                plugin.init = function () {
                    setTilesAreaSize();
                    if (width > 640) addMouseWheel();
                };

                var setTilesAreaSize = function () {
                    var groups = $(".tile-group");
                    var tileAreaWidth = 80;
                    $.each(groups, function (i, t) {
                        if (width <= 640) {
                            tileAreaWidth = width;
                        } else {
                            tileAreaWidth += $(t).outerWidth() + 80;
                        }
                    });
                    $(".tile-area").css({
                        width: tileAreaWidth
                    });
                };

                var addMouseWheel = function () {
                    $("body").mousewheel(function (event, delta, deltaX, deltaY) {
                        var page = $(document);
                        var scroll_value = delta * 50;
                        page.scrollLeft(page.scrollLeft() - scroll_value);
                        return false;
                    });
                };

                plugin.init();
            }
        })(jQuery);

        $(function () {
            $.StartScreen();

            var tiles = $(".tile, .tile-small, .tile-sqaure, .tile-wide, .tile-large, .tile-big, .tile-super");

            $.each(tiles, function () {
                var tile = $(this);
                setTimeout(function () {
                    tile.css({
                        opacity: 1,
                        "-webkit-transform": "scale(1)",
                        "transform": "scale(1)",
                        "-webkit-transition": ".3s",
                        "transition": ".3s"
                    });
                }, Math.floor(Math.random() * 500));
            });

            $(".tile-group").animate({
                left: 0
            });
        });
        function showSearch() {
            var charm = $("#charmSearch");

            if (charm.data('hidden') == undefined) { charm.data('hidden', true); }

            if (!charm.data('hidden')) {

                charm.animate({
                    right: -300
                });

                charm.data('hidden', true);
            } else {
                charm.animate({
                    right: 0
                });
                charm.data('hidden', false);
            }
        }

        function showSettings() {
            var charm = $("#charmSettings");

            if (charm.data('hidden') == undefined) { charm.data('hidden', true); }

            if (!charm.data('hidden')) {

                charm.animate({
                    right: -300
                });

                charm.data('hidden', true);
            } else {
                charm.animate({
                    right: 0
                });
                charm.data('hidden', false);
            }
        }

        function setSearchPlace(el) {
            var a = $(el);
            var text = a.text();
            var toggle = a.parents('label').children('.dropdown-toggle');

            toggle.text(text);
        }

        $(function () {
            var current_tile_area_scheme = localStorage.getItem('tile-area-scheme') || "tile-area-scheme-dark";
            $(".tile-area").removeClass(function (index, css) {
                return (css.match(/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
            }).addClass(current_tile_area_scheme);

            $(".schemeButtons .button").hover(
                    function () {
                        var b = $(this);
                        var scheme = "tile-area-scheme-" + b.data('scheme');
                        $(".tile-area").removeClass(function (index, css) {
                            return (css.match(/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
                        }).addClass(scheme);
                    },
                    function () {
                        $(".tile-area").removeClass(function (index, css) {
                            return (css.match(/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
                        }).addClass(current_tile_area_scheme);
                    }
            );

            $(".schemeButtons .button").on("click", function () {
                var b = $(this);
                var scheme = "tile-area-scheme-" + b.data('scheme');

                $(".tile-area").removeClass(function (index, css) {
                    return (css.match(/(^|\s)tile-area-scheme-\S+/g) || []).join(' ');
                }).addClass(scheme);

                current_tile_area_scheme = scheme;
                localStorage.setItem('tile-area-scheme', scheme);

                showSettings();
            });
        });
    </script>
</head>
<body runat="server" id="body" class="bg-img" >
    <form id="form1" runat="server">
    <div>
    <div class="tile-area tile-area-scheme-dark fg-white" style="padding-top:5px;height:123px" >
        <div class="image-container" style="width:300px;height:100px;float:left;padding-right:10px;">
        <img src="../placement management/images/kmit logo.gif" /></div>
        <h1 class="tile-area-title" style="float:left;padding-top:20px;padding-left:200px">Keshav Memorial Institute Of Technology</h1>
        <p style="vertical-align:central;float:left;padding-left:350px;top:-20px">(Approved by AICTE and Affiliated to JNTU)</p>
        
    </div>
        <div>
            <div style="float:left;width:220px;">
                <ul class="sidebar compact tile-area-scheme-dark  " id="sidebar-2">
                            <li><a href="#">
                                <span class=" mif-drive-eta icon"></span>
                                <span class="title">Visitors</span>
                                
                            </a></li>
                            <li><a href="#">
                                <span class="mif-vpn-publ icon"></span>
                                <span class="title">Notebook</span>
                                
                            </a></li>
                            <li><a href="#">
                                <span class=" mif-library icon"></span>
                                <span class="title">Forum</span>
                                
                            </a></li>
                            <li><a href="#">
                                <span class=" mif-profile icon"></span>
                                <span class="title">Faculty Leave</span>
                               
                            </a></li>
                            <li><a href="../placement management/logins/alogin.aspx">
                                <span class=" mif-school icon"></span>
                                <span class="title">Placements</span>
                               
                            </a></li>
                            <li><a href="#">
                                <span class=" mif-chart-line icon"></span>
                                <span class="title">Student Performance</span>
                              
                            </a></li>
                            <li><a href="#">
                                <span class=" mif-books icon"></span>
                                <span class="title">Library</span>
                               
                            </a></li>
                            <li><a href="#">
                                <span class=" mif-table icon"></span>
                                <span class="title">Time table</span>
                                
                            </a></li>
                            <li><a href="#">
                                <span class=" mif-security icon"></span>
                                <span class="title">Gate Pass</span>
                                
                            </a></li>
                            <li><a href="#">
                                <span class=" mif-lab icon"></span>
                                <span class="title">Lab Management</span>
                               
                            </a></li>
                        </ul>
                <script>
                    $("#sidebar-2").hover(function () {
                        $("#sidebar-2").toggleClass('compact');
                    });
                        </script>
            
            </div>
            </div>
    <div  >
        <div class="tile-group double">
        <span runat="server" id="tile1" class="tile-group-title" style="position:static;color:black;">about college</span>
        <div class="tile-container" >
        <a href="management.aspx" style="color:white"> <div class=" tile-wide bg-emerald" data-role="tile" data-effect="slideUpDown">
    <div class="tile-content">
        <div class="live-slide"> About college </div>
        
        <div class="live-slide image-container">
            <img alt="" src="css/kmit/DSC_0082.jpg" /></div>
            
    </div>
            <span class="tile-label">About Us</span>
</div> </a>


            
            


            <a style="color:white"> <div class="tile bg-blue " data-role="tile" data-effect="slideUpDown">
    <div class="tile-content">
         <div class="image-container">
            <img alt="" src="css/kmit/logo.png" /></div>
    </div>
       <span class="tile-label" style="color:black">KMITRA</span>
</div> </a>

            <a href="#" style="color:white"> <div class=" tile bg-violet" data-role="tile" data-effect="slideUpDown">
    <div class="tile-content">
        <div class="live-slide" style="padding:15px"> College for second years opens from 2-07-2015. </div>
        <div class="live-slide " style="padding:15px"> college timings for 3rd year students are from 9:30 A.M to 4:15 P.M  </div>
        <div class="live-slide" style="padding:15px"> orientation for first year students is to be held on 1st august at 9:30 A.M  </div>  
    </div>
            <span class="tile-label">Notifications</span>
</div> </a>

            
        </div>
    </div>
    

    <div class="tile-group double">
        <span runat="server" id="tile2" class="tile-group-title" style="position:static;color:black;">New to kmit?</span>
        <div class="tile-container" >

            <a style="color:white"> <div class="tile bg-lightBlue" data-role="tile" data-effect="slideUpDown">
    <div class="tile-content">
        <div class=" tile-content iconic"><span class="icon mif-event-available"></span> </div> 
    </div>
       <span class="tile-label">Appointments</span>
</div> </a>


            <a href="stats.aspx" style="color:white"> <div class="tile bg-red " data-role="tile" data-effect="slideUpDown">
    <div class="tile-content">
        <div class=" tile-content iconic"><span class="icon mif-chart-line"></span> </div> 
    </div>
       <span class="tile-label">Statistics</span>
</div> </a>



            <a style="color:white"> <div class=" tile-wide bg-blue " data-role="tile" data-effect="slideUpDown">
    <div class="tile-content">
        <div class="carousel image-container" data-role="carousel">
            <div class="slide"><img src="css/kmit/1.png"></div>
            <div class="slide"><img src="css/kmit/DSC_00847.jpg"></div>
            <div class="slide"><img src="css/kmit/DSC_0108.jpg"></div>
        </div>
            
    </div>
</div> </a>
           



            
        </div>
    </div>
    

    <div class="tile-group double">
        <span runat="server" id="tile3" class="tile-group-title" style="position:static;color:black">Mr. Neil Gogte</span>
        <div class="tile-container" >
           <div class=" tile-wide bg-grayDarker" data-role="tile">
                   <video src="css/kmit/KMIT.mp4" width="310px" height="150px" controls="controls" poster="css/kmit/sir.jpg">
                      
                       Your browser does not support the video tag.
                   </video>
    
</div>
             <div class=" tile-small bg-indigo " data-role="tile" data-effect="slideUpDown">
                 <div class="tile-content">
        <div class=" tile-content iconic " style="color:white"><span class="icon mif-twitter"></span> </div> 
    </div>
             </div>
            <a href="https://plus.google.com/u/0/109796373994268564150/about">
             <div class=" tile-small bg-crimson" data-role="tile" data-effect="slideUpDown">
                 <div class="tile-content">
         <div class=" tile-content iconic " style="color:white"><span class="icon mif-google-plus"></span> </div> 
    </div>
             </div></a>



            <a href="https://www.facebook.com/kmit2?ref=br_rs">
             <div class=" tile-small bg-darkCyan " data-role="tile" data-effect="slideUpDown">
                 <div class="tile-content">
                     <div class=" tile-content iconic " style="color:white"><span class="icon mif-facebook"></span> </div> 
       
    </div>
             </div></a>


           <a href="https://www.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Keshav+Memorial+Institute+of+Technology

,+Bhawani+Nagar,+Narayanguda,+Hyderabad,+Andhra+Pradesh&amp;aq=0&amp;oq=kes&amp;sll=17.408909,78.465759&amp;sspn=0.403598,0.4

41513&amp;ie=UTF8&amp;hq=Keshav+Memorial+Institute+of+Technology,&amp;hnear=Bhawani+Nagar,+Narayanguda,+Hyderabad,+Ranga+Redd

y,+Andhra+Pradesh&amp;t=m&amp;ll=17.397119,78.490289&amp;spn=0.006295,0.006295" target="_blank">  <div class=" tile-small bg-emerald" data-role="tile" data-effect="slideUpDown">
    <div class="tile-content">
        <div class=" tile-content iconic " style="color:white"><span class="icon mif-location"></span> </div> 
    </div>
             </div></a>

        </div>
    </div>
               
    </div>
    </div>
    </form>
</body>
</html>
