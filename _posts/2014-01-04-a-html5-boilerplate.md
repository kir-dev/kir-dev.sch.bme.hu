---
layout: post
title: "A HTML5 Boilerplate"
author: kresshy
date: 2014-01-03 22:00:00
---

A HTML5 Boilerplate egy front-end template amit arra találtak ki, hogy gyors, robusztus és 
alkalmazkodó weboldalakat tudj készíteni az új HTML5 funkcionalitásokkal. Ez egy open source projekt amit Paul Irish és Divya Manian készített és tökéletes arra, hogy cross-browser weboldalakat készíts amik működnek a régi böngészőkben is. A projekt letölthető a [HTML5 Boilerplate](http://html5boilerplate.com/) weboldaláról teljes csomagként vagy pedig egy kissebb válozatban amely nem tartalmazza a dokumentációt. Az utóbbi csak azonkan ajánlott akik már dolgoztak vele korábban.

## Mi található a csomagban?

Megtalálható minden olyan elem amelyre szükséged lehet a fejlesztés során beleértve a
dokumentációkat is az egyes részekhez.

+HTML
+CSS
+JavaScript
+.htaccess (Apache web szerver konfiguráció)
+Crossdomain.xml
+Egyéb (gitignore és hasonló fájlok)

A [Modernizr](http://modernizr.com/) (erről is fogunk majd írni) is megtalálható a csomagban ami arra szolgál, hogy detektálni tudd a böngészők által támogatott HTML5 és CSS3 funkciókat és segít abban is, hogy
az oldal designja is megfelelően működjön ezek alapján.

## Hogyan kezd el használni?

Általában egy weboldal készítése mindig azzal kezdődik, hogy létrehozod az alap struktúrát, 
feltöltöd tartalommal, stílust és funkcionalitásokat hozol létre majd pedig nekiállsz tesztelni.
Itt kapsz készen egy ilyen struktúrát amit majd elkezdhetsz használni. Nézzük meg kicsit közelebbről:

>.
>├── css
>│   ├── main.css
>│   └── normalize.css
>├── doc
>├── img
>├── js
>│   ├── main.js
>│   ├── plugins.js
>│   └── vendor
>│       ├── jquery.min.js
>│       └── modernizr.min.js
>├── .htaccess
>├── 404.html
>├── index.html
>├── humans.txt
>├── robots.txt
>├── crossdomain.xml
>├── favicon.ico
>.
>.
>.


A CSS könyvtárban fogjuk tárolni az összes *.css fájlját az oldalnak, láthatjuk azonban, hogy már eleve tartalmaz néhány fájlt ezek a normalize.css és a main.css. Ezek magába foglalják azokat a dolgokat amelyek a HTML5 Boilerplateben alapértelmezett stílusok, általános segítő osztályok media query placeholderek és print stílusok. 

## Segítő osztályok

Nézzük az .ir css osztályt (image replacement). Ezt az összes olyan elemnek hozzáadhatot a stílusához melyeket képekkel akarsz helyettesíteni. Szükséges megadni a szélességet és a magasságát ennek az elemnek azért, hogy a kép látszódjon.

<code>
.ir {
	background-image: url(http://yoursite.com/images/logo.jpg);
	background-size: 100% auto;
	width:450px;
	height:450px
}
</code>

A következő css osztályokat foglalja még magában a template:

+.hidden (add hozzá azokhoz az elemekhez amelyeket el akarsz rejteni) 
+.visuallyhidden (elrejti a szöveget a böngészőben de a képernyő olvasók még látják)
+.invisible (úgy rejti el az elemet, hogy közben nem befolyásolja az oldal felépítését)
+.clearfix (biztosítja, hogy a floatolt gyereket az adott elem tartalmazza)

## Media Query-k

A HTML5 Boileplateben megtalálhatóak azok a placeholderek amelyek ahhoz kellenek, hogy különböző méretű képernyőket támogassunk. A dokumentáció azt mondja, hogy érdemes úgy csinálni, hogy az oldalad tartalmához igazodjanak ezek a media query-k.

A "mobile first" megközelítés nagyon fontos manapság ugyanakkor nem mindenki akarja támogatni a különböző eszközöket ilyenkor csak egyszerűen vedd ki a placeholdert a css-ből.

## Egyéb könyvtárak

Sok egyéb könyvtárat találunk a fájljaink rendszerezéséhez és tárolásához, a JS könyvtárban találhatunk egy kis bevezető kódot hogy segítsen az elindulásban. A .htacces fájl pedig az Apache szerver konfigurációt tartalmazza és segítséget nyújt hozzá. Található még egy egyszerű 404 weboldal amit személyre szabhatsz és kötelezően megtalálható az index.html fájl ami egy csupasz váz az oldalad elkezdéséhez.

Gyakorlatilag a HTML5 Boilerplate egy remek eszköz arra, hogy bármilyen új projektet elkezdj. Rengeteg böngésző létezik és tökéletes támogatást és vázat nyújt ahhoz, hogy weboldalakat hozz létre mobilra, tabletre és desktopra.






