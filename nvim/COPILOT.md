# Copilot Configuration

This Neovim configuration includes GitHub Copilot and CopilotChat for AI-powered code assistance.

## Copilot Inline Suggestions

Copilot provides inline code suggestions as you type.

### Keybindings

- `<C-CR>` - Accept Copilot suggestion (Ctrl + Enter)
- `<M-]>` - Next suggestion (Alt + ])
- `<M-[>` - Previous suggestion (Alt + [)
- `<C-]>` - Dismiss suggestion (Ctrl + ])

## CopilotChat

CopilotChat provides an interactive chat interface for code explanations, reviews, and more.

### Keybindings

All CopilotChat commands use the leader key (`,` by default):

- `,cc` - Open CopilotChat (normal and visual mode)
- `,cq` - Quick chat with visual selection
- `,ce` - Explain selected code
- `,cr` - Review selected code
- `,ct` - Generate tests for selected code
- `,cf` - Refactor selected code
- `,cx` - Fix selected code
- `,cv` - Toggle CopilotChat window

## Setup

After installing plugins with `:PackerSync`, you'll need to authenticate with GitHub Copilot:

1. Run `:Copilot auth` in Neovim
2. Follow the authentication instructions
3. Restart Neovim

## Usage Tips

- Copilot suggestions appear automatically as you type
- Use visual mode to select code before using CopilotChat commands
- CopilotChat is great for understanding complex code or getting refactoring suggestions
