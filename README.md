# Pages

Static blog generator, relies on [hugo](https://gohugo.io/), [bitly](http://bit.ly), make, curl and jq.
All these binaries are installable for MacOS with [brew](https://brew.sh/).

For each link colllected a bit.ly short url is automatically generated for accounting purposes.

# Usage

```sh
./post.sh link_to ["publication title"]
```

Then go to content/post/ and edit the newly generated post and provde tl;dr and tags.

Then just `make` it (it generates static web site, commits it and commits changes to content folder assuming you have write access to these).

