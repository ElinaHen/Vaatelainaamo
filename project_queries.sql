-- vaatteen omistajan tiedot
select omistajaID, concat(etunimi, ' ', sukunimi) as ' Vaatteen omistaja'  from omistaja;

-- mitä eri vaatteita on saatavilla koossa s tai 36
select hinta, vaatelaji, koko from tuote
	where koko = 's' or koko ='36';    

-- kaikki lainat ennen vuotta 2020
select lainaid, tuoteid, lainaPVM from lainattu
	where lainaPVM < '2020-01-01';
    
-- montako lainatapahtumaa ollut vuonna 2020, aggreagate/count
select count(lainaID) from lainattu
	where lainaPVM between '2020-01-01' and '2020-12-31';

-- lainattavissa olevien tuotteiden hinnan keskiarvo, aggregate round / avg
select round(avg(hinta),2) as 'Lainattavissa olevien tuotteiden hinnan keskiarvo'
	from tuote;

-- etsi alle satasen mekot, and
select tuoteID, valmistajaID, vaatelaji, hinta from tuote
	where hinta <= '100' AND vaatelaji = 'mekko';

-- kauanko tuote ollut lainassa asiakkaalla, left join
select tuote.vaatelaji, lainattu.lainaPVM, lainattu.palautusPVM, (lainattu.palautusPVM-lainattu.lainaPVM) as "laina-aika/pvää"
	from lainattu left join tuote on tuote.tuoteID = lainattu.tuoteID
    order by lainaPVM;

-- montako tuotteita asiakkas on lainannut, right join / group by / aggregate
select asiakas.etunimi, asiakas.sukunimi, count(lainattu.tuoteID) as " lainattujen tuotteiden määrä"
from asiakas right join lainattu on asiakas.asiakasID = lainattu.asiakasID
group by asiakas.asiakasID;

-- inner join, kerro valmistaja, mikä vaate, koko ja hinta, aakkosjärjestyksessä
select valmistaja.nimi, tuote.vaatelaji, tuote.koko, tuote.hinta
	from valmistaja inner join tuote on valmistaja.valmistajaID = tuote.valmistajaID
    order by valmistaja.nimi;	

-- asiakkaan lainat, left join ja inner join
select concat(asiakas.etunimi,' ', asiakas.sukunimi) as 'Asiakkaan nimi', tuote.vaatelaji, lainattu.lainaPVM, lainattu.palautusPVM
from asiakas left join lainattu on asiakas.asiakasid = lainattu.asiakasID
	inner join tuote on tuote.tuoteid = lainattu.tuoteid    
    order by asiakas.asiakasID;
    
-- omistajat kenellä enemmän kuin 2 vaatetta lainattavissa, having
select omistaja.omistajaid, omistaja.etunimi, omistaja.sukunimi, count(tuoteid) as 'Lainattavaa vaatetta'
	from omistaja right join tuote on tuote.omistajaID = omistaja.omistajaID
    group by omistaja.sukunimi
    having count(tuoteID) > 2;
