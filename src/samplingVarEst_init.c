#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

#include <math.h> // just in case

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .C calls */
extern void Est_Corr_Hajek(double *VecY_s, double *VecX_s, double *VecPk_s, int *n, double *EstCorr);
extern void Est_Corr_Hajek_Excluding_All_Elements(double*VecY_s, double*VecX_s, double *VecPk_s, int *n, double *VecEstCorr_k);
extern void Est_Corr_NHT(double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*DoubleN, double*EstCorr);
extern void Est_Corr_NHT_Excluding_All_Elements( double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*DoubleN, double*VecEstCorr_k);
extern void Est_EmpDistFunc_Hajek(double*VecY_s, double*VecPk_s, int *n, double*t, double*EstEmpDistFunc);
extern void Est_EmpDistFunc_NHT(double*VecY_s, double*VecPk_s, int *n, double*N, double*t, double*EstEmpDistFunc);
extern void Est_Mean_Hajek(double*VecY_s, double*VecPk_s, int *n, double*EstMean);
extern void Est_Ratio(double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*EstRatioYX);
extern void Est_Ratio_Excluding_All_Elements(double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*VecEstRatioYX_k);
extern void Est_Ratio_Excluding_All_ElementsByRho(double*VecY_s, double*VecX_s, double*VecPk_s, double*VecRhok_s, int *n, double*VecEstRatioYX_k);
extern void Est_RegCo_Hajek(double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*EstRegCo);
extern void Est_RegCo_Hajek_Excluding_All_Elements(double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*VecEstRegCo_k);
extern void Est_RegCoI_Hajek(double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*EstRegCoI);
extern void Est_RegCoI_Hajek_Excluding_All_Elements(double*VecY_s, double*VecX_s, double*VecPk_s, int *n, double*VecEstRegCoI_k);
extern void Est_Total_NHT(double*VecY_s, double*VecPk_s, int *n, double*EstTotal);
extern void Pk_PropNorm_U(int*n, int*N, int*VecInd_U, double*VecMOS_U, double*VecPk_U);
extern void Pkl_Hajek_s(double*VecPk_s, int *n, double*VecMatPkl_s);
extern void Pkl_Hajek_U(double*VecPk_U, int *N, double*VecMatPkl_U);
extern void VE_Hajek_form(double*VecPseudo_s, double*VecPk_s, int *n, double*Doublen, double*EstVarEst);
extern void VE_Hajek_Total_NHT(double*VecY_s, double*VecPk_s, int *n, double*Doublen, double*EstVarEst_ty);
extern void VE_HT_form(double*VecPseudo_s, double*VecPk_s, double*VecMatPkl_s, int *n, double*EstVarEst);
extern void VE_HT_Total_NHT(double*VecY_s, double*VecPk_s, double*VecMatPkl_s, int *n, double*EstVarEst_ty);
extern void VE_Jk_EB_SW2_Corr_Hajek_Clu(double*EstTheta, double*VecY_s, double*VecX_s, double*VecPk_s, int *n, int *nI, double*Doub_nI, int *VectCLb_s, int *VectCLb_sI, double*VectQIi_sI, double*VectQIiSTAR_sI, double*Est_d, double*VarianceClusters);
extern void VE_Jk_EB_SW2_Ratio_Clu(double*EstTheta, double*VecY_s, double*VecX_s, double*VecPk_s, int *n, int *nI, double*Doub_nI, int *VectCLb_s, int *VectCLb_sI, double*VectQIi_sI, double*VectQIiSTAR_sI, double*Est_d, double*VarianceClusters);
extern void VE_Jk_EB_SW2_RegCo_Hajek_Clu(double*EstTheta, double*VecY_s, double*VecX_s, double*VecPk_s, int *n, int *nI, double*Doub_nI, int *VectCLb_s, int *VectCLb_sI, double*VectQIi_sI, double*VectQIiSTAR_sI, double*Est_d, double*VarianceClusters);
extern void VE_Jk_EB_SW2_RegCoI_Hajek_Clu(double*EstTheta, double*VecY_s, double*VecX_s, double*VecPk_s, int *n, int *nI, double*Doub_nI, int *VectCLb_s, int *VectCLb_sI, double*VectQIi_sI, double*VectQIiSTAR_sI, double*Est_d, double*VarianceClusters);
extern void VE_SYG_form(double*VecPseudo_s, double*VecPk_s, double*VecMatPkl_s, int *n, double*EstVarEst);
extern void VE_SYG_Total_NHT(double*VecY_s, double*VecPk_s, double*VecMatPkl_s, int *n, double*EstVarEst_ty);

