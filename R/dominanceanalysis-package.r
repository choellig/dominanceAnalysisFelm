#' The dominanceanalysis package allows to perform the dominance analysis for multiple regression models, such as OLS (univariate and multivariate), GLM and HLM.
#' The dominance analysis on this package is performed by \code{\link{dominanceAnalysis}}
#' function. To perform bootstrap procedures you should use \code{\link{bootDominanceAnalysis}}
#' function. For both, standard \code{print} and \code{summary} functions are provided.
#'
#' @section Main Features:
#' \itemize{
#' \item Provides complete, conditional and general dominance analysis for lm (univariate and multivariate) felm (univariate and multivariate), lmer and glm (family=binomial) models.
#' \item Covariance / correlation matrixes could be used as input for OLS dominance analysis, using \code{\link{lmWithCov}} and \code{\link{mlmWithCov}} methods, respectively.
#' \item Multiple criteria can be used as fit indices, which is useful especially for HLM.
#' }
#'
#' @section About Dominance Analysis:
#' Dominance analysis is a method developed to evaluate the importance of each predictor
#' in the selected regression model: "one predictor is 'more important than another'
#' if it contributes more to the prediction of the criterion than does its competitor
#' at a given level of analysis." (Azen & Budescu, 2003, p.133).
#'
#' The original method was developed for OLS regression (Budescu, 1993).
#' Later, several definitions of dominance and bootstrap procedures
#' were provided by Azen & Budescu (2003), as well as adaptations
#' to Generalized Linear Models (Azen & Traxel, 2009)
#' and Hierarchical Linear Models (Luo & Azen, 2013).
#'
#' @name dominanceanalysis-package
#' @aliases dominanceanalysis
#' @docType package
#' @title Dominance analysis for general, generalized and mixed linear models
#' @author Claudio Bustos \email{clbustos_at_gmail_com}, Filipa Coutinho Soares (documentation)
#' @seealso \code{\link{dominanceAnalysis}} , \code{\link{bootDominanceAnalysis}}
#' @references
#' \itemize{
#' \item Budescu, D. V. (1993). Dominance analysis: A new approach to the problem of relative importance of predictors in multiple regression. Psychological Bulletin, 114(3), 542-551. doi:10.1037/0033-2909.114.3.542
#' \item Azen, R., & Budescu, D. V. (2003). The dominance analysis approach for comparing predictors in multiple regression. Psychological Methods, 8(2), 129-148. doi:10.1037/1082-989X.8.2.129
#' \item Azen, R., & Budescu, D. V. (2006). Comparing Predictors in Multivariate Regression Models: An Extension of Dominance Analysis. Journal of Educational and Behavioral Statistics, 31(2), 157-180. doi:10.3102/10769986031002157
#' \item Azen, R., & Traxel, N. (2009). Using Dominance Analysis to Determine Predictor Importance in Logistic Regression. Journal of Educational and Behavioral Statistics, 34(3), 319-347. doi:10.3102/1076998609332754
#' \item Luo, W., & Azen, R. (2013). Determining Predictor Importance in Hierarchical Linear Models Using Dominance Analysis. Journal of Educational and Behavioral Statistics, 38(1), 3-31. doi:10.3102/1076998612458319
#' }
#' @examples
#' # Basic dominance analysis
#'
#' data(longley)
#' lm.1<-lm(Employed~.,longley)
#' da<-dominanceAnalysis(lm.1)
#' print(da)
#' summary(da)
#' plot(da,which.graph='complete')
#' plot(da,which.graph='conditional')
#' plot(da,which.graph='general')
#'
#' # Basic dominance analysis (with felm)
#'
#' data(longley)
#' felm.1<-felm(Employed~.,longley)
#' da<-dominanceAnalysis(felm.1)
#' print(da)
#' summary(da)
#' plot(da,which.graph='complete')
#' plot(da,which.graph='conditional')
#' plot(da,which.graph='general')
#'
#' # Dominance analysis for HLM
#'
#' library(lme4)
#' x1<-rnorm(1000)
#' x2<-rnorm(1000)
#' g<-gl(10,100)
#' g.x<-rnorm(10)[g]
#' y<-2*x1+x2+g.x+rnorm(1000,sd=0.5)
#' lmm1<-lmer(y~x1+x2+(1|g))
#' lmm0<-lmer(y~(1|g))
#' da.lmm<-dominanceAnalysis(lmm1, null.model=lmm0)
#' print(da.lmm)
#' summary(da.lmm)
#'
#'
#' # GLM analysis
#'
#' x1<-rnorm(1000)
#' x2<-rnorm(1000)
#' x3<-rnorm(1000)
#' y<-runif(1000)<(1/(1+exp(-(2*x1+x2+1.5*x3))))
#' glm.1<-glm(y~x1+x2+x3,family="binomial")
#' da.glm<-dominanceAnalysis(glm.1)
#' print(da.glm)
#' summary(da.glm)
#'
#' # Bootstrap procedure
#'
#' \donttest{
#' da.boot<-bootDominanceAnalysis(lm.1,R=1000)
#' summary(da.boot)
#'
#' da.glm.boot<-bootDominanceAnalysis(glm.1,R=200)
#' summary(da.glm.boot)
#' }

NULL
