#!/bin/perl
opendir(DIR, '.');
open(LIST, '>./manga_lightbox.html') || die "Couldn't create manga_lightbox.html";
print LIST "
<html>
    <head>
        <title>Lightbox Manga Reader by naruto_thf90</title>
        <meta http-equiv='Content-Type' content='text/html; charset=UTF-8\'>
        <link rel='stylesheet' href='lightbox/lightbox.css' type='text/css' media='screen' />
        <script src='lightbox/js/prototype.js' type='text/javascript'></script>
        <script src='lightbox/js/scriptaculous.js?load=effects' type='text/javascript'></script>
        <script src='lightbox/js/lightbox.js' type='text/javascript'></script>
        <style type='text/css'>
            * {
                margin: 0; 
                padding:0;
            }
            
            body{
                background: #1A1A1A;
                color: #606060;
                font-family: Verdana, sans-serif;
                font-size: 12px; 
                line-height: 150%;
                margin-left: 0px;
                margin-top: 0px;
                margin-right: 0px;
                margin-bottom: 30px;
                word-wrap: break-word;  /* IE */
            }
            
            img {
                border: 0;
            }

            a:link {
                color: #808080;
            }
            a:visited {
                color: #808080;
            }
            a:hover {
                color: #808080;
            }
            a:active {
                color: #808080;
            } 

            #sidebar{ 
                position:fixed; 
                top: 38px; 
                left:30px;  
                width: 235px; 
            }
            
            * html div#sidebar{ 
                position:absolute; 
                top: 38px; 
                left:30px;
                width: 235px; 
            }
            
            #content{ 
                margin-top: 38px;
                margin-left: 300px;
            }

            #topbar{ 
                margin-top: 30px;
                margin-left: 30px;
            }

            #content_wide{ 
                margin-top: 30px;
                margin-left: 30px;
            }

            #album_title{ 
                color: #FFFFFF;
                font-family: 'Trebuchet MS', Verdana, Sans-Serif;
                font-size: 18px;
                line-height: 150%;
            }
            
            #album_description{ 
                color: #C0C0C0;
                font-family: 'Trebuchet MS', Verdana, Sans-Serif;
                font-size: 12px;
                line-height: 150%;
            }

            .thumbnail{
                height: 128px; 
                width: 128px;
                text-align: center;
                padding:8px;
                background-color: #303030;
                border: 1px solid #404040;
                float: left;
                margin-right: 15px;
                margin-bottom: 15px;
            }

            .thumbnail_text{
                height: 145px; 
                width: 128px;
                text-align: center;
                padding:8px;
                background-color: #303030;
                border: 1px solid #404040;
                float: left;
                margin-right: 15px;
                margin-bottom: 15px;
                overflow: hidden; 
                font-family: 'Trebuchet MS', Verdana, Sans-Serif;
                font-size: 11px;
            }
        </style>
    </head>
    <body>
        <div id='topbar'>
            <div id='album_title'>Lightbox Manga Reader v1.0</div>
        </div>
        <div id='content_wide'>
";

@files = readdir(DIR);
closedir(DIR);

shift @files;
shift @files;
@files = sort(@files);
@files = grep(/(\.tiff|\.jpg|\.jpeg|\.tif|\.bmp|\.png|\.JPG|\.JPEG|\.PNG|\.BMP|\.GIF|\.TIFF|\.gif)$/, @files);
foreach $file (@files) {
    print LIST "
    <div class='thumbnail_text'>
        <p><a href='$file' rel='lightbox[plants]' title='$file'><img src='$file'/ width=100 height=100></a></p>
        <p>$file</p>
    </div>
";
}
print LIST "
</div>
<br><br>
<font face='Tahome' size='2' color='ff0000'>Lightbox Manga Reader (Perl version) <br>&copy;2009 <b>
<a href='http://nqhuy90.blogspot.com'>naruto_thf90</a></b>
</font>
</div>
</body>
</html>";
close(LIST);
