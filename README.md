# security-engineering-3rd-edition-ebook ![](https://img.shields.io/badge/Status-Unavailable-orange)

*Update*: The website currently only has 7 sample chapters since the remaining were removed at the book's publication. The script should automatically start working in May 2024, when these chapters should become available.

![third-edition-security-engineering-book-cover](cover-thumb.jpg)

This is just the script to generate a combined PDF from the currently-online-chapters that were published for review. The script also takes care of putting in the right bookmarks for all the chapters in the generated PDF file.

The e-book version is available now for $42 from [Wiley](https://www.wiley.com/en-us/Security+Engineering%3A+A+Guide+to+Building+Dependable+Distributed+Systems%2C+3rd+Edition-p-9781119642817) and for $47 from [Amazon](https://www.amazon.com/Security-Engineering-Building-Dependable-Distributed-ebook/dp/B08P69FT4Q).

## Chapters

See `book.md` for the bookmark titles used by the script.

## How to generate the book?

Run `./generate.sh`. You will need `pystitcher`, and `wget` installed. Alternatively, you can run it using Docker.

### Docker

```
docker run --detach --name security-engineering-ebook captn3m0/security-engineering-ebook
7553d55547603b0e3d47332f4cd55a126ace10e0e965547b0fae06e3c7b16229

docker logs security-engineering-ebook -f
Starting PDF download
All PDFs downloaded
PDF files combined
Bookmarks attached to PDF
PDF File generated: security-engineering-3rd-edition.pdf

docker cp security-engineering-ebook:/security-engineering-ebook/security-engineering-3rd-edition.pdf .
```

Once the script finishes running, check the `security-engineering-3rd-edition.pdf` file.

## Support the Authors

Buy the second edition of the book from:

-   [Amazon.com](http://www.amazon.com/exec/obidos/ASIN/0470068523/rossandersshomep)
-   [Wiley](http://he-cda.wiley.com/WileyCDA/HigherEdTitle/productCd-0470068523.html)
-   [Amazon.co.uk](http://www.amazon.co.uk/exec/obidos/ASIN/0470068523/rossandersshomep)
-   [Kindle Version](http://www.amazon.co.uk/gp/product/B004BDOZI0/ref=as_li_tf_tl?ie=UTF8&tag=rossanderssho-21&linkCode=as2&camp=1634&creative=6738&creativeASIN=B004BDOZI0)

A combined PDF of the first edition is available directly from the author at <http://www.cl.cam.ac.uk/~rja14/musicfiles/manuscripts/SEv1.pdf>.

## Contributing

The list of URLs is maintained at `urls.txt` and might need to be updated. File a PR if this breaks?

## Extra

A list of my other EBook generation projects: https://captnemo.in/ebooks/, includes a link to other related projects as well

## License

The little code in this repo is licensed under the [MIT License](https://nemo.mit-license.org/). See LICENSE file for details.
