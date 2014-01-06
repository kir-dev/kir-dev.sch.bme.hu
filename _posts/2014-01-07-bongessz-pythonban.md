---
layout: post
title: "Böngéssz Pythonban!"
author: kresshy
date: 2014-01-07 04:03:00
---

Ideje elmenni kicsit más irányba is a blog tartalmát illetően, mivel az utóbbi időben jóformán csak front-end téma volt. Mindig is foglalkoztattot az, hogy programozottan tudjam böngészni az világhálót, ne gondoljunk rögtön a teljes internetet bejáró robotra ezt a feladatot hagyjuk meg a Google-nek, valószínűleg elég mérnök dolgozik rajta. Mi csak egy darab oldalt szeretnénk lekérni, kiolvasni a tartalmát, megnézni a linkeket, letölteni róla egy-két dolgot, esetleg formokat submitolni. A segítségünkre lesz a Python mint scriptnyelv és két modulja; a mechanize, és a BeautifulSoup. Előbbivel egy böngészőt tudunk szimulálni, utóbbi pedig a html oldal feldolgozásában lesz segítségünkre. 

## mechanize

Programozott webböngészést tesz lehetővé és képes a böngésző állapotainak a megvalósítására is: navigációs előzmények, HTML form állapotok, cookiek stb. Andy Lester Pearlben írt WWW::Mechanize modulja után készítették ezt a modult, hogy Pythonban is tudjunk böngészni. 

### Lássuk azt a böngészőt!

Nagyon barátságosra készítették a modult, nincs más dolgunk mint importálni és meghívni a megfelelő függvényeket amelyek önmagukért beszélnek.

~~~python
import mechanize
import cookielib

br = mechanize.Browser()
cj = cookielib.LWPCookieJar()
br.set_cookiejar(cj)
~~~

Kész is a böngészőnk! Ez nem is volt nehéz és a következőkben ennél csak könnyebb lesz. Mielőtt tovább megyünk nézzük meg mi történik. Gyakorlatilag létrejön egy Browser objektumunk és a cookielib lesz a felelős a Browser által tárolt cookiek (sütik) kezeléséért. A Browser objektum olyan mint egy grafikus felület nélküli böngésző, megvannak a szükséges függvényei, amiket ha kivezetnénk egy felhasználói felületre akkor egy kész böngészőt kapnánk. Mielőtt még elmerülünk a programozott böngészés világában nézzük meg milyen beállítási lehetőségei vannak ennek a remek böngészőnek:

~~~python
# Browser beállítások
br.set_handle_equiv(True)
br.set_handle_gzip(True)
br.set_handle_redirect(True)
br.set_handle_referer(True)
br.set_handle_robots(False)

# Frissítések
br.set_handle_refresh(mechanize._http.HTTPRefreshProcessor(), max_time=1)

# Debug üzenetek
#br.set_debug_http(True)
#br.set_debug_redirects(True)
#br.set_debug_responses(True)

# User-Agent (egy kis csalás :])
br.addheaders = [('User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1')]
~~~

A legtöbb magától értetődő, de az utolsó érdekes. A User-Agent gyakorlatilag egy szoftver ami a felhasználó nevében tevékenykedik. A böngészőkben, az E-mail kliensekben mind megtalálható. Nagyon sok esetben a User-Agent kliensként viselkedik egy hálózati protokollban a kommunikáció során például a kliens-szerver architektúrában. 

A fentieket ismerve elkezdhetünk játszani a böngészőnkkel. Van egy open(url) metódusa amivel oldalakat tudsz megnnyitni majd a response() függvényéből kapjuk meg a választ.  Az open() után közvetlenül meghívva a response().read() függvényeket láthatjuk a betöltődött oldal forrását. A title() függvénnyel ki tudjuk írni az oldal címét, az info() függvénnyel a header tartalmát tudjuk megnézni és így tovább. Az oldalon található formokat a forms() függvénnyel tudjuk lekérni ami egy listát szolgáltat a formok neveivel. Nézzük meg mennyire egyszerű kiválasztani egy formot!

