local function create_info_button(event)
	local player = game.players[event.player_index]

	if player.gui.top.info_button == nil then
		local button = player.gui.top.add({ type = "sprite-button", name = "info_button", sprite = "item/raw-fish" })
		button.style.minimal_height = 38
		button.style.minimal_width = 38
		button.style.top_padding = 2
		button.style.left_padding = 4
		button.style.right_padding = 4
		button.style.bottom_padding = 2
	end
end



local function info_show(player)

local infotext = [===[
Hi stranger, I'm a fish..
And this is what you ought to know:

- Please be nice and don't grief. Or else.. ;)
- Don't fight with other players for silly things.
- No political, racist, or misogynistic content.
- If you suspect you desync, restart the game.
- You can join our community on discord.me/redmew
- View the chatlog on: log.mewmew.net
- Contribute to server costs and upgrades with
  bitcoin: 13qh5uJh3UDUiWKyQaybkpxC1gfLVDB1ww
]===]

	player.gui.left.direction = "horizontal"
	local frame = player.gui.left.add { type = "frame", name = "info_panel"}
	frame.style.top_padding = 20
	frame.style.left_padding = 20
	frame.style.right_padding = 20
	frame.style.bottom_padding = 20
	local info_table = frame.add { type = "table", colspan = 1, name = "info_table" }
	local headline_label = info_table.add { type = "label", name = "headline_label", caption = "redmew fishy info" }
	headline_label.style.font = "default-listbox"
	headline_label.style.font_color = { r=0.98, g=0.66, b=0.22}


	local text_box = info_table.add { type = "text-box", text = infotext, name = "text_box" }
	text_box.read_only = true
	text_box.selectable = true
	text_box.word_wrap = false
	text_box.style.right_padding = 5
	text_box.style.top_padding = 5
	text_box.style.left_padding = 5
	text_box.style.bottom_padding = 5

	local info_table_2 = info_table.add { type = "table", colspan = 2, name = "info_table" }
	info_table_2.add { type = "label", caption = "                                                                         " }
	local close_button = info_table_2.add { type = "button", caption = "CLOSE", name = "info_close_button"  }
	close_button.style.font = "default-listbox"
end


local function on_gui_click(event)
	if not (event and event.element and event.element.valid) then return end

	local player = game.players[event.element.player_index]
	local name = event.element.name
	local frame = player.gui.left["info_panel"]

	if (name == "info_button") and (frame == nil) then
				info_show(player)
	else
		if (name == "info_button") then
			frame.destroy()
		end
	end

	if (name == "info_close_button") then
			frame.destroy()
	end

end


Event.register(defines.events.on_gui_click, on_gui_click)
Event.register(defines.events.on_player_joined_game, create_info_button)
