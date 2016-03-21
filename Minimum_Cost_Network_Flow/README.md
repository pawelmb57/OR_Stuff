
## Minimum Cost Network Flow

Gurobi was used as the solver found [here](https://neos-server.org/neos/solvers/milp:Gurobi/AMPL.html)

Data given [here](http://elib.zib.de/pub/Packages/mp-testdata/mincost/netg/stndrd1.net)  
Data descriptions [here](http://elib.zib.de/pub/Packages/mp-testdata/mincost/netg/info)

This exercise shows a standard network flow problme utilizing AMPL's linear programming capabilities.  Each node in the problem can be defined as a warehouse or store that can either demand products or have surplus to deliver to other nodes.  The arcs are defined as the transportation routes and each have an associated cost.  The model optimizes the network to minimize the cost of transportation while meeting the required demands.



File Descriptions:
  * [networkCMD : AMPL command file](https://github.com/pawelmb57/operations_research_work/blob/master/Minimum_Cost_Network_Flow/networkCMD)
  * [networkDAT : Sample data used for model validation](https://github.com/pawelmb57/operations_research_work/blob/master/Minimum_Cost_Network_Flow/networkDAT)
  * [networkMOD : AMPL model file](https://github.com/pawelmb57/operations_research_work/blob/master/Minimum_Cost_Network_Flow/networkMOD)
  * [networkalldataDAT : AMPL data file using all available data](https://github.com/pawelmb57/operations_research_work/blob/master/Minimum_Cost_Network_Flow/networkalldataDAT)
  * [networkFlowSolution.pdf : PDF of AMPL output](https://github.com/pawelmb57/operations_research_work/blob/master/Minimum_Cost_Network_Flow/networkFlowSolution.pdf)
