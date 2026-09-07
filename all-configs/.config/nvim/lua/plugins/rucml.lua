return {
  "aveplen/ruscmd.nvim",
  enabled = false, -- Отключаем, если переходим на встроенный langmap
  config = function()
    local utf8_ru = "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮйцукенгшщзхъфывапролджэячсмитьбю;"
    local utf8_en = "QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>qwertyuiop[]asdfghjkl;'zxcvbnm,."
    vim.opt.langmap = vim.fn.escape(utf8_ru, '," \t') .. ';' .. vim.fn.escape(utf8_en, '," \t')
  end
}
