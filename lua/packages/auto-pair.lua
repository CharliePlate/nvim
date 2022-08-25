local status_ok, autopair = pcall(require, "auto-pair")
if not status_ok then
  return
end

autopair.setup()
