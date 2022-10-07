local status_ok, lightspeed = pcall(require, "lightspeed")
if not status_ok then
	return
end

lightspeed.setup({
	ignore_case = false,
	jump_to_unique_chars = { safety_timeout = 400 },
	exit_after_idle_msecs = { unlabeled = nil, labeled = nil },
	match_only_the_start_of_same_char_seqs = true,
	force_beacons_into_match_width = false,
	substitute_chars = { ["\r"] = "¬" },
	special_keys = {
		next_match_group = "<space>",
		prev_match_group = "<tab>",
	},
	limit_ft_matches = 4,
	repeat_ft_with_target_char = false,
})
