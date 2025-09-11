# R CMD check results

## Test environments
GitHub Actions:

* macos-latest (release)
* windows-latest (release)
* ubuntu-latest (release)
* ubuntu-latest (devel)
* ubuntu-latest (oldrel-1)

## Results

0 errors ✔ | 0 warnings ✔ |  0 notes ✔

# rhub

## Test environments
GitHub Actions:

* macos-15 on GitHub, ASAN + UBSAN on macOS (release)
* windows-latest (release)
* macos-13 on GitHub (release)
* macos-latest on GitHub (release)

## Results
0 errors ✔ | 0 warnings ✔ | 0 notes ✔

# General Notes
* On headless macOS there is a problem with the import of 'tlctk' imported by 
  'summarytools' package.
  This triggers the error:
  "Error: .onLoad failed in loadNamespace() for 'tcltk', details:
     call: fun(libname, pkgname)
     error: X11 library is missing: install XQuartz from www.xquartz.org"
  This error **doesn't effect the package functionality** since the package itself 
  **does not use tlctk directly**.
* SystemRequirements has been updated to indicate Tk as optional:
    SystemRequirements: tcltk (optional)
