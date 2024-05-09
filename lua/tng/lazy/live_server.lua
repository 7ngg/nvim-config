return {
    "aurum77/live-server.nvim",
    cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    config = function ()
        require("live_server.util").install()
    end
}
