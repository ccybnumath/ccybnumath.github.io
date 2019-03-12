<!--
.. title: nikola
.. slug: nikola
.. date: 2019-03-11 18:35:29 UTC+08:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->

## install
```bash
$ mkdir nikola && cd nikola
$ mkvirtualenv blog - -python = python3.6
$ pip install Nikola
$ pip install aiohttp watchdog ghp-import2 # requirements for nikola auto
# initial
$ nikola init
$ nikola auto
# visit localhost:8000
# first post
$ nikola new_post -f markdown
$ git init
$ vi .gitignore
# cache
# .doit.db*
# __pycache__
# output
# .ipynb_checkpoints
# .DS_Store
$ git remote add origin git@github.com:[username]/[username].github.io.git
# create branch src for storing source, like: conf.py,*.rst,*.md
$ git checkout -b src
$ 
```
In conf.py, double-check that branch names are correct:
```bash
GITHUB_SOURCE_BRANCH = 'src'
GITHUB_DEPLOY_BRANCH = 'master'
GITHUB_REMOTE_NAME = 'origin'
```
I also recommend setting:
```bash
GITHUB_COMMIT_SOURCE = False
```
So that the nikola github_deploy command below won't touch your src branch.
To deploy the content on master, run:
```bash
nikola github_deploy
```
## References
* [Personal Website with Jupyter Support using Nikola and GitHub Page](https://jiaweizhuang.github.io/blog/nikola-guide/)
* [Getting Started](https://getnikola.com/getting-started.html)
