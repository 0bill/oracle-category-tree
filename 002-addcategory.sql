create definer = root@`%` procedure addcategory(IN name varchar(50), IN parent int unsigned, IN parentbyname varchar(50))
begin
declare cat_id int unsigned;


if parentbyname is not null then 

  select id into parent
 from category c
where c.name = parentbyname;
           
end if;

Insert INTO category (name) VALUES (name);
select LAST_INSERT_ID() into cat_id;
INSERT INTO categorytree(parent_id, child_id, depth) VALUES(cat_id,cat_id,0);

if parent is not null then
INSERT INTO categorytree(parent_id, child_id, depth) 
SELECT parent_id, cat_id, depth+1 from categorytree WHERE child_id = parent;
end if;

end;

