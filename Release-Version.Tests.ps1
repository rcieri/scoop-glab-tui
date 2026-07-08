BeforeAll {
    $manifestPath = "$PSScriptRoot/bucket/glab-tui.json"
    $manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json
    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/rcieri/glab-tui/releases/latest" -Headers @{ Accept = "application/vnd.github.v3+json" }
    $expectedVersion = $release.tag_name.TrimStart('v')
}

Describe "glab-tui manifest is up to date with latest release" {
    It "manifest version matches latest GitHub release" {
        $manifest.version | Should -Be $expectedVersion
    }

    It "release download URL is reachable" {
        $url = $manifest.autoupdate.architecture."64bit".url.Replace('$version', $expectedVersion)
        (Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing).StatusCode | Should -Be 200
    }

    It "release checksum file is reachable" {
        $url = $manifest.autoupdate.architecture."64bit".url.Replace('$version', $expectedVersion)
        $hashUrl = "$url.sha256"
        (Invoke-WebRequest -Uri $hashUrl -Method Head -UseBasicParsing).StatusCode | Should -Be 200
    }
}
