Kir-Dev blog
============

A [kir-dev.sch.bme.hu](http://kir-dev.sch.bme.hu) tartalma.

Telepítés
---------

Legyen telepítve ruby és jekyll a gépeden. A jekyll gemként telepíthető. Tehát
ha már van ruby-d:

    $ gem install jekyll

Ha az előkövetlemények megvannak, akkor

    $ git clone https://github.com/kir-dev/kir-dev.sch.bme.hu.git kirdev-blog
    $ cd kirdev-blog
    $ jekyll serve --watch

A böngésződben pedig a `localhost:4000`-en tudod megnézni a blogot.

Új bejegyzés létrehozása
------------------------

1. Válts át a `draft` branch-re.
2. A `_posts` mappába hozz létre egy új fájlt. A fájlnév formátuma a következő:

        2013-12-22-a-bejegyzes-cime.md

    A megfelelő részek értelemszerűen módosítandóak.

3. Pushold fel a githubra és kérj meg valakit, hogy nézze át a bejegyzést.
4. Javítsd a bejegyzést, ha szükséges.
5. Ismételd a 3-as és 4-es pontot, amíg szükséges.
6. Mergeld a bejegyzésed a masterbe: `git checkout master && git merge draft --no-ff`

Alternatívaként elkezdtük használni a [draft](https://draftin.com/) nevű
szolgáltatást. Itt is megírhatod a cikked, majd valaki átnézheti. Ezzel
átugorhatjuk majdnem a teljes előző folyamatot. Ha kész a cikk, rögtön mehet
`master`-be.

Új bejegyzés sablonja
---------------------

A _"front matter"_, vagyis a bejegyzéshez tartozó meta adatok a következők lehetnek:

* layout (kötelező): a bejegyzés sablon. Jelenleg egy van: `post`
* title (kötelező): a bajegyzés címe
* author (kötelező): a bejegyzés szerzője. Használd a [PÉKben](https://korok.sch.bme.hu/) is megtalálható
felhasználóneved, mert erre linkelünk a sablonból.
* date (opcionális): a bejegyzés dátuma. Célszerű megadni, mert különben a fájl
nevében megadott dátumot használja és az órát `00:00:00`-ra állítja.
* comment (opcionális): `true` érték esetén komment szekciót is renderel a bejegyzés oldalára
* category (opcionális): a bejegyzés kategóriája. A [#3](https://github.com/kir-dev/kir-dev.sch.bme.hu/issues/3)
issue szól erről, egyelőre ad-hoc jelleggel történik.

A teljes paraméter lista [itt megtalálható](http://jekyllrb.com/docs/frontmatter/).

### Bejegyzés sablon

~~~
---
layout: post
title:  "A bejegyzés címe"
author: tmichel
date:   2013-12-22 20:00:00
---

A bejegyzés tartalma markdownban.
~~~

### Kommentek a bejegyzés alatt

Ehhez a `comment: true` kapcsolót tegyük be a többi fejlécben található beállítás közé

~~~
---
layout: post
title:  "A bejegyzés címe"
author: tmichel
date:   2013-12-22 20:00:00
comment: true
---
~~~

License
-------

The following directories and their contents are Copyright Kir-Dev.
You may not reuse anything therein without Kir-Dev's permission:

* _posts/
* _drafts/
* img/

All other directories and files are MIT Licensed.