static const R_CMethodDef CEntries[] = {
    {"Est_Corr_Hajek",                          (DL_FUNC) &Est_Corr_Hajek,                           5},
    {"Est_Corr_Hajek_Excluding_All_Elements",   (DL_FUNC) &Est_Corr_Hajek_Excluding_All_Elements,    5},
    {"Est_Corr_NHT",                            (DL_FUNC) &Est_Corr_NHT,                             6},
    {"Est_Corr_NHT_Excluding_All_Elements",     (DL_FUNC) &Est_Corr_NHT_Excluding_All_Elements,      6},
    {"Est_EmpDistFunc_Hajek",                   (DL_FUNC) &Est_EmpDistFunc_Hajek,                    5},
    {"Est_EmpDistFunc_NHT",                     (DL_FUNC) &Est_EmpDistFunc_NHT,                      6},
    {"Est_Mean_Hajek",                          (DL_FUNC) &Est_Mean_Hajek,                           4},
    {"Est_Ratio",                               (DL_FUNC) &Est_Ratio,                                5},
    {"Est_Ratio_Excluding_All_Elements",        (DL_FUNC) &Est_Ratio_Excluding_All_Elements,         5},
    {"Est_Ratio_Excluding_All_ElementsByRho",   (DL_FUNC) &Est_Ratio_Excluding_All_ElementsByRho,    6},
    {"Est_RegCo_Hajek",                         (DL_FUNC) &Est_RegCo_Hajek,                          5},
    {"Est_RegCo_Hajek_Excluding_All_Elements",  (DL_FUNC) &Est_RegCo_Hajek_Excluding_All_Elements,   5},
    {"Est_RegCoI_Hajek",                        (DL_FUNC) &Est_RegCoI_Hajek,                         5},
    {"Est_RegCoI_Hajek_Excluding_All_Elements", (DL_FUNC) &Est_RegCoI_Hajek_Excluding_All_Elements,  5},
    {"Est_Total_NHT",                           (DL_FUNC) &Est_Total_NHT,                            4},
    {"Pk_PropNorm_U",                           (DL_FUNC) &Pk_PropNorm_U,                            5},
    {"Pkl_Hajek_s",                             (DL_FUNC) &Pkl_Hajek_s,                              3},
    {"Pkl_Hajek_U",                             (DL_FUNC) &Pkl_Hajek_U,                              3},
    {"VE_Hajek_form",                           (DL_FUNC) &VE_Hajek_form,                            5},
    {"VE_Hajek_Total_NHT",                      (DL_FUNC) &VE_Hajek_Total_NHT,                       5},
    {"VE_HT_form",                              (DL_FUNC) &VE_HT_form,                               5},
    {"VE_HT_Total_NHT",                         (DL_FUNC) &VE_HT_Total_NHT,                          5},
    {"VE_Jk_EB_SW2_Corr_Hajek_Clu",             (DL_FUNC) &VE_Jk_EB_SW2_Corr_Hajek_Clu,             13},
    {"VE_Jk_EB_SW2_Ratio_Clu",                  (DL_FUNC) &VE_Jk_EB_SW2_Ratio_Clu,                  13},
    {"VE_Jk_EB_SW2_RegCo_Hajek_Clu",            (DL_FUNC) &VE_Jk_EB_SW2_RegCo_Hajek_Clu,            13},
    {"VE_Jk_EB_SW2_RegCoI_Hajek_Clu",           (DL_FUNC) &VE_Jk_EB_SW2_RegCoI_Hajek_Clu,           13},
    {"VE_SYG_form",                             (DL_FUNC) &VE_SYG_form,                              5},
    {"VE_SYG_Total_NHT",                        (DL_FUNC) &VE_SYG_Total_NHT,                         5},
    {NULL, NULL, 0}
};

void R_init_samplingVarEst(DllInfo *dll)
{
    R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
