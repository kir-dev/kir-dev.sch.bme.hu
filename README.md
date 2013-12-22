Kir-Dev blog
============

A [kir-dev.sch.bme.hu](http://kir-dev.sch.bme.hu) tartalma.

Új bejegyzés létrehozása
------------------------

A `_posts` mappába hozzunk létre egy új fájlt. A fájlnév formátuma a következő:

    2013-12-22-a-bejegyzes-cime.md

A megfelelő részek értelmszerűen módosítandóak.

Új bejegyzés sablonja
---------------------

Két féle bejegyzést támogat a jelenlegi sablon.

1. egyszerű szöveges bejegyzés
2. link bejegyzés: főleg megosztáshoz. A fromátuma a következő:
link + idézet a linkelt odldalról + egy-két saját gondolat

A teljes paraméter lista [itt megtalálható](http://jekyllrb.com/docs/frontmatter/).

A blog lokálisan is legenerálható. Ehhez telepítsünk [jekyll](http://jekyllrb.com/)-t.

### Szöveges bejegyzés

~~~
---
layout: post
title:  "A bejegyzés címe"
author: tmichel
date:   2013-12-22 20:00:00
---

A bejegyzés tartalma markdownban.
~~~

### Link bejegyzés

~~~
---
layout: link
author: tmichel
title: "A bejegyzés címe"
date: 2013-12-22 17:08:53
link: http://example.com
link_text: "A linkelt szöveg címe" # ez opcionális, ha nincs megadva, akkor a bejegyzés címe lesz a link szövege
---

> Idézet a szövegből.

A bejegyzés tartalma.
~~~

License
-------

The following directories and their contents are Copyright Kir-Dev.
You may not reuse anything therein without Kir-Dev's permission:

* _posts/
* _drafts/
* img/

All other directories and files are MIT Licensed.