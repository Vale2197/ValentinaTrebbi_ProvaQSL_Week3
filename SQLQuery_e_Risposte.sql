--COPIARE SCRIPT DA QUELLO AUTOGENERATO 
--(qualche riga di insert qui, era stata commentata e rimossa per sbaglio, ma è presente nell'altro script)


--Valentina
--Trebbi
--18/03/2022


--1) risposta: B

--2) risposta:

--si traduce con la creazione di una terza tabella, che riporta (sotto forma di chiavi esterne) 
--le chiavi primarie delle 2 tabelle,
--con l'aggiunta, se necessario, di altri campi in comune tra le due tabelle

--3) risposta: B

--4) risposta: B

--5) risposta: no


--ESERCITAZIONE QUERY

--create database NegozioDischi

--create table Band (
--Id int primary key identity(1,1),
--Nome varchar(100),
--NumeroComponenti int
--)

--create table Brano (
--Id int primary key identity(1,1),
--Titolo varchar(100),
--DurataInSecondi int
--)

--create table Album (
--Id int primary key identity(1,1),
--Titolo varchar(100),
--AnnoUscita date,
--CasaDiscografica varchar(100),
--Genere varchar(100) check (genere = 'Classico' or genere = 'Jazz' or Genere = 'Pop' or Genere = 'Rock' or Genere = 'Metal'),
--Distribuzione varchar(100) check (Distribuzione = 'CD' or Distribuzione = 'Vinile' or Distribuzione = 'Streaming'),
--IdBand int foreign key references Band(id),

--constraint PK_AllField unique (titolo, annoUscita, CasaDiscografica, Genere, Distribuzione)
--)

--create table Album_Brano (
--IdRaccolta int primary key identity(1,1),
--IdAlbum int foreign key references Album(Id),
--IdBrano int foreign key references Brano(Id)
--)

--inserimento dati

--insert into Band 
--values('Merlinos', 4)
--('Maneskin', 5),
--('The Giornalisti', 2),
--('Band nuova', 6),
--('Le Cartelle', 3)

--insert into Album
--values('album the giornalisti 2', '2011-03-04', 'casa234', 'metal', 'cd', 3)
--values('Maneskin Before', '2000-03-04', 'sony music', 'rock', 'cd', 2),
--('Maneskin album recente', '2020-05-04', 'sony music', 'rock', 'cd', 2),
--('i the giorn best', '1900-03-04', 'sony music', 'Classico', 'cd', 3),
--('gli 88Bravi', '2021-03-04', 'sony music', 'pop', 'vinile', 1),
--('Le Cartelle primo', '2022-03-04', 'Casasconosciuta', 'pop', 'cd', 5)

--insert into Brano 
--values('gli 88Lunghi', 190),
--('Marlena torna a casa', 150),
--('ci sono acnh''io', 181),
--('sei fantastica', 140),
--('Mammamia', 190),
--('Imagine', 190),
--('Brano Le cartelle', 150),
--('nessuno è niente', 170),
--('filosofia', 120),
--('le ballerine', 150)

--insert into Album_Brano
--values(7, 10)
--(3, 6),
--(1, 2),
--(2, 5),
--(4, 1),
--(4, 3),
--(4, 4),
--(5, 7),
--(1, 6),
--(2, 6),
--(5, 6),
--(5, 8)


--query esercizi:
--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;
--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;
--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti ad album pubblicati prima del 2019;
--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;
--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;
--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani
--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i secondi quindi 180 s).
--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.
--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980,
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020,
--‘Old’ altrimenti.
--10) Mostrare i brani non contenuti in nessun album.

select * from Band
select * from Brano
select * from Album
select * from Album_Brano

--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;
select a.Titolo
from Album a join Band b on a.IdBand = b.ID
where b.ID = 1
order by a.Titolo

--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;
select *
from Album
where CasaDiscografica = 'sony music' and DATEPART(YEAR, AnnoUscita) = 2020

--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti ad album pubblicati prima del 2019;
select b.Titolo
from Brano b join Album_Brano al_b on b.Id = al_b.IdBrano
join Album al on al.Id = al_b.IdAlbum 
join Band on al.IdBand = Band.ID
where band.Nome = 'maneskin' and DATEPART(YEAR, al.AnnoUscita) < 2019

--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;
select al.*
from Album al join Album_Brano al_b on al.Id = al_b.IdAlbum
join Brano on al_b.IdBrano = Brano.Id
where Brano.Titolo = 'imagine'

--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;
select band.Nome as 'nome band', count(Brano.id) as 'totale brani'
from Brano join Album_Brano on brano.Id = Album_Brano.IdBrano
join album on Album_Brano.IdAlbum = album.Id
join Band on Album.IdBand = Band.ID
where band.Nome = 'the giornalisti'
group by Band.Nome

--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani
select album.Titolo, sum(brano.DurataInSecondi) as 'somma totale della durata dei brani'
from Brano join Album_Brano on brano.Id = Album_Brano.IdBrano
join album on Album_Brano.IdAlbum = album.Id
join Band on Album.IdBand = Band.ID
group by album.Titolo

--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i secondi quindi 180 s).
select Brano.Titolo as 'brani che durano più di 3 min'
from Brano join Album_Brano on brano.Id = Album_Brano.IdBrano
join album on Album_Brano.IdAlbum = album.Id
join Band on Album.IdBand = Band.ID
where Brano.DurataInSecondi > 180 and band.Nome = '883'

--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.
select *
from Band
where band.Nome like 'M%n'

--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980,
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020,
--‘Old’ altrimenti.

select Titolo, 
case
	when DATEPART(YEAR, Album.AnnoUscita) < 1980 then 'Very Old'
	when DATEPART(YEAR, Album.AnnoUscita) = 2021 then 'New Entry'
	when DATEPART(YEAR, Album.AnnoUscita) between 2010 and 2020 then 'Recent'
	else 'old'
end as 'etichetta'
from Album

--10) Mostrare i brani non contenuti in nessun album.
select brano.*
from Brano left join Album_Brano on Brano.Id = Album_Brano.IdBrano
where Album_Brano.IdBrano is null