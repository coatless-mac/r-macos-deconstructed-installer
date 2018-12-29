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

Summary of macOS R installer for R-3.5.2 taken on 2018-12-29.

    tree r-pkg

    ## r-pkg
    ## ├── Distribution
    ## ├── Resources
    ## │   └── en.lproj
    ## │       └── background
    ## ├── r-1.pkg
    ## │   ├── Bom
    ## │   ├── PackageInfo
    ## │   └── Payload
    ## ├── r.pkg
    ## │   ├── Bom
    ## │   ├── PackageInfo
    ## │   ├── Payload
    ## │   └── Scripts
    ## │       ├── postflight
    ## │       ├── postflight~
    ## │       └── postinstall
    ## ├── tcltk8.pkg
    ## │   ├── Bom
    ## │   ├── PackageInfo
    ## │   └── Payload
    ## └── texinfo5.pkg
    ##     ├── Bom
    ##     ├── PackageInfo
    ##     └── Payload
    ## 
    ## 7 directories, 17 files
