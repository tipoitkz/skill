Image for downloading files by wget

```
docker build --tag favicon-1 .
docker run -i -e SITEURL='https://wxample.com/favicon.ico' -e SPATH='/images' -v ./images:/images localhost/favicon-1
```
