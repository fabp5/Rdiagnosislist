% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadSNOMED.R
\name{loadSNOMED}
\alias{loadSNOMED}
\title{Load SNOMED CT files from a folder(s) into R data.table objects}
\usage{
loadSNOMED(folders, active_only = TRUE, version = NULL)
}
\arguments{
\item{folders}{Vector of folder paths containing SNOMED CT files}

\item{active_only}{Whether to limit to current (active) SNOMED CT
concepts}

\item{version}{Version description. If NULL, it is derived from the
folder paths and expressed in the form: INT{date} & UK{date}}
}
\value{
An environment containing data.table objects: CONCEPT,
  DESCRIPTION, RELATIONSHIP, STATEDRELATIONSHIP, REFSET,
  SIMPLEMAP, EXTENDEDMAP
}
\description{
Identifies relevant SNOMED CT files from the 'Snapshot' of a 
distribution and loads them into an R environment. Files from
two folders (e.g. International and UK versions) can be loaded
together and appended.
}
\details{
These files are available from the NHS Digital Technology Reference
Update Distribution:
\url{https://isd.digital.nhs.uk/trud/user/guest/group/0/home}
}
\examples{
# Create a TEST environment and load the sample dictionaries
TEST <- sampleSNOMED()

# Export to temporary directory
exportSNOMEDenvir(TEST, tempdir())

# Try to import using the loadSNOMED function
TEST2 <- loadSNOMED(tempdir(), active_only = FALSE)

# Check that reimported SNOMED dictionary is the same as the original
all.equal(TEST$CONCEPT, TEST2$CONCEPT)
all.equal(TEST$DESCRIPTION, TEST2$DESCRIPTION)
all.equal(TEST$RELATIONSHIP, TEST2$RELATIONSHIP)
all.equal(TEST$STATEDRELATIONSHIP, TEST2$STATEDRELATIONSHIP)
all.equal(TEST$REFSET, TEST2$REFSET)
all.equal(TEST$SIMPLEMAP, TEST2$SIMPLEMAP)
all.equal(TEST$EXTENDEDMAP, TEST2$EXTENDEDMAP)
}
\seealso{
loadREADMAPS, CONCEPT, DESCRIPTION, RELATIONSHIP,
STATEDRELATIONSHIP, REFSET, SIMPLEMAP, EXTENDEDMAP,
sampleSNOMED, getSNOMED, exportSNOMEDenvir
}
