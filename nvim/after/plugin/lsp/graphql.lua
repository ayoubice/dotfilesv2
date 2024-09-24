local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

return {
    root_dir = lspconfig.util.root_pattern(".graphqlconfig", ".graphqlrc", "package.json"),
    flags = {
        debounce_text_changes = 150,
    },
}
