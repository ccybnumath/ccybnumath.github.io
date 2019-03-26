<!--
.. title: Enable default browser in wsl using wslu
.. slug: enable-default-browser-in-wsl-using-wslu
.. date: 2019-03-25 23:15:30 UTC+08:00
.. tags: 
.. category: 
.. link: 
.. description: 
.. type: text
-->
* install wslu
For Ubuntu,
```bash
curl -s https://packagecloud.io/install/repositories/whitewaterfoundry/wslu/script.deb.sh | sudo bash
sudo apt-get install wslu
sudo update-alternatives --config x-www-browser # or 
wslview -r

```


## References 
1. [Wslu](https://github.com/wslutilities/wslu)
