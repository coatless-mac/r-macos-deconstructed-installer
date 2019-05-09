R Package Installer Deconstruction
----------------------------------

The goal behind this project is to see how the underlying R installer
package is created. We do this by reverse engineering the installer
package using the `pkgutil` tool. Alternative, you can use “Show Package
Contents” on the right click context menu.

### Overview of Tracked Files

-   [Scripts](Scripts/): Shell scripts run by the installer
    -   [postflight](Scripts/postflight)
        -   Run after files have been installed for the **first time
            only**.
        -   Launches before the `postflight` script if one is included
            in `/scripts`.
    -   [postinstall](Scripts/postinstall)
        -   Run after all files have been installed.

### Installer File Archive Overview

Summary of macOS R installer for R-3.5.3 taken on 2019-05-09.

    tree r-pkg

    ## [01;34mr-pkg[00m
    ## ├── Distribution
    ## ├── [01;34mResources[00m
    ## │   └── [01;34men.lproj[00m
    ## │       └── background
    ## ├── [01;34mr-1.pkg[00m
    ## │   ├── Bom
    ## │   ├── PackageInfo
    ## │   └── Payload
    ## ├── [01;34mr.pkg[00m
    ## │   ├── Bom
    ## │   ├── PackageInfo
    ## │   ├── Payload
    ## │   └── [01;34mScripts[00m
    ## │       ├── [01;32mpostflight[00m
    ## │       ├── [01;32mpostflight~[00m
    ## │       └── [01;32mpostinstall[00m
    ## ├── [01;34mtcltk8.pkg[00m
    ## │   ├── Bom
    ## │   ├── PackageInfo
    ## │   └── Payload
    ## └── [01;34mtexinfo5.pkg[00m
    ##     ├── Bom
    ##     ├── PackageInfo
    ##     └── Payload
    ## 
    ## 7 directories, 17 files
