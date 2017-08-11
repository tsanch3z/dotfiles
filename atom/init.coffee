# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
atom.commands.add 'atom-workspace',
  'user:activate-vim-mode-plus': -> atom.packages.activatePackage('vim-mode-plus')
  'user:deactivate-vim-mode-plus': -> atom.packages.deactivatePackage('vim-mode-plus')
