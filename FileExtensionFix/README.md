# FileExtensionFix

A few weeks ago I did a dump of an image folder, but unfortunately the extensions totally got screwed up. Lazy as I am. I wrote a small script that checks the file extension to the mime type and fix it if needed.

A simple test can be done by running:
`
./FileExtentionFix.sh "./Test image"
`

This should fix  the image ralph-wiggum

![Before](https://github.com/BlackC0ffee/Bash/blob/master/FileExtensionFix/Test%20image/Before.png?raw=true)

![After](https://github.com/BlackC0ffee/Bash/blob/master/FileExtensionFix/Test%20image/After.png?raw=true)

**Note:** The script runs recursive and fixes only JPG, GIF and PNG, but you can easily extend it. Also if you want to do a dry run, just comment the line:

`mv "$entry" "$(dirname "$entry")/$filename.${mime[$mimetype]}"`
