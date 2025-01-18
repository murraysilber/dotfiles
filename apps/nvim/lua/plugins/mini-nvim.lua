return 
  { 'echasnovski/mini.nvim', version = false ,
  config = function()
    -- TODO: Do I need custom configs for these plugins?  
    require('mini.pairs').setup()
    require('mini.statusline').setup()
    require('mini.icons').setup()
    require('mini.git').setup()
    require('mini.diff').setup()
    require('mini.comment').setup()  
  end,
}
