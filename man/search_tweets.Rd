% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fs.R
\name{search_tweets}
\alias{search_tweets}
\title{perform full text search on tweets collected with epitweetr}
\usage{
search_tweets(
  query = NULL,
  topic = NULL,
  from = NULL,
  to = NULL,
  countries = NULL,
  mentioning = NULL,
  users = NULL,
  hide_users = FALSE,
  action = NULL,
  max = 100,
  by_relevance = FALSE
)
}
\arguments{
\item{query}{character. The query to be used if a text it will match the tweet text. To see how to match particular fields please see details, default:NULL}

\item{topic}{character, Vector of topics to include on the search default:NULL}

\item{from}{an object which can be converted to ‘"POSIXlt"’ only tweets posted after or on this date will be included, default:NULL}

\item{to}{an object which can be converted to ‘"POSIXlt"’ only tweets posted before or on this date will be included, default:NULL}

\item{countries}{character or numeric, the position or name of epitweetr regions to be included on the query, default:NULL}

\item{mentioning}{character, limit the search to the tweets mentioning the given users, default:NULL}

\item{users}{character, limit the search to the tweets created by the provided users, default:NULL}

\item{hide_users}{logical, whether to hide user names on output replacing them by the USER keyword, default:FALSE}

\item{action}{character, an action to be performed on the search results respecting the max parameter. Possible values are 'delete' or 'anonymise' , default:NULL}

\item{max}{integer, maximum number of tweets to be included on the search, default:100}

\item{by_relevance}{logical, whether to sort the results by relevance of the matching query or by indexing order, default:FALSE
If not provided the system will try to reuse the existing one from last session call of \code{\link{setup_config}} or use the EPI_HOME environment variable, default: NA}
}
\value{
a data frame containing the tweets matching the selected filters, the data frame contains the following columns: linked_user_location, linked_user_name, linked_user_description, 
screen_name, created_date, is_geo_located, user_location_loc, is_retweet, text, text_loc, user_id, hash, user_description, linked_lang, linked_screen_name, user_location, totalCount, 
created_at, topic_tweet_id, topic, lang, user_name, linked_text, tweet_id, linked_text_loc, hashtags, user_description_loc
}
\description{
perform full text search on tweets collected with epitweetr (tweets migrated from epitweetr v<1.0.x are also included)
}
\details{
epitweetr translate the query provided by all parameters into a single query that will be executed on tweet indexes which are weekly indexes.
The q parameter should respect the syntax of the Lucene classic parser \url{https://lucene.apache.org/core/8_5_0/queryparser/org/apache/lucene/queryparser/classic/QueryParser.html} 
So other than the provided parameters, multi field queries are supported by using the syntax field_name:value1;value2 
AND, OR and -(for excluding terms) are supported on q parameter.
Order by week is always applied before relevance so even if you provide by_relevance = TRUE all of the matching tweets of the first week will be returned first
}
\examples{
if(FALSE){
   #Running the detect loop
   library(epitweetr)
   message('Please choose the epitweetr data directory')
   setup_config(file.choose())
   df <- search_tweets(
        q = "vaccination", 
        topic="COVID-19", 
        countries=c("Chile", "Australia", "France"), 
        from = Sys.Date(), 
        to = Sys.Date()
   )
   df$text
}
}
\seealso{
\code{\link{search_loop}}
 
 \code{\link{detect_loop}}
}
