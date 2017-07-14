# load and assign data from subjects in "test" group.
	test_subjects <- read.table("./test/subject_test.txt")
	test_x <- read.table("./test/X_test.txt")
	test_y <- read.table("./test/y_test.txt")
	all_test <- cbind(test_subjects, test_x, test_y)

# load and assign data from subjects in "train" group.
	train_subjects <- read.table("./train/subject_train.txt")
	train_x <- read.table("./train/X_train.txt")
	train_y <- read.table("./train/y_train.txt")
	all_train <- cbind(train_subjects, train_x, train_y)

# combine test and train data
	all_data <- rbind(all_test, all_train)
	colnames(all_data) <- c("subject", 1:561, "activity")

# load descriptions for variables
	features <- read.table("features.txt")
	colnames(features) <- c("variable", "feature")

# Store only variables of interest
	desired_variables <- rbind(features[grep("mean|std",features$feature),], data.frame(variable = c("activity", "subject"), feature = c("activity", "subject")))

# Create data set with only variables of interest and assign column names
	clean_data <- all_data[, desired_variables$variable]
	colnames(clean_data) <- desired_variables$feature

# Assign names to each activity
	activities <- read.table("activity_labels.txt")
	colnames(activities) <- c("activity_ID", "activity_label")

# Construct final data set
	tidy_data <- aggregate(clean_data, by = list(clean_data$activity, clean_data$subject), FUN = mean, na.rm = TRUE)
	tidy_data$activity <- factor(tidy_data$activity, levels = activities$activity_ID, labels = activities$activity_label)

# Create tidy data set
	write.table(tidy_data, "tidy_data.txt", row.name = FALSE, sep = ",")
