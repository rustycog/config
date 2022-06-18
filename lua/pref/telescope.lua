local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    print "Telescope loading error!"
    return
end
