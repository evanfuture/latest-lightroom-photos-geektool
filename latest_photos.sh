#!/bin/bash

FILE_a=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT originalFilename from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='auriana')) AS B ON A.id_local=B.image where pick=1.0));"`;

EXT_a=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT lc_idx_filenameExtension from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='auriana')) AS B ON A.id_local=B.image where pick=1.0));"`;

ROOT_a=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT absolutePath from AgLibraryRootFolder where id_local=(SELECT rootFolder from AgLibraryFolder where id_local=(SELECT folder from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='auriana')) AS B ON A.id_local=B.image where pick=1.0))));"`;

PATH_a=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT pathFromRoot from AgLibraryFolder where id_local=(SELECT folder from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='auriana')) AS B ON A.id_local=B.image where pick=1.0)));"`;

image_a=$ROOT_a$PATH_a$FILE_a;

FILE_b=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT originalFilename from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='sophie')) AS B ON A.id_local=B.image where pick=1.0));"`;

EXT_b=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT lc_idx_filenameExtension from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='sophie')) AS B ON A.id_local=B.image where pick=1.0));"`;

ROOT_b=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT absolutePath from AgLibraryRootFolder where id_local=(SELECT rootFolder from AgLibraryFolder where id_local=(SELECT folder from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='sophie')) AS B ON A.id_local=B.image where pick=1.0))));"`;

PATH_b=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT pathFromRoot from AgLibraryFolder where id_local=(SELECT folder from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='sophie')) AS B ON A.id_local=B.image where pick=1.0)));"`;

image_b=$ROOT_b$PATH_b$FILE_b;

FILE_c=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT originalFilename from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='jane')) AS B ON A.id_local=B.image where pick=1.0));"`;

EXT_c=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT lc_idx_filenameExtension from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='jane')) AS B ON A.id_local=B.image where pick=1.0));"`;

ROOT_c=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT absolutePath from AgLibraryRootFolder where id_local=(SELECT rootFolder from AgLibraryFolder where id_local=(SELECT folder from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='jane')) AS B ON A.id_local=B.image where pick=1.0))));"`;

PATH_c=`sqlite3 /Volumes/Gandalf/Pictures/Lightroom/Lightroom\ Catalog.lrcat "SELECT pathFromRoot from AgLibraryFolder where id_local=(SELECT folder from AgLibraryFile where id_local=(SELECT rootFile from adobe_images where captureTime=(SELECT max(captureTime) FROM adobe_images AS A JOIN (SELECT image from aglibrarykeywordimage where tag=(SELECT id_local from aglibrarykeyword where lc_name='jane')) AS B ON A.id_local=B.image where pick=1.0)));"`;

image_c=$ROOT_c$PATH_c$FILE_c;

/bin/cp $image_a /Users/admin/Code/geekTool/$FILE_a;
/bin/cp $image_b /Users/admin/Code/geekTool/$FILE_b;
/bin/cp $image_c /Users/admin/Code/geekTool/$FILE_c;

if [ "$EXT_a" = "dng" ]; then
    convert $FILE_a auriana.jpg;
    rm $FILE_a;
  else mv $FILE_a auriana.jpg;
fi

if [ "$EXT_b" = "dng" ]; then
    convert $FILE_b sophie.jpg;
    rm $FILE_b;
  else mv $FILE_b sophie.jpg;
fi

if [ "$EXT_c" = "dng" ]; then
    convert $FILE_c jane.jpg;
    rm $FILE_c;
  else mv $FILE_c jane.jpg;
fi
