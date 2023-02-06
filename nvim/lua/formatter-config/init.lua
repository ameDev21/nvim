-- Utilities for creating configurations
local util = require "formatter.util"

local M = {}

local defaults = require "formatter.defaults"

M.uncrustify = util.withl(defaults.uncrustify, "CPP")

M.clangformat = util.copyf(defaults.clangformat)

M.astyle = util.withl(defaults.astyle, "c")

return M
