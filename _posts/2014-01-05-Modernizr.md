---
layout: post
title: "Modernizr"
author: kresshy
date: 2014-01-05 12:00:00
---

Pár napja olvashattatok a [HTML5 Boilerplate](http://kir-dev.sch.bme.hu/2014/01/03/a-html5-boilerplate/) cikkükben a [Modernizr](http://modernizr.com/) JavaScript library-ról. Megígértük, hogy írni fogunk róla és most meg is tettük. A Modernizr-t (nem nincs benne typo) arra használják, hogy detektálják a böngésződ képességeit HTML5 és CSS3 szinten. Nagyon jó dolog használni a böngészők új funkcionalitásait mindaddig amíg nem kell támogatni a régebbi verziókat. Ez a library segít neked ebben ugyanis az oldal betöltésekor gyorsan detektálja mire képes a böngésződ és a támogatott funkciókról információkat szolgáltat számodra amit felhasználhatsz a saját scriptjeidben.

## Hogyan használd?

Először is töltsd le a scriptet a fent található oldalról vagy [innen](http://modernizr.com/download/#-fontface-backgroundsize-borderimage-borderradius-boxshadow-flexbox-hsla-multiplebgs-opacity-rgba-textshadow-cssanimations-csscolumns-generatedcontent-cssgradients-cssreflections-csstransforms-csstransforms3d-csstransitions-applicationcache-canvas-canvastext-draganddrop-hashchange-history-audio-video-indexeddb-input-inputtypes-localstorage-postmessage-sessionstorage-websockets-websqldatabase-webworkers-geolocation-inlinesvg-smil-svg-svgclippaths-touch-webgl-shiv-cssclasses-addtest-prefixed-teststyles-testprop-testallprops-hasevent-prefixes-domprefixes-load). Az oldaladnak a `<head>` részében pedig töltsd be a letöltött scriptet.

	<script src="modernizr.min.js" type="text/javascript"></script>

A következő lépésben add hozzá a `no-js` class-t a `<html>` taghez.

	<html class="no-js">

Joggal kérdezhetitek, hogy miért adjuk hozzá ezt a class? Azért mert ez lesz az alapértelmezett állapota az oldalnak. Ha a Javascript (js) nincs engedélyeve a Modernizr egyáltalán nem fog működni (és más talán más funkciói sem az oldaladnak) ezért jó, hogy ha van egy fallback erre az esetre. Ha a JavaScript engedélyezve van akkor az oldal betöltése után ez a class le lesz cserélve dinamikusan a támogatott funkciókra. Vizsgáld meg az oldal forrását valahogy így kell kinézzen:

	<html class="js canvas canvastext geolocation rgba hsla no-multiplebgs borderimage borderradius boxshadow opacity no-cssanimations csscolumns no-cssgradients no-cssreflections csstransforms no-csstransforms3d no-csstransitions  video audio cufon-active fontface cufon-ready">

### Mit jelent ez a sok kifejezés?

Azok amelyek előtt nem található meg a `no` prefix lesznek a támogatott funkciók, amik előtt pedig megtalálható azok a böngésző által nem támogatott funkciók. A Modernizr által visszaadott információk alapján el tudjuk dönteni, hogy pl. a css színátmenetek támogatottak vagy sem: `no-cssfradients` - tehát jelen esetben nem támogatott ez a funkció. Itt egy példa a hivatalos dokumentációból egy olyan böngészőre amely támogatja vagy nem támogatja a hangfájlok lejátszását:

~~~css
/* In your CSS: */
.no-audio #music {
   display: none; /* Don't show Audio options */
}
.audio #music button {
   /* Style the Play and Pause buttons nicely */
}
~~~

~~~html
<!-- In your HTML: -->
<div id="music">
   <audio>
      <source src="audio.ogg" />
      <source src="audio.mp3" />
   </audio>
   <button id="play">Play</button>
   <button id="pause">Pause</button>
</div>
~~~

## HTML5

A Modernizr lehetővé teszi számodra, hogy az új HTML5 elemeket is használd: header, hgroup, footer, video stb. és stílusokat adj nekik. Ez nem azt jelenti, hogy hirtelen minden html5 specifikus elem elkezd működni az IE-ben, de tudsz hozzájuk stílusokat rendelni, az IE megérti ezeket, és nem fogja eldobni őket.

## JavaScript

JavaScript-ből is detektálhatod a különböző funkciókat elég egy egyszeri feltételt csinálnod és máris láthatod, hogy támogatott vagy nem az adott funkció:

	if (Modernizr.audio) {
	     /* properties for browsers that
	     support audio */
	}else{
	     /* properties for browsers that
	     does not support audio */
	}

A hivatalos dokumentáció megtalálhato [itt](http://www.tutorialspoint.com/html5/html5_modernizr.htm) ebben leírják az összes detektálható tulajdonságot amit CSS-ből tudtok használni vagy JavaScriptből tudtok ellenőrizni.


