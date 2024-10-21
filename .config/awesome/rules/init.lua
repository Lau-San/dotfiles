local awful         = require('awful')

local default_rules = require('rules.default')
local no_borders    = require('rules.no_borders')
local no_titlebars  = require('rules.no_titlebars')
local floating      = require('rules.floating')
local maximized     = require('rules.maximized')
local tags          = require('rules.tags')

local rules = {
    default_rules,
    no_borders,
    no_titlebars,
    floating,
    maximized,
    table.unpack(tags)
}

awful.rules.rules = rules
return rules
