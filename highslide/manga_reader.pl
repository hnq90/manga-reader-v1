#!/bin/perl
opendir(DIR, '.');
open(LIST, '>./manga_highslide.html') || die "Couldn't create manga_highslide.html";
print LIST "
    <html>
        <head>
            <title>Highslide Manga Reader by naruto_thf90</title>
            <script type='text/javascript' src='highslide/highslide.js'></script>
            <link rel='stylesheet' type='text/css' href='highslide/highslide.css'/>
            <script type='text/javascript'>
                hs.graphicsDir = 'highslide/graphics/';
                hs.align = 'center';
                hs.transitions = ['expand', 'crossfade'];
                hs.outlineType = 'rounded-white';
                hs.fadeInOut = true;
                hs.numberPosition = 'caption';
                hs.dimmingOpacity = 0.75;

                // Add the controlbar
                if (hs.addSlideshow) hs.addSlideshow({
                    //slideshowGroup: 'group1',
                    interval: 5000,
                    repeat: false,
                    useControls: true,
                    fixedControls: 'fit',
                    overlayOptions: {
                        opacity: .75,
                        position: 'bottom center',
                        hideOnMouseOut: true
                    }
                });
                </script>
        </head>
        <body>
            <div align='center'>
";

print LIST "
    <div class='highslide-gallery'>
        <a id='thumb1' href='highslide/clicktoview.jpg' class='highslide' onclick='return hs.expand(this)'>
            <img src='highslide/clicktoview.jpg' title='Click to view'>
        </a>
    </div>
    <div class='hidden-container'>
";

@files = readdir(DIR);
closedir(DIR);

shift @files;
shift @files;
@files = sort(@files);
@files = grep(/(\.tiff|\.jpg|\.jpeg|\.tif|\.bmp|\.png|\.JPG|\.JPEG|\.PNG|\.BMP|\.GIF|\.TIFF|\.gif)$/, @files);
foreach $file (@files) {
    print LIST "
    <a href='$file' class='highslide' onclick='return hs.expand(this, { thumbnailId: 'thumb1' })' alt='$file'></a>
    <div class='highslide-caption'>$file</div>
";
}
print LIST "
</div>
<br><br>
<font face='Tahome' size='2' color='ff0000'>Highslide Manga Reader (Perl version) <br>&copy;2009 <b>naruto_thf90</b> - <a href='http://nqhuy90.blogspot.com'>http://nqhuy90.blogspot.com/</a></font>
</div>
</body>
</html>";
close(LIST);
