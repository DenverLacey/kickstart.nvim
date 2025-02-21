-- [[ Custom align command that aligns multiple lines by a given string ]] --

local function align_by_string(info)
    local needle = info.args
    local bln = info.line1
    local eln = info.line2

    -- early return if only selected one line
    if bln == eln then
        return
    end

    print("Aligning lines", bln, "to", eln)

    local lines = vim.api.nvim_buf_get_lines(0, bln-1, eln, true)

    local largest_offset = -1
    local offsets = {}
    for i, line in ipairs(lines) do
        local offset, _ = string.find(line, needle)
        if offset ~= nil then
            largest_offset = math.max(largest_offset, offset)
        end
        table.insert(offsets, i, offset)
    end

    local replacement = {}
    for i = 1, #lines do
        if offsets[i] == nil or offsets[i] == largest_offset then
            table.insert(replacement, i, lines[i])
            goto continue
        end
        local n_extra_spaces = largest_offset - offsets[i]
        local before = string.sub(lines[i], 1, offsets[i] - 1)
        local after = string.sub(lines[i], offsets[i])
        local spaces = string.rep(' ', n_extra_spaces)
        table.insert(replacement, i, before .. spaces .. after)
        ::continue::
    end

    vim.api.nvim_buf_set_lines(0, bln-1, eln, true, replacement)
end

local M = {}

function M.setup()
    vim.api.nvim_create_user_command('Align', align_by_string, {
        nargs = 1,
        range = true,
        desc  = 'Align several lines by a string',
    })
end

return M

