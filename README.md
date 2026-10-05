# HapVarFinder

## A Unified Framework for Haplotype Genotyping of Multivariant Genetic Markers

HapVarFinder is an open-source R framework for haplotype genotyping of multivariant genetic markers from both second- and third-generation sequencing data.

Unlike existing software that primarily focuses on SNP-based microhaplotypes (MHs) from targeted sequencing assays, HapVarFinder supports a broad spectrum of haplotype markers, including:

- SNP-based Microhaplotypes (MHs)
- Multi-InDel markers
- DIP-MHs
- Custom multivariant marker systems

The framework is compatible with both targeted sequencing panels and untargeted datasets such as whole-genome sequencing (WGS) and whole-exome sequencing (WES), enabling scalable haplotype analysis across diverse forensic and genetic applications.

In addition to haplotype genotyping, HapVarFinder integrates population frequency estimation, forensic statistical analysis, DNA mixture interpretation workflows, and data export modules compatible with established forensic software such as EuroForMix and Familias.

HapVarFinder is freely available and designed as an extensible platform for current and emerging haplotype-based forensic genetic analyses.

---

# Overview

HapVarFinder was developed by providing a unified and platform-agnostic framework for haplotype analysis. Key advantages include:

### Broad Marker Support

HapVarFinder supports multiple classes of multivariant genetic markers:

- Microhaplotypes (MHs)
- Multi-InDels
- DIP-MHs
- User-defined multivariant loci

### Multi-Platform Compatibility

Compatible with:

- Illumina sequencing
- MGI sequencing
- Oxford Nanopore sequencing
- Other BAM-based sequencing datasets

### Targeted and Untargeted Data Analysis

Supports:

- Targeted forensic sequencing panels
- Whole-genome sequencing (WGS)
- Whole-exome sequencing (WES)

### Integrated Forensic Workflows

Provides downstream tools for:

- Population frequency estimation
- Forensic parameter calculation
- DNA mixture interpretation
- EuroForMix database generation
- Familias-compatible outputs

### Interactive and Reproducible

- Command-line workflow
- Shiny graphical interface
- Open-source and fully reproducible

# Repository Contents

This repository contains the following files:

| File                                 | Description                                             |
| ------------------------------------ | ------------------------------------------------------- |
| **HapVarFinder_1.0.0.tar.gz**           | HapVarFinder R package source file for local installation  |
| **HapVarFinder_install_dependencies.R** | Script for installing all required package dependencies |
| **HapVarFinder.pdf**                    | Complete user manual and software documentation         |
| **README.md**                        | Project overview and installation guide                 |

---

# Installation

## Step 1. Download Repository Files

Download the following files from this repository:

```text
HapVarFinder_1.0.0.tar.gz
HapVarFinder_install_dependencies.R
HapVarFinder.pdf
```

---

## Step 2. Install Dependencies

Before installing HapVarFinder, install all required dependencies:

```r
source("HapVarFinder_install_dependencies.R")
```

This script automatically installs all required R packages.

---

## Step 3. Install HapVarFinder

Install the package locally:

```r
install.packages(
  "HapVarFinder_1.0.0.tar.gz",
  repos = NULL,
  type = "source"
)
```

Load the package:

```r
library(HapVarFinder)
```

---

## Step 4. Launch Shiny GUI

```r
HapVarFinder::runHapVarFinder()
```

The graphical interface will automatically open in your web browser.

---

# Main Features

## Microhaplotype Genotyping

* Direct genotyping from BAM files
* Supports paired-end (PE) and single-end (SE) sequencing data
* Read-level haplotype reconstruction
* CIGAR- and MD-tag-based variant parsing
* Quality filtering at both read and base levels

---

## DNA Mixture Analysis

* Microhaplotype calling for mixed DNA samples
* Allele count estimation
* Haplotype frequency estimation
* Mixture interpretation support

---

## Population Genetics

* Population haplotype frequency estimation
* Construction of frequency databases
* Population-level marker evaluation

---

## Forensic Statistics

Automatically calculates:

* Expected Heterozygosity (He)
* Effective Number of Alleles (Ae)
* Polymorphism Information Content (PIC)
* Discrimination Power (DP)
* Probability of Exclusion (PE)
* Shannon Information Index

---

## EuroForMix Integration

* Generation of EuroForMix-compatible frequency databases
* Generation of EuroForMix mixture input files
* Generation of reference individual profiles

---

## Interactive Shiny Interface

The built-in Shiny GUI supports:

* Data upload
* Parameter configuration
* Genotyping analysis
* Mixture analysis
* Result visualization
* Report export

---

# Main Functions

| Function                      | Description                              |
| ----------------------------- | ---------------------------------------- |
| MicrohapCalling               | Individual microhaplotype genotyping     |
| MixMicrohapCall               | Mixture microhaplotype analysis          |
| analyzeMicrohaplotypeResults  | Zygosity and ACR analysis                |
| computeForensicStatsDetailed  | Forensic statistical analysis            |
| popMicroHapFreq               | Population frequency estimation          |
| recalculateMHcallsByThreshold | Threshold optimization                   |
| toEuroForMixFreqData          | EuroForMix frequency database generation |
| toEuroforMixInput             | EuroForMix mixture input generation      |
| toIndReference                | Individual reference profile generation  |
| runHapVarFinder                  | Launch Shiny GUI                         |

---

# Documentation

A complete user manual is available in:

```text
HapVarFinder.pdf
```

The manual includes:

* Installation instructions
* Input file preparation
* Parameter descriptions
* Example datasets
* Function documentation
* Workflow tutorials
* EuroForMix integration examples

---

# License

GPL-3 License

---

# Contact

**Jiaming Xue**

Department of Forensic Biology
West China School of Basic Medical Sciences and Forensic Medicine
Sichuan University, Chengdu, China

Email: [xuejohn55@gmail.com](mailto:xuejohn55@gmail.com)

GitHub:
https://github.com/xjmin/HapVarFinder

---

# Acknowledgements

We thank all contributors and users of HapVarFinder for their support and feedback.

HapVarFinder is freely available for academic and research use.
