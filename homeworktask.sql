create table if not exists artist(
	id serial primary key,
	name varchar(100) not null unique
);

create table if not exists collection(
	id serial primary key,
	name varchar(100) not null unique,
	release integer check(release <= 2021)
);

create table if not exists style(
	id serial primary key,
	name varchar(100) not null unique	
);

create table albom(
	id serial primary key,
	name varchar(100) not null,
	release integer check(release <= 2021)
);

create table trek(
	id serial primary key,
	name varchar(100) not null,
	duration integer not null check(duration >= 0),	
	albom_id integer references albom(id)
);

create table trekcollection(
	id serial primary key,
	trek_id integer not null references trek(id),
	collection_id integer not null references collection(id)
);


create table artiststyle(
	id serial primary key,
	artist_id integer not null references artist(id),
	style_id integer not null references style(id)
);

create table if not exists artistalbom(
	id serial primary key,
	artist_id integer not null references artist(id),
	albom_id integer not null references albom(id)
	
);	