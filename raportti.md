# Palvelinten hallinta h3

Tehtävät tehtiin usb-tikulta bootatulta xubuntu 18.04 LTS käyttöjärjestelmältä. 
Koneena toimi Lenovo X1 Carbon. Harjoitus aloitettiin tuttuun tapaan komennoilla setxkbmap fi ja sudo apt-get update.

# b) MarkDown. Tee tämän tehtävän raportti MarkDownina.

Tein tiedoston nimeltä raportti.md salt kansioon ja aloin raportoimaan siihen. Lopuksi kuitenkin kopioin raportin wordpressiin, sillä muutkiin harjoitukset ovat siellä.

#c) Laita /srv/salt/ gittiin. Tee uusi moduli.

Alointin tehtävän luomalla uuden github repositoryn nimeltä salt. Itse olin jo tuon tehnyt, mutta kuvassa asetukset uuteen repositoryyn.
Jatkoin asentamalla gitin komennolla sudo apt -y install git
Tämän jälkeen menin /srv hakemistoon ja cloonasin sinne tuon salt repon komennolla sudo git clone https://github.com/lapamato4/salt.git. Nyt se kloonasi tuon salt kansion /srv hakemistoon.
Nyt voin luoda uuden moduulin tänne. Päätin luoda apachen automaation.
Aloitin tekemällä apache kansion salttiin komennolla sudo mkdir apache. Tänne luodaan uusi tiedosto komennolla sudoedit default-index.html. Tämä sen takia että voidaan taas muuttaa kotisivun sisältöä. Tuohon tiedostoon taas pari riviä tekstiä. Sitten tein apache kansioon init.sls tiedoston, johon tulee seuraavat rivit:
Nyt moduuli on valmis, enää täytyy kokeilla toimiiko se. Ajetaan komennolla sudo salt '*' state.apply apache. Näyttäisi toimivan.
Nyt voin päivittää tuon git-varaston. Se tapahtuu komennoilla sudo git add ., sudo git commit ., sudo git pull ja sudo git push. Sudo git commitin jälkeen avautuu tiedosto, johon voidaan kirjoittaa mitä varastoon ollaan päivitetty.
sudo git push komennon jälkeen git kysyy vielä käyttäjätunnusta ja salasanaa, jotta tiedostot saadaan päivitettyä varastoon.
Nyt uudet tiedostot näkyvät myös githubissa:
Nyt voin siis poistaa tuon salt kansion kokonaan ja palauttaa sen vain cloonaamalla tuon git repon. Postetaan salt kansio komennolla sudo rm -r salt. Kansio poistui. Nyt palautetaan se cloonaamalla. Sudo git clone https://github.com/lapamato4/salt.git. Nyt voin ajaa tuon apache moduulin suoraan saltilla ja se toimii samalla tavalla kuin äsken.

#d) Näytä omalla salt-varastollasi esimerkit komennoista ‘git log’, ‘git diff’ ja ‘git blame’. Selitä tulokset.

Git log komennolla saadaan tietoa gittiin tehdyistä muutoksista. ELi esimerkiksi mitä sinne on viimeksi lisätty tai muokattu ja milloin. Kuvassa näkyy oman salt kansioni log. Nyt siinä näkyy esimerkiksi tuo äsken luotu apache-moduuli.

Git diff komennolla voidaan tarkastella tiedostoon tehtyjä muutoksia. Tässä tapauksessa muokkasin helloroope.txt tiedostoon tekstiä ja sen jälkeen ajoin tuon git diff komennon. Se näyttää seuraavia tietoja:
Se kertoo siis esimerkiksi mitä uutta tiedostoon on lisätty ja mille riville.

Git blame komentoa voidaan käyttää kun halutaan tietää kuka on muokannut tiedostoa viimeksi tai jotenkin sen tiettyä kohtaa. Se kertoo kuka käyttäjä tiedostoa on muokannut, milloin ja mitä riviä.

#e) Tee tyhmä muutos gittiin, älä tee commit:tia. Tuhoa huonot muutokset ‘git reset –hard’.

Tässä peruutin tuon äsken tekemäni muutoksen tuohon helloroope.txt tiedostoon. Ajoin ensin sudo git add . komennon, jotta muutos menisi gittiin. Sitten tein tuon git reset --hard, jolloin git palauttaa tilan, joka oli ennen kuin muutos tehtiin. Tilan palautus onnistui ja nyt tuossa helloroope.txt tiedostossa lukee taas vain Hello world!

#f) Tee uusi salt-moduli.

Lopuksi tein vielä tilan, joka asentaa ssh ja vaihtaa sen oletusportin. Loin salt kansioon tiedostot sshd.sls ja sshd_config. sshd.sls tiedostoon tuli seuraavat rivit:
ja sshd_config seuraavat rivit:
Nyt ajoin tilan komennolla sudo salt '*' state.apply sshd. Tila toimi.
Lopuksi päivitin myös tämän uuden tilan git-varastoon, joten se on nopeasti saatavilla.


Lähteet:

https://www.atlassian.com/git/tutorials/inspecting-a-repository/git-blame

https://www.atlassian.com/git/tutorials/saving-changes/git-diff

http://terokarvinen.com/2018/aikataulu-%e2%80%93-palvelinten-hallinta-ict4tn022-3004-ti-ja-3002-to-%e2%80%93-loppukevat-2018-5p
