local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe" }

-- Font
config.font = wezterm.font("CaskaydiaCove NFM")
config.font_size = 12.0
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- Custom Matrix color scheme
config.color_schemes = {
  ["Matrix"] = {
    foreground = "#00ff00",
    background = "#000000",
    cursor_bg = "#00ff00",
    cursor_fg = "#000000",
    cursor_border = "#00ff00",
    selection_fg = "#000000",
    selection_bg = "#00ff00",
    ansi = {
      "#000000",  -- black
      "#00aa00",  -- "red" -> dark green
      "#00ff00",  -- green -> bright green
      "#33ff33",  -- "yellow" -> light green
      "#009900",  -- "blue" -> medium green
      "#00cc00",  -- "magenta" -> green
      "#66ff66",  -- "cyan" -> pale green
      "#00ff00",  -- "white" -> green
    },
    brights = {
      "#003300",  -- bright black (dim green)
      "#00cc00",  -- bright "red"
      "#33ff33",  -- bright green
      "#66ff66",  -- bright "yellow"
      "#00ff00",  -- bright "blue"
      "#33ff33",  -- bright "magenta"
      "#99ff99",  -- bright "cyan"
      "#ffffff",  -- bright white
    },
  },
}
config.color_scheme = "Matrix"

-- Window appearance
config.window_background_opacity = 0.85
config.win32_system_backdrop = "Acrylic"
config.window_padding = { left = 12, right = 12, top = 12, bottom = 12 }
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_color = "#003b00"
config.window_close_confirmation = "NeverPrompt"

-- Tab bar
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false

-- Window frame (title/tab bar styling)
config.window_frame = {
  font = wezterm.font("CaskaydiaCove NFM", { weight = "Bold" }),
  font_size = 10.0,
  active_titlebar_bg = "#000000",
  inactive_titlebar_bg = "#000000",
  active_titlebar_fg = "#00ff00",
  inactive_titlebar_fg = "#005500",
  active_titlebar_border_bottom = "#003b00",
  inactive_titlebar_border_bottom = "#003b00",
  button_fg = "#00ff00",
  button_bg = "#000000",
  button_hover_fg = "#000000",
  button_hover_bg = "#00ff00",
}

config.colors = {
  tab_bar = {
    background = "#000000",
    active_tab = {
      bg_color = "#003b00",
      fg_color = "#00ff00",
    },
    inactive_tab = {
      bg_color = "#000000",
      fg_color = "#005500",
    },
    inactive_tab_hover = {
      bg_color = "#002200",
      fg_color = "#00ff00",
    },
    new_tab = {
      bg_color = "#000000",
      fg_color = "#005500",
    },
    new_tab_hover = {
      bg_color = "#003b00",
      fg_color = "#00ff00",
    },
  },
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500

-- Build sorted list of dark color schemes for cycling
local scheme_names = (function()
  local schemes = wezterm.color.get_builtin_schemes()
  local dark = {}
  for name, scheme in pairs(schemes) do
    if scheme.background then
      local bg = wezterm.color.parse(scheme.background)
      local _, _, l, _ = bg:hsla()
      if l < 0.4 then
        table.insert(dark, name)
      end
    end
  end
  table.sort(dark)
  return dark
end)()

-- Keybindings
config.keys = {
  -- Color scheme picker (fuzzy search): Ctrl+Shift+T
  {
    key = "T",
    mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window, pane)
      local choices = {}
      for _, name in ipairs(scheme_names) do
        table.insert(choices, { label = name })
      end

      window:perform_action(
        act.InputSelector {
          action = wezterm.action_callback(function(inner_window, inner_pane, id, label)
            if label then
              inner_window:set_config_overrides { color_scheme = label }
            end
          end),
          title = "Pick a Color Scheme",
          choices = choices,
          fuzzy = true,
          fuzzy_description = "Type to filter color schemes: ",
        },
        pane
      )
    end),
  },
  -- Next color scheme: Alt+n
  {
    key = "n",
    mods = "ALT",
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      local current = overrides.color_scheme or config.color_scheme
      local idx = 1
      for i, name in ipairs(scheme_names) do
        if name == current then
          idx = i
          break
        end
      end
      idx = (idx % #scheme_names) + 1
      overrides.color_scheme = scheme_names[idx]
      window:set_config_overrides(overrides)
      window:toast_notification("Color Scheme", scheme_names[idx], nil, 2000)
    end),
  },
  -- Previous color scheme: Alt+p
  {
    key = "p",
    mods = "ALT",
    action = wezterm.action_callback(function(window, pane)
      local overrides = window:get_config_overrides() or {}
      local current = overrides.color_scheme or config.color_scheme
      local idx = 1
      for i, name in ipairs(scheme_names) do
        if name == current then
          idx = i
          break
        end
      end
      idx = ((idx - 2) % #scheme_names) + 1
      overrides.color_scheme = scheme_names[idx]
      window:set_config_overrides(overrides)
      window:toast_notification("Color Scheme", scheme_names[idx], nil, 2000)
    end),
  },
}

return config
