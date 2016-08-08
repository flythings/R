#' getObservations
#' @description Return a list which contains the value, timestampt and the id of every obsevations between dates.
#' @param seriesId: A long value which represents the series to download.
#' @param startDate: A numeric value.
#' @param endDate: A numeric value.
#' @return The observations of the selected period.
#' @examples
#' addObservations("foo@foo.com", "foo")
#' @export
getObservations <- function(seriesId, startDate, endDate){
  print(seriesId)
  body <- '{"series":"","startDate":"","endDate":""}'
  body <- fromJSON(body)
  body$series <- data.frame(id = seriesId)
  body$startDate <- startDate
  body$endDate <- endDate
  body <- toJSON(body, auto_unbox=TRUE, pretty=TRUE)
  response <- POST("http://firefly.itg.es/firefly/observation/", body = body, add_headers("Content-Type" = "application/json", "X-AUTH-TOKEN" = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkZW50aWZpZXIiOiJvbGF6bm9nMTBAZ21haWwuY29tIiwidHlwZSI6IndlYl91c2VyIiwiZGF0ZSI6MTQ1ODM3NjcxMDI2NH0.rLBADwVXJFrDwQTOXittkgT7LYX7R7-TBMVleMFNMaM", "workspace" = "151"), encode = "json")
  responseBody <- fromJSON(minify(content(response, "text", encoding = "UTF-8")))
  return(responseBody$data)
}

#' addObservations
#' @description Return a list which contains the value, timestampt and the id of every obsevations between dates.
#' @param seriesId: A long value which represents the series to download.
#' @param observations: A numeric value.
#' @return The observations of the selected period.
#' @examples
#' addObservations("foo@foo.com", "foo")
#' @export
addObservations <- function(seriesId, observations){
  body <- '{"series":"","startDate":"","endDate":""}'
  body <- fromJSON(body)
  body$series <- data.frame(id= seriesId)
  body$startDate <- startDate
  body$endDate <- endDate
  body <- toJSON(body, auto_unbox=TRUE, pretty=TRUE)
  response <- POST("http://firefly.itg.es/firefly/observation/", body = body, add_headers("Content-Type" = "application/json", "X-AUTH-TOKEN" = "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkZW50aWZpZXIiOiJvbGF6bm9nMTBAZ21haWwuY29tIiwidHlwZSI6IndlYl91c2VyIiwiZGF0ZSI6MTQ1ODM3NjcxMDI2NH0.rLBADwVXJFrDwQTOXittkgT7LYX7R7-TBMVleMFNMaM", "workspace" = "151"), encode = "json")
  responseBody <- fromJSON(content(response, "text", encoding = "UTF-8"))
  return(responseBody$data)
}

#' login
#' @description login to the flythings platform
#' @param userId: A numeric value.
#' @param password: A numeric value.
#' @return The square of the input.
#' @examples
#' login("foo@foo.com", "foo")
#' @export
login <- function(userId, password){
  response <- GET("http://firefly.itg.es/firefly/login/",authenticate(userId,password))
  return(response)
}
