# security-engineering-3rd-edition-ebook ![](https://img.shields.io/badge/Status-Working-green)

*Update*: The website currently only has 7 sample chapters since the remaining were removed at the book's publication, so this downloads the remaining chapters via [The Internet Archive](https://web.archive.org/).

![third-edition-security-engineering-book-cover](https://www.cl.cam.ac.uk/~rja14/Papers/SEv3-coversmall.jpg)

This is just the script to generate a combined PDF from the draft chapters that were published for review. The script also takes care of putting in the right bookmarks for all the chapters in the generated PDF file using [pystitcher](https://pypi.org/project/pystitcher/).

Support the author and [buy the book](#support-the-authors).

## Chapters

See `book.md` for the bookmark titles used by the script.

## How to generate the book?

Run `./generate.sh`. You will need [`pystitcher`](https://pypi.org/project/pystitcher/), and `wget` installed. Alternatively, you can run it using Docker.

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

Buy the third edition of the book from:

### E-book

- [Amazon](https://www.amazon.com/Security-Engineering-Building-Dependable-Distributed-ebook/dp/B08P69FT4Q/rossandersshomep)
- [Wiley](https://www.wiley.com/en-us/Security+Engineering%3A+A+Guide+to+Building+Dependable+Distributed+Systems%2C+3rd+Edition-p-9781119642817)

### Paper

- [Wiley](https://www.wiley.com/en-us/Security+Engineering:+A+Guide+to+Building+Dependable+Distributed+Systems,+3rd+Edition-p-9781119642787)
- [Amazon US](https://www.amazon.com/Security-Engineering-Building-Dependable-Distributed-dp-1119642787/dp/1119642787/rossandersshomep)
- [Amazon UK](https://www.amazon.co.uk/Security-Engineering-Building-Dependable-Distributed-dp-1119642787/dp/1119642787/rossandersshomep)

### Course

A [course based on the book (taught to master students and 4th year undergrads at Edinburgh) is available on YouTube](https://www.youtube.com/playlist?list=PL88-McA5nKJN4mjTPAH6nR21K555WDdUF).

## Extra

A list of my other EBook generation projects: https://captnemo.in/ebooks/, includes a link to other related projects as well

## License

The little code in this repo is licensed under the [MIT License](https://nemo.mit-license.org/). See LICENSE file for details.
