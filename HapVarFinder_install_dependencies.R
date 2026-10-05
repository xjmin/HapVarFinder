# ============================================================================
# HapVarFinder Package Dependency Installer
# ============================================================================
#
# Purpose: This script installs all required dependencies for the HapVarFinder
#          package as specified in the DESCRIPTION file.
#
# How to use:
# 1. Save this script to a local directory, e.g., "HapVarFinder_install_dependencies.R"
# 2. Open R or RStudio and set your working directory to where the script is saved
# 3. Run: source("HapVarFinder_install_dependencies.R")
# 4. The script will automatically:
#    - Install all CRAN packages listed in the DESCRIPTION file
#    - Install BiocManager if not present
#    - Install Rsamtools from Bioconductor
#    - Verify all installations
#    - Report any failed installations with troubleshooting suggestions
#
# System Requirements:
# - R version >= 3.6.0
# - Internet connection for downloading packages
# - Sufficient disk space for package installations
# - Administrative privileges (may be required for some system libraries)
#
# Troubleshooting:
# 1. If you encounter "package not available" errors, try changing the CRAN mirror:
#    options(repos = c(CRAN = "https://cloud.r-project.org/"))
# 2. If Bioconductor installation fails, visit: https://bioconductor.org/install
# 3. For compilation errors on Linux/macOS, ensure you have development tools:
#    - Linux: sudo apt-get install build-essential (Ubuntu/Debian)
#    - macOS: Install Xcode Command Line Tools: xcode-select --install
# 4. If some packages fail to install, the script will list them for manual installation
#
# Note: This script is designed to be non-destructive. It checks if packages
#       are already installed before attempting installation. It will not
#       upgrade existing packages unless necessary for compatibility.

# Set CRAN mirror for faster downloads (using RStudio mirror as default)
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Install function
install_HapVarFinder_deps <- function() {

  # Define CRAN packages from Imports field
  cran_packages <- c(
    "shiny",           # Shiny web framework (also in Depends)
    "shinythemes",     # Shiny themes
    "shinycssloaders", # CSS loaders for Shiny
    "data.table",      # Fast data manipulation
    "dplyr",           # Data manipulation
    "stringr",         # String operations
    "DT",              # DataTables for R/Shiny
    "shinyjs",         # JavaScript operations in Shiny
    "shinyWidgets",    # Additional Shiny widgets
    "shinydisconnect", # Disconnect message for Shiny
    "shinydashboard",  # Dashboard layout for Shiny
    "shinyalert",      # Alert modals for Shiny
    "shinyFeedback"    # User feedback for Shiny
  )

  # Bioconductor package
  bioc_packages <- "Rsamtools"

  message("=========================================")
  message("HapVarFinder Dependency Installation Script")
  message("=========================================")
  message("")

  # Check and install CRAN packages
  message("STEP 1: Installing CRAN packages...")
  message("-----------------------------------------")

  for (pkg in cran_packages) {
    if (!requireNamespace(pkg, quietly = TRUE)) {
      message(sprintf("Installing: %s", pkg))
      install.packages(pkg, dependencies = TRUE)
    } else {
      message(sprintf("Already installed: %s", pkg))
    }
  }

  message("")
  message("STEP 2: Installing Bioconductor packages...")
  message("-----------------------------------------")

  # Check and install Bioconductor packages
  if (!requireNamespace("Rsamtools", quietly = TRUE)) {
    message("Installing BiocManager...")
    install.packages("BiocManager")

    message(sprintf("Installing: %s", bioc_packages))
    BiocManager::install(bioc_packages, update = FALSE)
  } else {
    message(sprintf("Already installed: %s", bioc_packages))
  }

  message("")
  message("STEP 3: Verifying installations...")
  message("-----------------------------------------")

  # Verify all packages are installed
  all_packages <- c(cran_packages, bioc_packages)
  failed_packages <- character(0)

  for (pkg in all_packages) {
    if (requireNamespace(pkg, quietly = TRUE)) {
      message(sprintf("✓ %s is ready", pkg))
    } else {
      message(sprintf("✗ %s failed to install", pkg))
      failed_packages <- c(failed_packages, pkg)
    }
  }

  message("")
  message("=========================================")

  if (length(failed_packages) == 0) {
    message("SUCCESS: All dependencies installed successfully!")
    message("")
    message("You can now install HapVarFinder:")
    message("devtools::install_github('yourusername/HapVarFinder')")
    message("")
    message("Then load the package:")
    message("library(HapVarFinder)")
  } else {
    message("WARNING: Some packages failed to install:")
    message(paste(failed_packages, collapse = ", "))
    message("")
    message("Try installing them manually:")
    message("install.packages(c('", paste(failed_packages, collapse = "', '"), "'))")
    message("")
    message("For Rsamtools (if it failed):")
    message("install.packages('BiocManager')")
    message("BiocManager::install('Rsamtools')")
  }

  message("=========================================")
}

# Alternative: One-line installation command for quick use
quick_install <- function() {
  message("Running quick installation of HapVarFinder dependencies...")

  # Install CRAN packages
  install.packages(c(
    "shiny", "shinythemes", "shinycssloaders", "data.table",
    "dplyr", "stringr", "DT", "shinyjs", "shinyWidgets",
    "shinydisconnect", "shinydashboard", "shinyalert", "shinyFeedback"
  ))

  # Install BiocManager if not present
  if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }

  # Install Rsamtools
  BiocManager::install("Rsamtools", update = FALSE)

  message("Quick installation completed!")
}

# ============================================================================
# RUN THE INSTALLATION
# ============================================================================

# Uncomment ONE of the following lines to run the installation:

# Option 1: Run the detailed installation
install_HapVarFinder_deps()

# Option 2: Run the quick installation (uncomment the line below)
# quick_install()

# ============================================================================
# POST-INSTALLATION CHECK
# ============================================================================

# After running the installation, you can test if all packages load correctly
test_load <- function() {
  message("")
  message("Testing if packages can be loaded...")

  test_packages <- c(
    "shiny", "shinythemes", "shinycssloaders", "data.table",
    "dplyr", "stringr", "DT", "shinyjs", "shinyWidgets",
    "shinydisconnect", "shinydashboard", "shinyalert",
    "shinyFeedback", "Rsamtools"
  )

  for (pkg in test_packages) {
    success <- suppressWarnings(
      suppressMessages(
        require(pkg, character.only = TRUE, quietly = TRUE)
      )
    )
    if (success) {
      message(sprintf("✓ %s loads successfully", pkg))
    } else {
      message(sprintf("✗ %s fails to load", pkg))
    }
    if (pkg %in% c("shiny", "Rsamtools")) {
      # Unload to avoid conflicts
      detach(paste0("package:", pkg), character.only = TRUE, unload = TRUE)
    }
  }
}

# To run the test after installation, uncomment:
# test_load()
