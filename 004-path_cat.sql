create definer = root@`%` function path_cat(cat_id int) returns varchar(255)
begin

select group_concat(c.name order by ct.depth desc separator '/') into @var from category c join categorytree ct on c.id = ct.parent_id where ct.child_id = cat_id ;
return @var;
end;

