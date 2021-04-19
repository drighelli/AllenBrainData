# A script to make the metadata.csv file located in inst/extdata of the package.
# See ?AnnotationHubData::makeAnnotationHubMetadata for a description of the
# metadata.csv file, expected fields and data types. This
# AnnotationHubData::makeAnnotationHubMetadata() function can be used to
# validate the metadata.csv file before submitting the package.


main.data <- data.frame(
    Title = c(
        "Brain Mouse 2020 assay",
        "Brain Mouse 2020 SummarizedExperiment",
        "Brain Mouse 2019 assay",
        "Brain Mouse 2019 SummarizedExperiment",
        "Brain Human 2020 assay",
        "Brain Human 2020 SummarizedExperiment",
        "Brain Human 2019 assay",
        "Brain Human 2019 SummarizedExperiment"
    ),
    Description =
        c(rep("Single-cell RNA-seq data for mouse brain annotation 2020", 2),
          rep("Single-cell RNA-seq data for mouse brain annotation 2019", 2),
          rep("Single-cell RNA-seq data for human brain annotation 2020", 2),
          rep("Single-cell RNA-seq data for human brain annotation 2019", 2)),
    RDataPath = as.vector(t(outer(
        paste0("AllenBrainData/v1.0.0/",
            c("Allen_Mouse_Brain_2020/Allen_mm_20",
                "Allen_Mouse_Brain_2019/Allen_mm_19",
                "Allen_Human_Brain_2020/Allen_hg_20",
                "Allen_Human_Brain_2019/Allen_hg_19")),
            c("assays.h5", "se.rds"), FUN=paste0) )),
    BiocVersion="3.13",
    Genome=c(rep("mm10", 4), rep("GRCh38", 4)),
    SourceType="CSV",
    SourceUrl=rep(paste0("https://portal.brain-map.org/atlases-and-data/rnaseq",
                            c("mouse-whole-cortex-and-hippocampus-10x",
                            "mouse-whole-cortex-and-hippocampus-smart-seq",
                            "human-m1-10x",
                            "human-multiple-cortical-areas-smart-seq"))
                         , each = 2),
    SourceVersion="1.0.0",
    Species=rep(c("Mus musculus", "Homo sapiens"), each=4),
    TaxonomyId=rep(c("10090","9606"), each=4),
    Coordinate_1_based=TRUE,
    DataProvider="Allen Institue for Brain Science",
    Maintainer="Dario Righelli <dario.righelli@gmail.com>",
    RDataClass=c("HDF5Array", "SummarizedExperiment"),
    DispatchClass=c("H5File", "Rds")
)

write.csv(file="inst/extdata/metadata.csv", main.data, row.names=FALSE)
