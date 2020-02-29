# security-engineering-3rd-edition-ebook

![third-edition-security-engineering-book-cover](cover-thumb.jpg)

This is just the script to generate a combined PDF from the currently-online-chapters available for review.

The script also takes care of putting in the right bookmarks for all the chapters in the generated PDF file.

Go read the book from the source at <https://www.cl.cam.ac.uk/~rja14/book.html>

## Chapters

This list might be out of date, see the upstream source for actual list, and `urls.txt` for the one that the script uses.

-   Preface
-   Chapter 1: What is Security Engineering? (August 30)
-   Chapter 2: Who is the Opponent? (May 17)
-   Chapter 3: Psychology and Usability (May 31)
-   Chapter 4: Protocols (June 6)
-   Chapter 5: Cryptography (July 26)
-   Chapter 6: Access Control (August 29)
-   Chapter 7: Distributed Systems (July 26)
-   Chapter 8: Economics (June 29)
-   Chapter 9: Multilevel Security (September 16)
-   Chapter 10: Boundaries (October 4)
-   Chapter 11: Inference Control (January 7)
-   Chapter 12: Banking and Bookkeeping (February 2)
-   Chapter 13: Physical Protection (October 12)
-   Chapter 14: Monitoring and Metering (December 18)
-   Chapter 15: Nuclear Command and Control (August 29)
-   Chapter 16: Security Printing and Seals (November 13)
-   Chapter 17: Biometrics (December 18)
-   Chapter 18: Physical Tamper Resistance (November 13)
-   Chapter 19: Side Channels (December 6)
-   Chapter 20: Advanced Cryptographic Engineering (February 28)
-   Chapter 26: Surveillance or Privacy? (May 17)
-   Bibliography

## How to generate the book?

Run `./generate.sh`. You will need `pdftk`, and `wget` installed.

Once the script finishes running, check the `security-engineering-3rd-edition.pdf` file.

### More Options?

You can run with the following 2 options:

`--generate-metadata`

To generate the meta.txt file which contains the list of bookmarks to be inserted. This is required if you make changes to the file lists.
This also requires `qpdf` to be installed.

`--download-cover-image`

Download the cover image. The repo already has a `cover.pdf` file which is used by default. This option will download the cover image and convert
it to `pdf` yet again. Do this if the cover URL changes. Requires `imagemagick` to be installed.

## Support the Authors

Buy the second editions from:

-   [Amazon.com](http://www.amazon.com/exec/obidos/ASIN/0470068523/rossandersshomep)
-   [Wiley](http://he-cda.wiley.com/WileyCDA/HigherEdTitle/productCd-0470068523.html)
-   [Amazon.co.uk](http://www.amazon.co.uk/exec/obidos/ASIN/0470068523/rossandersshomep)
-   [Kindle Version](http://www.amazon.co.uk/gp/product/B004BDOZI0/ref=as_li_tf_tl?ie=UTF8&tag=rossanderssho-21&linkCode=as2&camp=1634&creative=6738&creativeASIN=B004BDOZI0)

A combined official signed PDF of the first edition is available at <http://www.cl.cam.ac.uk/~rja14/musicfiles/manuscripts/SEv1.pdf>

## Contributing

The list of URLs is maintained at `urls.txt` and might need to be updated. File a PR if this breaks?

## License

The little code in this repo is under MIT.
