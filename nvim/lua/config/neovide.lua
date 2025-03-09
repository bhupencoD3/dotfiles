if vim.g.neovide then
  -----vim.o.guifont = "Iosevka Nerd Font:h14" -- text below applies for VimScript
  vim.opt.linespace = 2
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  ----vim.g.neovide_cursor_smooth_blink = false
  ---- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5
  vim.g.neovide_cursor_vfx_particle_curl = 1.0
end
