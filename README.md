# Workshop Content - WIP
This is the primary DataStax workshop content repo. Each folder represents a group of modules that can be run as a workshop. 

> Workshops can be built by using modules from any workshop content folder.

* Workshops can be built from multiple workshop folders
* External content can be used like: google docs and YouTube videos
  * DataStax has a public folder with read-only access where google slides for workshop contents is managed
  * Alternatively PDFs can be generated and includes in the workshop content folder

## Understanding the workshop builder configuration file

1. While `dscda` will build a generic homepage for your workshop you can setup a custom one by supplying a markdown file via the `workshopHomepage` field in the `config.json` file. This is not required.

> For workshops, it is common to use the homepage as an agenda for the workshop.

* create an *images* directory under your workshop folder

## TODO
* Create a number of reusable workshop *config.json*
* Create standard invite emails
* Define the standard readme for each workshop folder. 