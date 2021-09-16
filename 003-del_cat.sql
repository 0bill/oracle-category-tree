create definer = root@`%` procedure del_cat(IN cat_id int)
begin
delete con, cc from categorytree con 
join categorytree ct on con.child_id = ct.child_id
join category cc on con.child_id = cc.id
where con.parent_id = cat_id;
end;

