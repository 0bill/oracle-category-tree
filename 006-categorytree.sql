create table categorytree
(
	parent_id int not null,
	child_id int not null,
	depth int null,
	constraint categorytree_ibfk_1
		foreign key (parent_id) references category (id)
			on delete cascade,
	constraint categorytree_ibfk_2
		foreign key (child_id) references category (id)
			on delete cascade
);

create index child_id
	on categorytree (child_id);

create index parent_id
	on categorytree (parent_id);

