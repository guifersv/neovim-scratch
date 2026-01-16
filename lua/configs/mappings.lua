local set = vim.keymap.set

-- ── File & Session Management ────────────────────────────────────
set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
set("n", "<leader>q", "<cmd>qa<cr>", { desc = "Close All" })
set("n", "<leader>Q", "<cmd>qa!<cr>", { desc = "Force Close All" })
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ── General Editor Behavior ──────────────────────────────────────
set("i", "jk", "<Esc>")
set("i", "<C-h>", "<Left>", { desc = "move left" })
set("i", "<C-l>", "<Right>", { desc = "move right" })
set("i", "<C-j>", "<Down>", { desc = "move down" })
set("i", "<C-k>", "<Up>", { desc = "move up" })

-- ── Window Navigation & Resizing ─────────────────────────────────
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

set("n", "<C-Up>", "<cmd>resize +4<cr>", { desc = "Increase Window Height" })
set("n", "<C-Down>", "<cmd>resize -4<cr>", { desc = "Decrease Window Height" })
set("n", "<C-Left>", "<cmd>vertical resize -4<cr>", { desc = "Decrease Window Width" })
set("n", "<C-Right>", "<cmd>vertical resize +4<cr>", { desc = "Increase Window Width" })

-- ── Terminal Mode ────────────────────────────────────────────────
set("t", "<C-x>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
set("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
set("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
set("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
set("t", "<C-l>", [[<Cmd>wincmd l<CR>]])

-- ── Tab Management ───────────────────────────────────────────────
set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
set("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })
set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
set("n", "<leader><tab>t", "<cmd>tablast<cr>", { desc = "Last Tab" })
set("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next Tab" })
set("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- ── Nvim-Tree ───────────────────────────────────────────────────
set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer Toggle (Root)" })
set("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { desc = "Explorer Focus Current File" })

-- ── Flash (Enhanced Navigation) ──────────────────────────────────
-- Basic Jump
set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

-- Treesitter Selection & Search
set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
set({ "x", "o" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

-- Remote Operations
set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })

-- ── Spider Motions (Subword Navigation) ──────────────────────────
set({ "n", "x", "o" }, "w", "<cmd>lua require('spider').motion('w')<cr>", { desc = "Next word" })
set({ "n", "x", "o" }, "e", "<cmd>lua require('spider').motion('e')<cr>", { desc = "Next end of word" })
set({ "n", "x", "o" }, "b", "<cmd>lua require('spider').motion('b')<cr>", { desc = "Previous word" })
set({ "n", "x", "o" }, "ge", "<cmd>lua require('spider').motion('ge')<cr>", { desc = "Previous end of word" })

-- ── ToggleTerm ──────────────────────────
set("t", "<A-f>", [[<C-\><C-n><cmd>ToggleTerm direction=float<CR>]], { silent = true })
set("t", "<A-s>", [[<C-\><C-n><cmd>ToggleTerm direction=horizontal<CR>]], { silent = true })
set("t", "<A-v>", [[<C-\><C-n><cmd>ToggleTerm direction=vertical<CR>]], { silent = true })
set("n", "<A-f>", "<cmd>ToggleTerm direction=float<CR>", { silent = true })
set("n", "<A-s>", "<cmd>ToggleTerm direction=horizontal<CR>", { silent = true })
set("n", "<A-v>", "<cmd>ToggleTerm direction=vertical size=40<CR>", { silent = true })

-- ── Diagnostics ──────────────────────────────────────────────────
local diagnostic_goto = function(next, severity)
	return function()
		vim.diagnostic.jump({
			count = (next and 1 or -1) * vim.v.count1,
			severity = severity and vim.diagnostic.severity[severity] or nil,
			float = true,
		})
	end
end

set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- ── Language Specific (Rust/Cargo & .NET) ────────────────────────
-- Rust
set("n", "<leader>ar", "<cmd>Crun<CR>", { desc = "Cargo run" })
set("n", "<leader>ab", "<cmd>Cbuild<CR>", { desc = "Cargo build" })
set("n", "<leader>at", "<cmd>Ctest<CR>", { desc = "Cargo test" })

set("n", "<leader>aa", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { desc = "Cargo code actions" })
set("n", "<leader>ak", function()
	vim.cmd.RustLsp({ "hover", "actions" })
end, { desc = "Cargo hover" })

-- .NET
set("n", "<leader>mr", "<cmd>Dotnet run<CR>", { desc = "Dotnet run" })
set("n", "<leader>mw", "<cmd>Dotnet watch<CR>", { desc = "Dotnet watch" })
set("n", "<leader>mt", "<cmd>Dotnet test<CR>", { desc = "Dotnet test" })
set("n", "<leader>mb", "<cmd>Dotnet build<CR>", { desc = "Dotnet build" })
set("n", "<leader>mv", "<cmd>Dotnet project view<CR>", { desc = "Dotnet project view" })
