local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.default_prog = { "pwsh.exe" }

-- Font
config.font = wezterm.font("CaskaydiaCove NFM")
config.font_size = 12.0
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

-- Custom Gruvbox Dark color scheme
config.color_schemes = {
  ["Gruvbox Dark"] = {
    foreground = "#ebdbb2",
    background = "#282828",
    cursor_bg = "#ebdbb2",
    cursor_fg = "#282828",
    cursor_border = "#ebdbb2",
    selection_fg = "#282828",
    selection_bg = "#d5c4a1",
    ansi = {
      "#282828",  -- black
      "#cc241d",  -- red
      "#98971a",  -- green
      "#d79921",  -- yellow
      "#458588",  -- blue
      "#b16286",  -- magenta
      "#689d6a",  -- cyan
      "#a89984",  -- white
    },
    brights = {
      "#928374",  -- bright black
      "#fb4934",  -- bright red
      "#b8bb26",  -- bright green
      "#fabd2f",  -- bright yellow
      "#83a598",  -- bright blue
      "#d3869b",  -- bright magenta
      "#8ec07c",  -- bright cyan
      "#ebdbb2",  -- bright white
    },
  },
}
config.color_scheme = "Gruvbox Dark"

-- Window appearance
config.window_background_opacity = 0.85
config.win32_system_backdrop = "Acrylic"
config.window_padding = { left = 12, right = 12, top = 12, bottom = 12 }
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_color = "#3c3836"
config.window_close_confirmation = "NeverPrompt"

-- Tab bar
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false

-- Window frame (title/tab bar styling)
config.window_frame = {
  font = wezterm.font("CaskaydiaCove NFM", { weight = "Bold" }),
  font_size = 10.0,
  active_titlebar_bg = "#282828",
  inactive_titlebar_bg = "#282828",
  active_titlebar_fg = "#ebdbb2",
  inactive_titlebar_fg = "#665c54",
  active_titlebar_border_bottom = "#3c3836",
  inactive_titlebar_border_bottom = "#3c3836",
  button_fg = "#ebdbb2",
  button_bg = "#282828",
  button_hover_fg = "#282828",
  button_hover_bg = "#d79921",
}

config.colors = {
  tab_bar = {
    background = "#282828",
    active_tab = {
      bg_color = "#3c3836",
      fg_color = "#ebdbb2",
    },
    inactive_tab = {
      bg_color = "#282828",
      fg_color = "#665c54",
    },
    inactive_tab_hover = {
      bg_color = "#504945",
      fg_color = "#ebdbb2",
    },
    new_tab = {
      bg_color = "#282828",
      fg_color = "#665c54",
    },
    new_tab_hover = {
      bg_color = "#3c3836",
      fg_color = "#ebdbb2",
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
