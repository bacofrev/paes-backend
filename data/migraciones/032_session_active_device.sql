begin;

alter table sessions add column active_device_id text;

commit;
