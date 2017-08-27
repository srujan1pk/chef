Write-Host -ForegroundColor Green "Searching now for latest updates (this may take a while)..."

    $updateSession = New-Object -com Microsoft.Update.Session
    $updateSearcher = $updateSession.CreateupdateSearcher()
    try
    {
      $searchResult =  $updateSearcher.Search("Type='Software' and IsHidden=0 and IsInstalled=0").Updates
    }
    catch
    {
      eventcreate /t ERROR /ID 1 /L APPLICATION /SO "Chef-Cookbook" /D "chef/cookbooks/windows_updates: Update attempt failed."
      $updateFailed = $true
    }

    if(!($updateFailed)) {
      foreach ($updateItem in $searchResult) {
        $UpdatesToDownload = New-Object -com Microsoft.Update.UpdateColl
        if (!($updateItem.EulaAccepted)) {
          $updateItem.AcceptEula()
        }
        $UpdatesToDownload.Add($updateItem)
        $Downloader = $UpdateSession.CreateUpdateDownloader()
        $Downloader.Updates = $UpdatesToDownload
        $Downloader.Download()
        $UpdatesToInstall = New-Object -com Microsoft.Update.UpdateColl
        $UpdatesToInstall.Add($updateItem)
        $Title = $updateItem.Title
        Write-host -ForegroundColor Green "  Installing Update: $Title"
        $Installer = $UpdateSession.CreateUpdateInstaller()
        $Installer.Updates = $UpdatesToInstall
        $InstallationResult = $Installer.Install()
        eventcreate /t INFORMATION /ID 1 /L APPLICATION /SO "Chef-Cookbook" /D "InstallWindowsUpdates: Installed update $Title."
      }

      if (!($searchResult.Count)) {
        eventcreate /t INFORMATION /ID 999 /L APPLICATION /SO "Chef-Solo" /D "chef/cookbooks/windows_updates: No updates available."
      }
      eventcreate /t INFORMATION /ID 1 /L APPLICATION /SO "Chef-Solo" /D "chef/cookbooks/windows_updates: Done Installing Updates."
    }
