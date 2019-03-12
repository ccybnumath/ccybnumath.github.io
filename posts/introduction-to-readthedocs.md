<!--
.. title: Introduction to `readthedocs`
.. slug: introduction-to-readthedocs
.. date: 2019-03-12 16:40:53 UTC+08:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

```bash
# create the envi
chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc$ mkdir documentation && cd documentation

chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc$ makdir first_doc && cd first_doc

chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc$ mkvirtualenv doucumentation

(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc$ mkdir docs && cd docs                                                              
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ sphinx-quickstart                                                             
Welcome to the Sphinx 1.8.5 quickstart utility.                                                                                                          
                                                                                                                                                         
Please enter values for the following settings (just press Enter to                                                                                      
accept a default value, if one is given in brackets).                                                                                                    
                                                                                                                                                         
Selected root path: .                                                                                                                                    
                                                                                                                                                         
You have two options for placing the build directory for Sphinx output.                                                                                  
Either, you use a directory "_build" within the root path, or you separate                                                                               
"source" and "build" directories within the root path.                                                                                                   
> Separate source and build directories (y/n) [n]: n                                                                                                     
                                                                                                                                                         
Inside the root directory, two more directories will be created; "_templates"                                                                            
for custom HTML templates and "_static" for custom stylesheets and other static                                                                          
files. You can enter another prefix (such as ".") to replace the underscore.                                                                             
> Name prefix for templates and static dir [_]:                                                                                                          
                                                                                                                                                         
The project name will occur in several places in the built documentation.                                                                                
> Project name: first_doc                                                                                                                                
> Author name(s): chencanyi                                                                                                                              
> Project release []:                                                                                                                                    
                                                                                                                                                         
If the documents are to be written in a language other than English,                                                                                     
you can select a language here by its language code. Sphinx will then                                                                                    
translate text that it generates into that language.                                                                                                     
                                                                                                                                                         
For a list of supported codes, see                                                                                                                       
http://sphinx-doc.org/config.html#confval-language.                                                                                                      
> Project language [en]: en                                                                                                                              
                                                                                                                                                         
The file name suffix for source files. Commonly, this is either ".txt"                                                                                   
or ".rst".  Only files with this suffix are considered documents.                                                                                        
> Source file suffix [.rst]:                                                                                                                             
                                                                                                                                                         
One document is special in that it is considered the top node of the                                                                                     
"contents tree", that is, it is the root of the hierarchical structure                                                                                   
of the documents. Normally, this is "index", but if your "index"                                                                                         
document is a custom template, you can also set this to another filename.                                                                                
> Name of your master document (without suffix) [index]:                                                                                                 
Indicate which of the following Sphinx extensions should be enabled:                                                                                     
> autodoc: automatically insert docstrings from modules (y/n) [n]:                                                                                       
> doctest: automatically test code snippets in doctest blocks (y/n) [n]:                                                                                 
> intersphinx: link between Sphinx documentation of different projects (y/n) [n]:                                                                        
> todo: write "todo" entries that can be shown or hidden on build (y/n) [n]: y                                                                           
> coverage: checks for documentation coverage (y/n) [n]:                                                                                                 
> imgmath: include math, rendered as PNG or SVG images (y/n) [n]:                                                                                        
> mathjax: include math, rendered in the browser by MathJax (y/n) [n]: y                                                                                 
> ifconfig: conditional inclusion of content based on config values (y/n) [n]: y                                                                         
> viewcode: include links to the source code of documented Python objects (y/n) [n]: y                                                                   
> githubpages: create .nojekyll file to publish the document on GitHub pages (y/n) [n]: y                                                                
                                                                                                                                                         
A Makefile and a Windows command file can be generated for you so that you                                                                               
only have to run e.g. `make html' instead of invoking sphinx-build                                                                                       
directly.                                                                                                                                                
> Create Makefile? (y/n) [y]: y                                                                                                                          
> Create Windows command file? (y/n) [y]: n                                                                                                              
                                                                                                                                                         
Creating file ./conf.py.                                                                                                                                 
Creating file ./index.rst.                                                                                                                               
Creating file ./Makefile.                                                                                                                                
                                                                                                                                                         
Finished: An initial directory structure has been created.                                                                                               
                                                                                                                                                         
You should now populate your master file ./index.rst and create other documentation                                                                      
source files. Use the Makefile to build the docs, like so:                                                                                               
   make builder                                                                                                                                          
where "builder" is one of the supported builders, e.g. html, latex or linkcheck.                                                                         
                                                                                                                                                         
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ ls                                                                            
Makefile  _build  _static  _templates  conf.py  index.rst                                                                                                
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ vi index.rst                                                                  
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ vi all-about-me.rst                                                                                                                                        
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ make html                                                                     
Running Sphinx v1.8.5                                                                                                                                    
loading pickled environment... done                                                                                                                      
building [mo]: targets for 0 po files that are out of date                                                                                               
building [html]: targets for 1 source files that are out of date                                                                                         
updating environment: [] 0 added, 1 changed, 0 removed                                                                                                   
reading sources... [100%] index                                                                                                                          
/home/chencanyi/documentation/first_doc/docs/index.rst:9: WARNING: toctree contains reference to nonexisting document ':caption: Contents:'              
looking for now-outdated files... none found                                                                                                             
pickling environment... done                                                                                                                             
checking consistency... done                                                                                                                             
preparing documents... done                                                                                                                              
writing output... [100%] index                                                                                                                           
generating indices... genindex                                                                                                                           
writing additional pages... search                                                                                                                       
copying static files... done                                                                                                                             
copying extra files... done                                                                                                                              
dumping search index in English (code: en) ... done                                                                                                      
dumping object inventory... done                                                                                                                         
build succeeded, 1 warning.                                                                                                                              
                                                                                                                                                         
The HTML pages are in _build/html.                                                                                                                       
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ git add .                                                                     
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ git commit -m "init"                                                          
[master a7f8c35] init                                                                                                                                    
 4 files changed, 238 insertions(+)                                                                                                                      
 create mode 100644 docs/Makefile                                                                                                                        
 create mode 100644 docs/all-about-me.rst                                                                                                                
 create mode 100644 docs/conf.py                                                                                                                         
 create mode 100644 docs/index.rst                                                                                                                       
(doucumentation) chencanyi@DESKTOP-0HHN0UG:~/documentation/first_doc/docs$ git push origin master                                                        
```
# References
* [Documentation using Sphinx and ReadTheDocs.org
](https://dont-be-afraid-to-commit.readthedocs.io/en/latest/documentation.html)
