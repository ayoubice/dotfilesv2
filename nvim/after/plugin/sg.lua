local sg_ok, sg = pcall(require, "sg")
if not sg_ok then
    return
end

sg.setup {}
