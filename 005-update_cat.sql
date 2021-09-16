create definer = root@`%` procedure update_cat(IN new_cat int, IN current_cat int)
begin

delete from categorytree 
where child_id in (select del.child_id from (select kid_all.child_id, kid_all.parent_id, kid_all.depth from (select parent_id as up from categorytree where child_id = current_cat and depth > 0) under_parent
join (select kids.child_id, kid_con.parent_id, kid_con.depth from (select child_id from categorytree where parent_id = current_cat and depth > 0) as kids
 join categorytree as kid_con on kids.child_id = kid_con.child_id ) as kid_all on under_parent.up = kid_all.parent_id
union all
select child_id, parent_id, depth from categorytree where child_id = current_cat and depth > 0 ) as del)
and parent_id in (select del.parent_id  from (select kid_all.child_id, kid_all.parent_id, kid_all.depth from (select parent_id as up from categorytree where child_id = current_cat and depth > 0) under_parent
join (select kids.child_id, kid_con.parent_id, kid_con.depth from (select child_id from categorytree where parent_id = current_cat and depth > 0) as kids
 join categorytree as kid_con on kids.child_id = kid_con.child_id ) as kid_all on under_parent.up = kid_all.parent_id
union all
select child_id, parent_id, depth from categorytree where child_id = current_cat and depth > 0 ) as del);


INSERT INTO categorytree(parent_id, child_id, depth)
select x.parent_id, y.child_id, x.depth+y.depth+1 from (select * from categorytree where child_id = new_cat) x
join (select * from categorytree where parent_id = current_cat) y;

end;

