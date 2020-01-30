Split-Path $MyInvocation.MyCommand.Path | Set-Location
hugo server --bind 0.0.0.0 --disableFastRender