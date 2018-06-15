pathtest = string.match(test, "(.*/)")

if pathtest then
   dofile(pathtest .. "common.lua")
else
   require("common")
end

function thread_init()
   set_vars()
end

function event()
   local table_name
   table_name = "sbtest".. sb_rand_uniform(1, oltp_tables_count)
   rs = db_query("SELECT sum(k), pad FROM ".. table_name .." group by pad order by 1")
end
