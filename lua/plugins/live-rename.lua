-- TODO: add message "Renamed x instances in y files"
-- TODO: cancel rename if the buffer changed
return {
  "saecki/live-rename.nvim",
  keys = {
    { "grn", "<cmd>lua require('live-rename').rename()<cr>" },
  },
}
