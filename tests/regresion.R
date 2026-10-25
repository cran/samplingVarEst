## Pruebas de regresion de samplingVarEst.
## Se ejecutan con R CMD check (carpeta tests/). No requieren paquetes adicionales.
## Cada bloque compara una funcion del paquete con la formula documentada en el
## manual, calculada en R puro (bucles explicitos), o comprueba una propiedad
## que debe cumplirse (invariancia al orden de las filas).

library(samplingVarEst)
data(oaxaca)
eq <- function(a, b, tol = 1e-10) isTRUE(all.equal(a, b, tolerance = tol))

## ----- muestra de una etapa (ejemplo del manual) ----------------------------
pik.U <- Pk.PropNorm.U(373, oaxaca$HOMES00)
s     <- oaxaca$sHOMES00
N     <- nrow(oaxaca)
y     <- oaxaca$POP10[s == 1]
x     <- oaxaca$HOMES10[s == 1]
p     <- pik.U[s == 1]
n     <- length(y)
w     <- 1 / p
M     <- Pkl.Hajek.s(p)
R     <- sum(w * y) / sum(w * x)
R_k   <- sapply(seq_len(n), function(k) sum(w[-k] * y[-k]) / sum(w[-k] * x[-k]))

## 1. Tukey: (1 - n/N) (n-1)/n sum (R_(k) - R)^2        [error en 1.5: factor n+1]
stopifnot(eq(VE.Jk.Tukey.Ratio(y, x, p, N),              (1 - n/N) * (n - 1)/n * sum((R_k - R)^2)))
stopifnot(eq(VE.Jk.Tukey.Ratio(y, x, p, N, FPC = FALSE),             (n - 1)/n * sum((R_k - R)^2)))

## 2. Linealizacion: sum_k sum_l (pi_kl - pi_k pi_l)/pi_kl (w_k u_k)(w_l u_l)   [error en 1.5: sin w]
u    <- w * (y - R * x) / sum(w * x)
Dkl  <- 1 - outer(p, p) / M
stopifnot(eq(VE.Lin.HT.Ratio(y, x, p, M),  sum(Dkl * outer(u, u))))
ut   <- upper.tri(M)
stopifnot(eq(VE.Lin.SYG.Ratio(y, x, p, M), sum((outer(p, p)/M - 1)[ut] * outer(u, u, "-")[ut]^2)))

## 3. Los estimadores de una etapa no dependen del orden de las filas.
##    Tolerancia 1e-8: theta - theta_(k) se obtiene restando dos numeros casi
##    iguales y el redondeo (que si depende del orden de suma) se amplifica.
set.seed(1); o <- sample(n)
for (f in list(VE.Jk.Tukey.Ratio, VE.Jk.Tukey.Corr.Hajek, VE.Jk.Tukey.Corr.NHT))
  stopifnot(eq(f(y, x, p, N), f(y[o], x[o], p[o], N), tol = 1e-8))
for (f in list(VE.Jk.B.Ratio, VE.Jk.B.Corr.Hajek, VE.Jk.B.RegCo.Hajek, VE.Jk.B.RegCoI.Hajek))
  stopifnot(eq(f(y, x, p), f(y[o], x[o], p[o]), tol = 1e-8))
for (f in list(VE.Jk.CBS.HT.Ratio, VE.Jk.CBS.SYG.Ratio, VE.EB.HT.Ratio, VE.EB.SYG.Ratio, VE.Lin.HT.Ratio, VE.Lin.SYG.Ratio))
  stopifnot(eq(f(y, x, p, M), f(y[o], x[o], p[o], M[o, o]), tol = 1e-8))

## ----- muestra autoponderada de dos etapas (ejemplo del manual) --------------
s2      <- oaxaca$sSW_10_3
SD      <- oaxaca[s2 == 1, ]
nII     <- 3
lab     <- SD$IDDISTRI
Msz     <- SD$SIZEDIST
piI     <- 10 * Msz / 570
pk      <- piI * (nII / Msz)
y2      <- SD$POP10; x2 <- SD$HOMES10

## 4. SW2 razon: formula del manual en R puro       [error en 1.5: rowsum reordenaba los grupos]
sw2_ref <- function(y, x, p, nII, piI, lab, Msz) {
  w <- 1/p; R <- sum(w*y)/sum(w*x); n <- length(y)
  labs <- unique(lab); nI <- length(labs)
  R_i  <- sapply(labs, function(l) { k <- lab != l; sum(w[k]*y[k])/sum(w[k]*x[k]) })
  piI.i <- piI[match(labs, lab)]; M.i <- Msz[match(labs, lab)]
  piStar <- piI.i * nII * (M.i - 1) / ((nII - 1) * M.i)
  vs   <- (nI - 1)/nI * (R - R_i); d <- sum(1 - piI.i)
  vclu <- sum((1 - piStar) * vs^2) - sum((1 - piI.i) * vs)^2 / d
  R_k  <- sapply(seq_len(n), function(k) sum(w[-k]*y[-k])/sum(w[-k]*x[-k]))
  eps  <- (n - 1)/n * (R - R_k)
  phi  <- (piStar * (M.i - nII) / (M.i - 1))[match(lab, labs)]
  vclu + sum(phi * eps^2)
}
stopifnot(eq(VE.Jk.EB.SW2.Ratio(y2, x2, pk, nII, piI, lab, Msz), sw2_ref(y2, x2, pk, nII, piI, lab, Msz)))

## 5. SW2: invariancia al orden de las filas (todas las variantes)
set.seed(2); o2 <- sample(length(y2))
for (f in list(VE.Jk.EB.SW2.Ratio, VE.Jk.EB.SW2.Corr.Hajek, VE.Jk.EB.SW2.RegCo.Hajek, VE.Jk.EB.SW2.RegCoI.Hajek))
  stopifnot(eq(f(y2, x2, pk, nII, piI, lab, Msz), f(y2[o2], x2[o2], pk[o2], nII, piI[o2], lab[o2], Msz[o2]), tol = 1e-8))
stopifnot(eq(VE.Jk.EB.SW2.Mean.Hajek(y2, pk, nII, piI, lab, Msz),
             VE.Jk.EB.SW2.Mean.Hajek(y2[o2], pk[o2], nII, piI[o2], lab[o2], Msz[o2]), tol = 1e-8))

## ----- validaciones -----------------------------------------------------------
## 6. La funcion de distribucion empirica acepta t no entero
stopifnot(eq(Est.EmpDistFunc.Hajek(c(1, 2, 3, 4), rep(0.5, 4), 2.5), 0.5))
stopifnot(eq(Est.EmpDistFunc.NHT(c(1, 2, 3, 4), rep(0.5, 4), 8, 2.5), 0.5))

## 7. Pk.PropNorm.U rechaza n mayor que el numero de unidades con MOS positiva
stopifnot(inherits(tryCatch(suppressWarnings(Pk.PropNorm.U(3, c(100, 0, 0))), error = function(e) e), "error"))
stopifnot(eq(sum(Pk.PropNorm.U(373, oaxaca$HOMES00)), 373))

cat("Pruebas de regresion: OK\n")
