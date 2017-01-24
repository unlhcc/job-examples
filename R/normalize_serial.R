# read in the otu_matrix.csv file
otu_matrix <- read.table("otu_matrix.csv",
                         sep=",",
                         header=TRUE)

otu_matrix <- cbind(otu_matrix, otu_matrix, otu_matrix, otu_matrix)
otu_matrix <- rbind(otu_matrix, otu_matrix, otu_matrix, otu_matrix)

# replace any missing values with 0.1
otu_matrix[is.na(otu_matrix)] <- 0.1

# normalize the matrix using standard normal
otu_matrix <- scale(otu_matrix)

# convert all values to the absolute value
otu_matrix <- apply(otu_matrix, c(1,2), abs)

# transform values using Log2
otu_matrix <- apply(otu_matrix, c(1,2), log2)

# write the normalized matrix to normalized_otu_matrix.csv
write.table(otu_matrix,
            "normalized_otu_matrix.csv",
            sep=",",
            row.names=TRUE,
            col.names=TRUE)


