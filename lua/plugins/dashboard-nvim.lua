local function dashboard_header() return {
 '', '', '',
'██╗   ██╗███████╗██████╗ ███████╗ █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗',
'╚██╗ ██╔╝██╔════╝██╔══██╗╚══███╔╝██╔══██╗████╗  ██║██║   ██║██║████╗ ████║',
' ╚████╔╝ █████╗  ██████╔╝  ███╔╝ ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║',
'  ╚██╔╝  ██╔══╝  ██╔══██╗ ███╔╝  ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║',
'   ██║   ███████╗██║  ██║███████╗██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║',
'   ╚═╝   ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝',
'', '', ''
}
end

require('dashboard').setup {
    theme = 'doom',
    config = {
        header = dashboard_header(),
        center = {
          {
            icon = '󰙅  ',
            icon_hl = 'Title',
            desc = 'Open tree',
            desc_hl = 'String',
            key = 'b',
            key_hl = 'Number',
            action = ':NeoTreeFloat',
          },
          {
            icon = '󰈞  ',
            icon_hl = 'Title',
            desc = 'Find files',
            desc_hl = 'String',
            key = 'o',
            key_hl = 'Number',
            action = ':Telescope find_files',
          },
          {
            icon = '  ',
            icon_hl = 'Title',
            desc = 'Find text',
            desc_hl = 'String',
            key = 'f',
            key_hl = 'Number',
            action = ':Telescope live_grep'
          },

        },
        footer = {"[ Yernaz Kenesbekov] [ yerza06] [ YerzaNvim]"}
    }
}
