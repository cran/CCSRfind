# Helper function disc

#' Helper function to search for specific strings from multiple columns of data
#'
#' @param mydata Dataset containing ICD-10 codes
#' @param cols A vector of column names to bind in mydata
#' @param sts A regular expression string that the function will search for
#'
#' @return A vector indicating whether the string has been found
#' @export
#'
#' @examples
#'
#' # Example dataset
#' id<-c(1:10)
#' dx1<-c("A000","B0189","A501","H16233","A5443","E211","A1832","A401","A501","H65114")
#' dx2<-c("A157","E133591","A5611","H60311","H02219","A064","H11039","F481","H26102","B91")
#' dx3<-c("M9701XS","M9702XS","M9711XS","A500","B90","A1828","M9731XS","E212","M9741XS","B89")
#' mydata<-data.frame(id,dx1,dx2,dx3)
#'
#' cols<-c("dx1","dx2","dx3")
#' sts<-"A501|E133591"
#' disc(mydata=mydata, cols=cols, sts=sts)

disc<-function(mydata,cols,sts){

  ITR<-length(cols)
  vec<-numeric(nrow(mydata))

  for(i in 1:ITR){
    vec<-cbind(vec,as.numeric(grepl(sts,mydata[[cols[i]]],ignore.case=TRUE)))
  }

  vec<-vec[,-1]

  #colnames(vec)<-cols

  comb<-apply(vec,1,sum)

  comb<-as.numeric(comb>0)

  #out<-list(vec)

  return(comb)
}
