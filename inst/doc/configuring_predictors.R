## ------------------------------------------------------------------------
library(transformeR)
data("NCEP_Iberia_hus850", "NCEP_Iberia_psl", "NCEP_Iberia_ta850")

## ----fig.cap='The mean sea-level pressure field for the Iberian Peninsula. Type `help("<name_of_the_dataset>")` for further details.',fig.show='hold'----
plotClimatology(climatology(NCEP_Iberia_psl), backdrop.theme = "coastline",
                main = "Mean DJF SLP (1983-2002)")
plotClimatology(climatology(NCEP_Iberia_hus850), backdrop.theme = "coastline",
                main = "Mean DJF hus850 (1983-2002)")
plotClimatology(climatology(NCEP_Iberia_ta850), backdrop.theme = "coastline",
                main = "Mean DJF ta850 (1983-2002)")

## ------------------------------------------------------------------------
x <- makeMultiGrid(NCEP_Iberia_hus850, NCEP_Iberia_psl, NCEP_Iberia_ta850)

## ------------------------------------------------------------------------
data("VALUE_Iberia_tp")
y <- VALUE_Iberia_tp

## ----fig.cap='Precipitation observations used as predictand. Type `help("VALUE_Iberia_tp")` for further details.'----
plotClimatology(climatology(y), backdrop.theme = "countries", cex = 1.5,
                main = "Mean Winter daily precip (mm/day, 1983-2002")

## ------------------------------------------------------------------------
library(downscaleR)

## ------------------------------------------------------------------------
out <- prepare_predictors(x = x,
                          y = y,
                          subset.vars = NULL,
                          PCA = NULL,
                          local.predictors = NULL)
str(out)

## ----eval=FALSE----------------------------------------------------------
#  str(attributes(out))

## ------------------------------------------------------------------------
out <- prepare_predictors(x = x,
                          y = y,
                          PCA = list(n.eofs = 5, combined.PC = TRUE)
)

## ------------------------------------------------------------------------
str(out)

## ------------------------------------------------------------------------
getVarNames(x)

## ------------------------------------------------------------------------
out <- prepare_predictors(x = x,
                          y = y,
                          subset.vars = c("ta850", "psl"),
                          local.predictors = list(neigh.vars = "hus850",
                                                  n.neighs = 5,
                                                  neigh.fun = NULL)
)


## ------------------------------------------------------------------------
str(out)

## ------------------------------------------------------------------------
out <- prepare_predictors(x = x,
                          y = y,
                          subset.vars = c("ta850", "psl"),
                          local.predictors = list(neigh.vars = "hus850",
                                                  n.neighs = 5,
                                                  neigh.fun = list(FUN = "mean"))
)

## ------------------------------------------------------------------------
str(out)

## ------------------------------------------------------------------------
out <- prepare_predictors(x = x,
                          y = y,
                          subset.vars = c("ta850", "psl"),
                          PCA = list(v.exp = .975, combined.PC = TRUE),
                          local.predictors = list(neigh.vars = "hus850",
                                                  n.neighs = 5,
                                                  neigh.fun = NULL)
)

## ------------------------------------------------------------------------
str(out)

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 10))