~~~python
# egy oldal letöltése
url = "http://kir-dev.sch.bme.hu"
response = br.open(url)
html = br.response().read()
print html

# Listázza a formokat
for f in br.forms():
    print f

# Kiválasztjuk az első formot
br.select_form(nr=0)

# A form egy mezőjébe beleírunk valamit majd submitoljuk
br.form['q']='random stuff'
br.submit()

# koilvassuk a kapott választ
print br.response().read()
~~~

Remek, de azért egy weboldal több dologból áll mint puszta formok tömkelegéből. Mindenre van megoldás, követni tudjuk a linkeket, le tudunk tölteni fájlokat, a lehetőségeknek csak a képzeleted szab határt. A letöltésnél vigyázzunk, mert sok helyen a direkt linkeknél ha nincs beállítva a cookie kezelése, akkor feldobhat captchat a cél oldal (ellenőrző mezők, hogy nem robot vagy-e, itt az a baj, hogy lényegében az vagy). Ezeket a linkeket nem a retrive() függvénnyel kell letölteni hanem ténylegesen rá is kell kattintani a click_link() függvénnyel. Ilyenkor ellenőrzésre kerül mondjuk a cookie tartalma, és máris hozzá tudunk férni a letöltendő fájlhoz. A függvényeket is lehetőségünk van ugyanúgy kilistázni akárcsak a formokat: for link in br.links(regex)!

~~~python
# Testing presence of link (if the link is not found you would have to
# handle a LinkNotFoundError exception)
br.find_link(text='kir-dev')

# Actually clicking the link
req = br.click_link(text='kir-dev')
br.open(req)
print br.response().read()
print br.geturl()

# Back
br.back()
print br.response().read()
print br.geturl()

# Download
f = br.retrieve('kir-dev.sch.bme.hu/eznemletezik.gif')[0]
print f
fh = open(f)
~~~

Arra is képes, hogy proxy-t állítsunk be a böngészőnek!

~~~python
# Proxy and user/password
br.set_proxies({"http": "joe:password@myproxy.example.com:3128"})

# Proxy
br.set_proxies({"http": "myproxy.example.com:3128"})
# Proxy password
br.add_proxy_password("joe", "password")
~~~

A mechanize egy nagyon hasznos eszköz tud lenni a megfelelő ember kezében, képes automatizáltan böngészni a weboldalt, magára az oldalra tekinthetünk egy nagy gráfként ahol az oldalak a csomópontok és az élek az oldalon található linkek. Innentől az egésznek a bejárása gyerekjáték a már tanult módszerekkel (hint: bfs, dfs, stb.).

## BeautifulSoup

Képes parsolni a html és xml fájlokat, beleírtve az aszimetrikus tageket is. A segítségével képesek vagyunk feldolgozni a html oldalt, keresni benne tageket (figyelembe véve az attribútumokat), a tagek tartalmát kiszedni, linkeket keresni stb. Érdemes együtt használni a mechanize modullal mert rendkívűl kényelmesen lehet együtt használni őket. Miután a mechanize-al megnyitottunk egy weboldalt a forrását át kell adjuk a BeautifulSoupnak:

~~~python
response = br.open(url)
html = br.response().read()
soup = BeautifulSoup.BeautifulSoup(html)
~~~

Innentől kereshetünk az oldalon bármilyen tagre:

~~~python
soup.findAll('td', attrs={"class": "prodSpecAtribute"})

# linkek megkeresése az oldalon
links = soup.findAll("a")

for link in links:
	print link.contents[0], link.get("href")
~~~

Összességében két nagyon jól elkészített modulról van szó, amely képes megkönnyíteni az életünket, ha már ilyen dolgokba kell belevágjunk. Magára a böngészésre a mechanize modult érdemes használni és az egyéb információk kinyerésére pedig a BeautifulSoupot. Böngésszetek programozottan mert az vicces!


