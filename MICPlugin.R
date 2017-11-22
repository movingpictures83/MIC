library("minerva");
p_value <- 0.01;
libs <- c("Hmisc");
lapply(libs, require, character.only=T);

input <- function(inputfile) {
  pc <<- read.csv(inputfile, header = TRUE);
}



run <- function() {
  cn <<- colnames(pc);
  cn <<- cn[2:length(cn)];
  pc <<- pc[,-1];
  pc <<- apply(pc, 1, as.numeric);
  pc <<- t(pc);
  # Handles rows with all zero, sets to small values
  for (j in 1:ncol(pc)) {
    allzero = 1;
    for (i in 1:nrow(pc)) {
       if (pc[i,j] > 0) {
          allzero = 0;
       }
    }
    if (allzero == 1) {
       for (i in 1:nrow(pc)) {
          pc[i, j] <<- i*(1e-5);
       }  
    }
  }
  
  correlations <- matrix(, nrow=ncol(pc), ncol=ncol(pc));
  for (i in 1:ncol(pc)) {
     for (j in 1:ncol(pc)) {
        if (i != j) {
           mine.r = mine(x=pc[,i], y=pc[,j], var.thr=1e-13)
           correlations[i, j] = mine.r$MIC
        }
        else {
           correlations[i, j] = 1
        }
     }
  }
  pc <<- correlations;
  pc[is.na(pc)] <<- 0;
  empty <- c("");
}

output <- function(outputfile) {
   write.table(pc, file=outputfile, sep=",", append=FALSE, row.names=unlist(cn), col.names=unlist(cn), na="");
}


