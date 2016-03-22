# MOD

# ### SET
# ############################################################

set A; 										# Antigens
set B; 										# Bundles
set M;										# Market Segments
set P;										# Vaccine Producers

set B1a within {B,A};						# Set of A provided by B
set B2p within {B,P};						# B / P

# ### PARAM
# ############################################################

param Rbm{B,M} >= 0;						# reservation price of B in M
param lam{M}   >= 0;						# avg number of children born in M
param Cbp{B,P} >= 0;						# capital recovery of B by P
param dam{A,M} >= 0;						# doses of A for full immunity in M
param Dbm{B,M} >= 0;						# max doses of B in M to avoid overimmunization
param Sbp{B,P} >= 0;						# max doses of B made by P
param dmdElas  >= 0;						# Scaling constant to model vaccine demand elasticty
param phi 	   >= 0;

var Xbmp{B,M,P} >= 0;						# Number of doses of B, by P, to M
var Ybmp{B,M,P} >= 0;						# price per B by P to M
var deltabp{B,P} binary >= 0;				# binary 1 when B is made by P


# ### OBJECTIVE FUNCTION
# ############################################################

maximize utility {b in B} : sum {p in P} 	(
											sum {(b,p) in B2p}
												(
													sum {m in M} 
													(
														(Rbm[b,m] - Ybmp[b,m,p]) * Xbmp[b,m,p]
													)
												)
											) 
;


# ### CONSTRAINTS
# ############################################################

# ### 3 Each market segment gets required number of doses of antigens 

subject to antigens_satisfied { m in M , a in A}: sum {p in P}
													(sum {(b,a) in B1a , (b,p) in B2p} 
														(
															Xbmp[b,m,p]
														)
													) = dam[a,m] * lam[m] 
; 	

# ### 4 Decision is <= Supply																				
subject to demand_lessThan_Supply {b in B , p in P}: sum {m in M} Xbmp[b,m,p] <= deltabp[b,p] * Sbp[b,p]
; 							

# ### 5 
subject to decision_profitable {b in B , p in P}: sum {m in M} Ybmp[b,m,p] * Xbmp[b,m,p] >= Cbp[b,p] * deltabp[b,p]
;

# ### 6 
subject to elastic_demand {b in B , m in M , p in P}: Xbmp[b,m,p] <= (Dbm[b,m] * lam[m] * (1-(Ybmp[b,m,p]/(dmdElas*Rbm[b,m]))**phi))
; 

# ### 8
subject to price_lessThan_Reservation {b in B , m in M , p in P}: 0 <= Ybmp[b,m,p] <= Rbm[b,m]
;			

#  ### 9 
subject to supply_nonneg {b in B , m in M , p in P}: Xbmp[b,m,p] >= 0 
;
