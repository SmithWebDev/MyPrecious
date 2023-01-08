local wezterm = require 'wezterm'
--local tab, pane, window = wezterm.mux.spawn_window {}

-- Show which key table is active in the status area
---@diagnostic disable-next-line: unused-local
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = 'TABLE: ' .. name
  end
  window:set_right_status(name or '')
end)

local mykeys = {}
for i = 1, 9 do
  table.insert(mykeys, {
    key = tostring(i),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i-1),
  })
end

return {
  adjust_window_size_when_changing_font_size = false,
  -- color_scheme = "Dark Ocean (terminal.sexy)",
  color_scheme = 'Dark Violet (base16)',
  -- color_scheme = 'tokyonight',
  font = wezterm.font({
    family = 'Fira Code iScript',
    harfbuzz_features = {
      "cv02",
      "cv24",
      'cv26',
      'cv27',
      'cv30',
      'ss03',
      'ss05',
      'ss07',
      'ss09',
    },
  }),
  -- font = wezterm.font {
  --   family = 'FiraCode Nerd Font',
  --   harfbuzz_features = {
  --     'cv02',
  --     'cv24',
  --   }
  -- },
  font_rules = {
    {
      italic = true,
      intensity = 'Normal',
      font = wezterm.font {
        family = 'Fira Code iScript',
        style = 'Italic',
      }
    }
  },
  font_size = 20.0,

  leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1500 },
  keys = {
    { key = 'n',  mods = 'ALT',    action = wezterm.action.ToggleFullScreen },
    -- TAB CONTROLS (CLOSE)
    -- initiate Tab movement
    { key = 't',  mods = 'LEADER', action = wezterm.action.ActivateKeyTable { name = 'tab_movement',   one_shot = false },              },

    -- jump to tab
    { key = '1', mods = 'LEADER', action = wezterm.action{ActivateTab=0} },
    { key = '2', mods = 'LEADER', action = wezterm.action{ActivateTab=1} },
    { key = '3', mods = 'LEADER', action = wezterm.action{ActivateTab=2} },
    { key = '4', mods = 'LEADER', action = wezterm.action{ActivateTab=3} },
    { key = '5', mods = 'LEADER', action = wezterm.action{ActivateTab=4} },
    { key = '6', mods = 'LEADER', action = wezterm.action{ActivateTab=5} },
    { key = '7', mods = 'LEADER', action = wezterm.action{ActivateTab=6} },
    { key = '8', mods = 'LEADER', action = wezterm.action{ActivateTab=7} },
    { key = '9', mods = 'LEADER', action = wezterm.action{ActivateTab=8} },
    -- close tabs
    { key = 'x',  mods = 'LEADER', action = wezterm.action.CloseCurrentTab  { confirm = true } },

    -- PANE CONTROLS (MAXIMIZE, NAVIGATION, RESIZE, SELECT, SPLIT, CLOSE)

    -- active pane
    --{ key = 'w',  mods = 'LEADER', action = wezterm.action.ActivateKeyTable { name = 'activate_pane', timeout_milliseconds = 1500 } },

    -- initiate panes resize
    { key = 'r',  mods = 'LEADER', action = wezterm.action.ActivateKeyTable { name = 'resize_pane',   one_shot = false },              },

    -- navigate panes
    { key = 'h',  mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'j',  mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = 'k',  mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'l',  mods = 'ALT',    action = wezterm.action.ActivatePaneDirection 'Right' },

    -- select pane
    { key = 'w', mods = 'LEADER', action = wezterm.action.PaneSelect { mode = 'SwapWithActive' } },
    { key = 'w', mods = 'ALT', action = wezterm.action.PaneSelect },

    -- split panes
    -- { key = '\\', mods = 'LEADER', action = wezterm.action.SplitPane { direction = 'Right',   size = { Percent = 50 } } },
    -- { key = '-',  mods = 'LEADER', action = wezterm.action.SplitPane { direction = 'Down',    size = { Percent = 50 } } },
    { key = '\\', mods = 'LEADER', action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain'}, },
    { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical {domain = 'CurrentPaneDomain'}, },

    -- toggle maximize pane
    { key = 'm', mods = 'ALT', action = wezterm.action.TogglePaneZoomState },

    -- close panes
    { key = 'q',  mods = 'LEADER', action = wezterm.action.CloseCurrentPane  { confirm = true } },

    -- END PANE CONTROLS
  },
  key_tables = {
    resize_pane = {
      { key = 'h',      action = wezterm.action.AdjustPaneSize { 'Left',  1 } },
      { key = 'j',      action = wezterm.action.AdjustPaneSize { 'Down',  1 } },
      { key = 'k',      action = wezterm.action.AdjustPaneSize { 'Up',    1 } },
      { key = 'l',      action = wezterm.action.AdjustPaneSize { 'Right', 1 } },
      { key = 'Escape', action = 'PopKeyTable' },
    },
    tab_movement ={
      { key = 'h',      action = wezterm.action{ActivateTab=0} },
      { key = 'j',      action = wezterm.action({ActivateTabRelative = 1}) },
      { key = 'k',      action = wezterm.action({ActivateTabRelative = -1}) },
      { key = 'Escape', action = 'PopKeyTable' },
      { key = 'x',      action = wezterm.action.CloseCurrentTab  { confirm = true } },
    },
    --activate_pane = {
    --  { key = 'h',      action = wezterm.action.ActivatePaneDirection 'Left' },
    --  { key = 'j',      action = wezterm.action.ActivatePaneDirection 'Down' },
    --  { key = 'k',      action = wezterm.action.ActivatePaneDirection 'Up' },
    --  { key = 'l',      action = wezterm.action.ActivatePaneDirection 'Right' },
    --},
  },
  tab_bar_at_bottom = true,
  tab_max_width = 60,
  term = 'wezterm',
  use_fancy_tab_bar = false,
  window_background_image = '$HOME/Personal Media/Images/desktop/raven_by_z__ed_ddmeskm-fullview.jpg',
  window_background_opacity = 0.9,
  window_frame = {
    font_size = 16.0,
  },
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  }
}
-- function layout_startup()
--   local win, tab, pane1 = SpawnWindow(0, 0, 0, 0, true) -- new window at x,y=(0,0) r,c=(0,0) and true is "maximized"
--   local pane2 = pane:SplitHorizontal( .6, .4 ) -- split, pane1 60% wide, pane2 40% wide
--   local pane3 = pane2:SplitVertical(.5, .5) -- split, pane2 50% high and pane3 50% high
--   local tab2 = win:SpawnTab()
--   -- more splits, etc.
--   local win, tab, pane1 = SpawnWindow(0, 0, r, 0, false) -- new window at x,y=(50,100) h,w=(24,80) and not "maximized"
--   -- more split, tab, windows
-- end
