# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/alexanderdibattista/.nvm/versions/node/v10.1.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/alexanderdibattista/.nvm/versions/node/v10.1.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/alexanderdibattista/.nvm/versions/node/v10.1.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /Users/alexanderdibattista/.nvm/versions/node/v10.1.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
