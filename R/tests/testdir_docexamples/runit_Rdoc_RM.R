setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source('../findNSourceUtils.R')

test.rdocRM.golden <- function(H2Oserver) {

prosPath = system.file("extdata", "prostate.csv", package="h2o")	
prostate.hex = h2o.importFile(H2Oserver, path = prosPath, key = "prostate.hex")
s = runif(nrow(prostate.hex))
prostate.train = prostate.hex[s <= 0.8,]
prostate.train = h2o.assign(prostate.train, "prostate.train")
h2o.ls(H2Oserver)
h2o.rm(object= H2Oserver, keys= "Last.value.0")
h2o.ls(H2Oserver)
h2o.rm(object= H2Oserver, keys= "prostate.hex")
remove(prostate.hex)
h2o.ls(H2Oserver)

testEnd()
}

doTest("R Doc RM", test.rdocRM.golden)

