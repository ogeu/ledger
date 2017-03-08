--
-- Clears everything.
--
drop schema ledger cascade;
create schema ledger;



--
-- Currencies
--
create table currencies
(
   id char( 3 ) primary key, -- ISO 4217 currency code
   scale smallint not null check ( scale >= 0 and scale <= 8 ) -- e.g., 2 for USD, 0 for JPY, 8 for BTC
);



create table accounts
(
   id char( 16 ) primary key,
   name text not null,
   currency char( 3 ) not null,
   sortKey smallint not null unique,
   foreign key ( currency ) references currencies( id ) on delete restrict on update cascade
);
