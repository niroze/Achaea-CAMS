
-- 
-- Triggers map
--
drop table if exists triggers;
create table triggers (
       trig_name           varchar(40) unique not null,
       trig_group          varchar(40),
       trig_is_enabled     boolean default 1,
       trig_glob           varchar(255) not null,
       trig_action         varchar(255) not null,
       trig_times          int default 0,
       trig_priority       int default 100,
       trig_from           varchar(40)
);
create index triggers_trig_name_idx on triggers (trig_name);
create index triggers_trig_group_idx on triggers (trig_group);
create index triggers_trig_from_idx on triggers (trig_from);



--
-- Settings used globally
--
drop table if exists settings;
create table settings (
       setting_name        varchar(40) unique not null,
       setting_value       varchar(255) unique not null,
       created_ts          timestamp not null,
       modified_ts         timestamp
);
create index settings_setting_name_idx on settings (setting_name);



-- 
-- Settings for use by Plugins
--
drop table if exists settings_plugins
create table settings_plugins (
       plugin_name         varchar(40) unique not null,
       setting_name        varchar(40) unique not null,
       setting_value       varchar(255) unique not null,
       created_ts          timestamp not null,
       modified_ts         timestamp,
       primary key (plugin_name, setting_name)
);
create index setting_plugins_plugin_name_idx on settings_plugins (plugin_name);
create index setting_plugins_setting_name_idx on settings_plugins (setting_name);