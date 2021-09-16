create definer = admin@`%` procedure addTASK(IN name varchar(200), IN parent int unsigned, IN parentbyname varchar(200))
begin
declare cat_id int unsigned;


if parentbyname is not null then

  select id into parent
 from aaaPLAN.TASK c
where c.name = parentbyname;

end if;

Insert INTO aaaPLAN.TASK (name) VALUES (name);
select LAST_INSERT_ID() into cat_id;
INSERT INTO aaaPLAN.TASKTREE(parent_id, child_id, depth) VALUES(cat_id,cat_id,0);

if parent is not null then
INSERT INTO aaaPLAN.TASKTREE(parent_id, child_id, depth)
SELECT parent_id, cat_id, depth+1 from aaaPLAN.TASKTREE WHERE child_id = parent;
end if;

end;

