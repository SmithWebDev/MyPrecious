local wezterm = require('wezterm')

function rails_project()
  -- Set the Wezterm layout configuration.
  wezterm.run("wezterm -l rails_project")

  -- Set the height and width of each tab.
  wezterm.run("wezterm -t \"Tab 1\" -h 800 -w 600")
  wezterm.run("wezterm -t \"Tab 2\" -h 800 -w 200")
  wezterm.run("wezterm -t \"Tab 3\" -h 200 -w 200")
  wezterm.run("wezterm -t \"Tab 4\" -h 200 -w 200")
  wezterm.run("wezterm -t \"Tab 5\" -h 200 -w 200")
  wezterm.run("wezterm -t \"Tab 6\" -h 200 -w 200")

  -- Position the tabs.
  wezterm.run("wezterm -t \"Tab 1\" -x 0 -y 0")
  wezterm.run("wezterm -t \"Tab 2\" -x 600 -y 0")
  wezterm.run("wezterm -t \"Tab 3\" -x 0 -y 200")
  wezterm.run("wezterm -t \"Tab 4\" -x 0 -y 400")
  wezterm.run("wezterm -t \"Tab 5\" -x 0 -y 600")
  wezterm.run("wezterm -t \"Tab 6\" -x 0 -y 800")

  -- Run the specified command in each tab.
  wezterm.run("wezterm -t \"Tab 1\" run v")
  wezterm.run("wezterm -t \"Tab 2\" run rails console")
  wezterm.run("wezterm -t \"Tab 3\" ")
  wezterm.run("wezterm -t \"Tab 4\" rails routes")
  wezterm.run("wezterm -t \"Tab 5\" bin/dev")
  wezterm.run("wezterm -t \"Tab 6\" spotify-player")
end
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})

  window:gui_window():maximize()

  local bot0 = pane:split { direction = 'Bottom', size = 0.25 }
  local bot1 = bot0:split { direction = 'Left', size = 0.5 }
  local bot2 = bot1:split { direction = 'Left', size = 0.5 }
  local bot3 = bot0:split { direction = 'Left', size = 0.5 }

  local top = pane:split { direction = 'Right', size = 1.25 }
end)
