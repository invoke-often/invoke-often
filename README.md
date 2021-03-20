_Do what thou wilt shall be the whole of the Law._

---

An open-source, community reviewed collection of Aleister Crowley's instructions and rituals, transcribed from the Equinox and Book of Lies available on [Keep Silence](https://keepsilence.org/the-equinox/) as well as the 1929 edition of Magick, both on Keep Silence and [Archive.org](https://archive.org/details/b29825064).

Its official website is hosted here on [Github](https://invokeoften.github.io/book/)

The book may be purchased in B6 print-on-demand format on [Amazon](https://www.amazon.com/gp/product/1777528208),
or as appropriate to your location.

## Requirements

The project is typeset using [`XeLaTeX`](https://tug.org/xetex/)

[`Make`](https://www.gnu.org/software/make/) is used to define its build targets.

## Building

The book may be compiled into a screen-readable `.pdf` with

```
make onscreen
```

and for printing as its intended `B6` size with

```
make book
```

A version containing only works by Aleister Crowley, with no introduction, bibliography, or appendices of figures, may be made with:

```
make crowley
```
If you prefer an American quote style, before making your book run:

```
make american-quotes
```

and to revert, either use git or run:

```
make british-quotes
```

To clean:

```
make buildclean # delete all tex-build files
make pdf-clean # delete all pdf output
make clean # clean all build files and pdfs
```

Output files may be found in `out` by default.

## Guidelines for additions to the released book

- Where possible, rituals and tables should be on facing pages for easy reference. 
  - There is a `\begin{Facing} ... \end{Facing}` environment for this purpose.
  - The book made by `make book` should always have the following facing each other:
    - The Lesser Rituals of the Pentagram and Hexagram (Liber O)
    - Liber Resh
    - The Mass of the Phoenix
    - The Star Ruby
    - The Star Sapphire
    - Liber V Vel Reguli
    - The Hebrew letter charts
- All other chapters should start on the right-side. 
- Hebrew and Greek should be typeset as in the originals. Greek may be used directly; Hebrew is defined using `\cjRL{}` from the `cjhebrew` package.
- Packages may be added freely to the project, but should be commented with an explanation.

## Misc

### Editor's Rituals and Inclusions

To append alternatives to the Qabalistic Cross and Lesser Ritual of the Pentagram written by the editor, the Qliphothic Cross and the Lesser Ritual of the Averse Pentagram, along with Aleister Crowley's Hymn to Satan, to the printable book run:

```
make 
```

To do the same with the ebook:

```
make complete
```

and with Crowley's Class D writings with:

```
make rituals
```

---

_Love is the law, love under will._
