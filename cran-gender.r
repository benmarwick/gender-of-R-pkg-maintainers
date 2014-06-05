require("tools")
require("gender")
require("Hmisc")
require("stringr")
require("ggplot2")
library("lubridate")

# Thanks Dirk: http://stackoverflow.com/a/11561793/1036500
getPackagesWithTitle <- function() {
  contrib.url(getOption("repos")["CRAN"], "source") 
  description <- sprintf("%s/web/packages/packages.rds",  getOption("repos")["CRAN"])
  con <- if(substring(description, 1L, 7L) == "file://") {
    file(description, "rb")
  } else {
    url(description, "rb")
  }
  on.exit(close(con))
  db <- readRDS(gzcon(con))
  rownames(db) <- NULL
  return(db)
}

db <- getPackagesWithTitle()

db_df <- data.frame(db)
maintainter_year <- data.frame(name = unname(db_df$Maintainer),
                               year = as.integer(substr(unname(db_df$Published), 1, 4)))
clean_up <- function(x){
  # get rid of punctuation
  x1 <- gsub("[[:punct:]]", " ", x)
  # remove leading space before first name
  x2 <- str_trim(x1 , side="left") 
  # get first name only
  x3 <- unlist(lapply(x2, first.word))
  # gender function only takes lower case
  x4 <- tolower(x3)
  return(x4)
}
# apply function to data
maintainter_year$name <- clean_up(maintainter_year$name)

# compute gender of package maintainers
cran_genders <- gender(maintainter_year)
# remove NA (where we can't be sure of the gender because
# we've only got a first initial, or similar)
cran_genders <- cran_genders[!is.na(cran_genders$gender),]

# overall ratio
all <- nrow(cran_genders)
props <- data.frame(female_prop = sum(cran_genders$gender == "female")/all,
                    male_prop = sum(cran_genders$gender == "male")/all)
ggplot(cran_genders, aes(gender)) +
  geom_bar() +
  theme_minimal(base_size = 14)

# change over time
cran_genders$year <- strptime(cran_genders$year, format = "%Y")
cran_genders$year  <- as.Date(cran_genders$year, "%Y", origin = "1900")

# plot with smoother
ggplot(cran_genders, aes(year, fill = gender)) +
  geom_bar() +
  theme_minimal() 

ggplot(cran_genders, aes(year, fill = gender)) +
  geom_bar(position = "fill", aes(y=..count../sum(..count..))) +
  theme_minimal() 


unique(cran_genders$year)

cran_genders %>%
  group_by(year) %>%
  select(year, gender) %>%
  summarise(
    ml = sum(gender == "male")/length(gender),
    fl = sum(gender == "female")/length(gender)
  )


