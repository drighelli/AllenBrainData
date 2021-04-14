#' AllenBrainData
#'
#' @param dataset the identifier of the Allen brain dataset to retrieve
#'
#' @return
#' @importFrom HDF5Array loadHDF5SummarizedExperiment
#' @export
#'
#' @examples
#' se <- AllenBrainData("Allen_Human_2019")
#' se
#'
AllenBrainData <- function(dataset=c("Allen_Mouse_2020", "Allen_Mouse_2019",
                                "Allen_Human_2020", "Allen_Human_2019"))
{
    dataset <- match.arg(dataset)
    hub <- ExperimentHub()
    version <- "v1.0.0"
    base <- paste0("AllenBrainData/", version, "/")

    switch(dataset,
           "Allen_Mouse_2020"={
                ds <- "Allen_mm_20"
           },
           "Allen_Mouse_2019"= {
                ds <- "Allen_mm_19"
           },
           "Allen_Human_2020"={
                ds <- "Allen_hg_20"
           },
           "Allen_Human_2019"={
                ds <- "Allen_hg_19"
           }
    )
    rdatapath <- paste0(base, ds, "assays.h5")
    h5 <- query(hub, rdatapath)[[1]]
    rdatapath <- paste0(base, ds, "se.rds")
    se <- query(hub, rdatapath)[[1]]
    seH5Array <- loadHDF5SummarizedExperiment(se, "counts")

    return(seH5Array)
}
