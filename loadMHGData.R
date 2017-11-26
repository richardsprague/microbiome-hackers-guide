# loadMHGData.R: Initialize and load all objects, functions, or variables required for the MHG book
# 


library(actino)
library(phyloseq)
library(ggplot2)
library(tidyr)
library(dplyr)
library(knitr)
library(stringr)
options(scipen = 999)

DATA_DIR <- Sys.getenv("UBIOME_DATADIR")
USERNAME <- "ub_data-Richard_Sprague"
DATAPATH <- paste(DATA_DIR, "/ubiome_people/", USERNAME, sep="")
# load convenience functions 'path_to_user' and 'phyloseq_for_user'
source(paste0(DATA_DIR,"/dataReadFunctions.R"))

load(paste0(DATAPATH,"/derived/spragueAllRanks.RData"))
load(paste0(DATA_DIR,"/ubiome_people/peopleAll.RData"))

gut.all <- subset_samples(sprague.genus.norm, Site == "gut" )
gut.norm <- prune_taxa(taxa_sums(gut.all)>42,subset_samples(gut.all,  Reads >10000)) # only use high-quality gut samples
phylum.gut <- subset_samples(sprague.phylum.norm, Site == "gut" & Reads > 10000)

sample_data(sprague.order.norm)$Reads <- sample_data(sprague.phylum.norm)$Reads
order.gut <- subset_samples(sprague.order.norm, Site == "gut" & Reads > 10000)
family.gut <- subset_samples(sprague.family.norm, Site == "gut" & Reads > 10000)



# remove duplicates from gut.norm
dates.dup <- sample_data(gut.norm)$Date[duplicated(sample_data(gut.norm)$Date)]
dupes <- subset_samples(gut.norm, Date %in% dates.dup)
ssr.dup <- sample_data(dupes)$SSR

gut.norm.nodupes <- subset_samples(gut.norm, !SSR %in% ssr.dup[seq(1,length(ssr.dup), by=2)])
phylum.gut.nodupes <- subset_samples(phylum.gut, !SSR %in% ssr.dup[seq(1,length(ssr.dup), by=2)])
order.gut.nodupes <- subset_samples(order.gut, !SSR %in% ssr.dup[seq(1,length(ssr.dup), by=2)])
family.gut.nodupes <- subset_samples(family.gut, !SSR %in% ssr.dup[seq(1,length(ssr.dup), by=2)])

MHG_TOP_DIRECTORY <- getwd() # remember the location of the top directory
# returns the URL for assetName, usually an image file
mhg_asset <- function (assetName) {
  paste0(MHG_TOP_DIRECTORY,"/assets/",assetName)
}