#Latest Lightroom Photos for GeekTool
This script is working, but could be better.  It needs proper documentation and improvements.  At its core, it reads the Lightroom Catalog Database, pulls the latest Flagged/Picked image for each keyword you set (in the demo those are the lowercase names of my wife and daughters), and creates jpg versions with the keywords as filenames in the folder.  Then, you can setup Geektool to run the script and have it update every so often.  Et Voila!  Latest pics on your desktop.

This assumes you have a number of tools installed, including Lightroom 6 and GeekTool.  Use at your own risk, as this is only tested with my own setup.  It doesn't try to do anything other than SELECT within the database, but be careful anyway.
