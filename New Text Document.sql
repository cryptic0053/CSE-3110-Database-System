 create table Country(
  2  Country_Name varchar2(10),
  3  Ranking number(3),
  4  Wc_Won number(1),
  5  primary key(Country_Name));

create table Player(
  2  Player_Name varchar(10),
  3  Country_Name varchar(10),
  4  Jersey_No number(2),
  5  Club_Name varchar2(15),
  6  Position varchar(3),
  7  primary key(Player_Name),
  8  foreign key (Country_Name) references Country(Country_Name)
  9  );

 insert into Country(Country_Name,Ranking,Wc_won)values('Brazil',5,5);
 insert into Country(Country_Name,Ranking,Wc_won)values('Argentina',1,3);
 insert into Country(Country_Name,Ranking,Wc_won)values('Germany',16,4);
 insert into Country(Country_Name,Ranking,Wc_won)values('France',2,4);


insert into Player(Player_Name,Country_Name,Jersey_No,Club_Name,Position)values('Messi','Argentina',10,'Inter-Miami','LW');
insert into Player(Player_Name,Country_Name,Jersey_No,Club_Name,Position)values('Neymar','Brazil',10,'Al-Hilal','LW');
 insert into Player(Player_Name,Country_Name,Jersey_No,Club_Name,Position)values('Mbappe','France',10,'PSG','ST');

select * from Country natural join Player;
select * from Country left outer join Player using(Country_Name);
select * from Country right outer join Player using(Country_Name);
select * from Country full outer join Player using(Country_Name);

select * from Country where Wc_won>2 and Ranking<10;
select * from Country where Wc_won>3 or Ranking<5;
select * from Country where not Wc_won>2 and Ranking<10;

SQL> select * from Country where Wc_won>some(Select Wc_won from
Country where Wc_won>2);
SQL> select * from Country where Wc_won>all(Select Wc_won from
Country where Wc_won>2);