context("metadata validity")

test_that("metadata is valid",
{
    metadata <- system.file("extdata", "metadata.csv", package = "AllenBrainReference")
    expect_true(testExperimentHubMetadata("AllenBrainReference", metadata))
})
