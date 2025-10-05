local status_ok, copilot_chat = pcall(require, "CopilotChat")
if not status_ok then
    return
end

copilot_chat.setup {
    debug = false,
    show_help = "yes",
    prompts = {
        Explain = "Explain how this code works.",
        Review = "Review this code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor this code to improve clarity and readability.",
    },
}

-- Keybindings for CopilotChat
local opts = { noremap = true, silent = true }

-- Open CopilotChat
vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChat<CR>", opts)
vim.keymap.set("v", "<leader>cc", "<cmd>CopilotChat<CR>", opts)

-- Quick chat with visual selection
vim.keymap.set("v", "<leader>cq", "<cmd>CopilotChatVisual<CR>", opts)

-- Explain code
vim.keymap.set("n", "<leader>ce", "<cmd>CopilotChatExplain<CR>", opts)
vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<CR>", opts)

-- Review code
vim.keymap.set("n", "<leader>cr", "<cmd>CopilotChatReview<CR>", opts)
vim.keymap.set("v", "<leader>cr", "<cmd>CopilotChatReview<CR>", opts)

-- Generate tests
vim.keymap.set("n", "<leader>ct", "<cmd>CopilotChatTests<CR>", opts)
vim.keymap.set("v", "<leader>ct", "<cmd>CopilotChatTests<CR>", opts)

-- Refactor code
vim.keymap.set("n", "<leader>cf", "<cmd>CopilotChatRefactor<CR>", opts)
vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatRefactor<CR>", opts)

-- Fix code
vim.keymap.set("n", "<leader>cx", "<cmd>CopilotChatFix<CR>", opts)
vim.keymap.set("v", "<leader>cx", "<cmd>CopilotChatFix<CR>", opts)

-- Toggle CopilotChat
vim.keymap.set("n", "<leader>cv", "<cmd>CopilotChatToggle<CR>", opts)
