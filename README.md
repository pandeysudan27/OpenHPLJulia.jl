# OpenHPLJulia

This package was meant for modeling, design and analysis of hydropower units.

An opensource hydropower library based on Modelica language exists as OpenHPL at https://github.com/simulatino/OpenHPL.

For advance analysis of model developed in OpenHPL, OMJulia or OMPython is used. OpenHPL can be run in OpenModelica and Dymola.

**OpenHPLJulia.jl** is created for designing hydropower units and for generating data for further analysis in OpenModelica or using OMPython or OMJulia. 

# Usage
```julia
julia> using Pkg
julia> add(PackageSpec(url=”https://github.com/pandeysudan27/OpenHPLJulia.jl”))
``` 
# Example
Let us design **penstock** based on nominal head and discharge.
```julia
julia> using OpenHPLJulia
julia> penstock(220,20)
OrderedCollections.OrderedDict{String,Any} with 17 entries:
  "a. Nominal head"                 => 220
  "b. Nominal dischare"             => 20
  "c. Nominal hydraulic efficiency" => 0.9
  "d. Nominal power output"         => 39600.0
  "e. Design based on"              => "Bier"
  "f. Economical diameter"          => 1.97911
  "g. Height"                       => 243.494
  "h. Length"                       => 378.81
  "i. Hydraulic crosssection"       => 3.0763
  "j. Angle of inclination"         => 40
  ⋮                                 => ⋮
``` 
This design is based on optimal diameter given by *Bier*.
