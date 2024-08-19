## Main Function


#' Identify CCSR codes corresponding to ICD-10 codes
#'
#' @param workset Dataset with ICD-10 codes
#' @param dxs List of column name(s) of ICD-10 codes within workset
#' @param example indicator if running an example, default is FALSE
#'
#' @return A list of CCSR codes corresponding to the ICD-10 codes
#' @export
#'
#' @examples
#'
#' # Example dataset
#' id<-c(1:2)
#' dx1<-c("A000","B0189")
#' dx2<-c("A157","E133591")
#' workset<-data.frame(id,dx1,dx2)
#'
#' dxs<-c("dx1","dx2")
#'
#' # Convert to CCSR codes
#' CCSRfind(workset=workset,dxs=dxs,example=TRUE)

CCSRfind<-function(workset,dxs, example=FALSE){

  XX<-nrow(Legend)
  YY<-nrow(LegendExtend)

  if(example==TRUE){
    XX<-5
    YY<-2
  }

  if(length(dxs==1)){
  dxs<-c(dxs,dxs)
  }

  ##For short codes classification
  for(i in 1:XX){
    codecol<-DXCCSR$ICD10[DXCCSR$CCSRCat==Legend$CCSRCat[i]]

    if(length(codecol)<=1000){

      hh<-knitr::combine_words(codecol,sep="|",and="")

      workset[[Legend$CCSRCat[i]]]<-disc(workset,dxs,hh)

      Legend[["Proportion"]][i]<-sum(workset[[Legend$CCSRCat[i]]])/nrow(workset)
      #print(i)
      #print(Legend[["Proportion"]][i])
    }

  }

  ##For long codes classification
  for(i in 1:YY){

    resvec<-numeric(nrow(workset))

    codecol<-DXCCSR$ICD10[DXCCSR$CCSRCat==LegendExtend$CCSRCat[i]]

    JJ<-floor(length(codecol)/1000)

    for(j in 1:(JJ+1)){

      if(j<(JJ+1)){
        codecolJ<-codecol[c(1:1000)]
        codecol<-codecol[-c(1:1000)]
      }

      if(j==(JJ+1)){
        codecolJ<-codecol
      }

      hh<-knitr::combine_words(codecolJ,sep="|",and="")

      resvec<-cbind(resvec,disc(workset,dxs,hh))

      #print(c(j,JJ))

    }
    workset[[LegendExtend$CCSRCat[i]]]<-apply(resvec,1,max)

    LegendExtend[["Proportion"]][i]<-sum(workset[[LegendExtend$CCSRCat[i]]])/nrow(workset)
  }

  LegendFin<-rbind(Legend[Legend$codecolvec<=1000,],LegendExtend)

  LegendFin<-LegendFin[LegendFin$Proportion>0,]

  if(example==TRUE){
    LegendFin<-NULL
  }


  return(list(workset,LegendFin))

}

# Suppress R CMD check note about the global variable
utils::globalVariables("DXCCSR")

