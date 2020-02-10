# for parameters
function parameters()
    g = 10.; rho = 1000.; mu = 1.3076e-3
    return [g rho mu]
end
# for nominal diameter
function nominal_diameter(method,P,Hn,Vdotn)
        if method == "Bier" # default
            D = 0.176*(P/Hn)^0.466
        elseif method == "Sarkaria"
            D = 0.71*P^0.43/Hn^0.65
        elseif method == "Warnick"
            D = 0.72*P^0.43/Hn^0.63
        elseif method == "Moffat"
            D = 0.52*P^0.43/Hn^0.6
        # methods not depending on efficiency
        elseif method == "USBR"
            D = 1.517*Vdotn^0.5/Hn^0.25
        elseif method == "Fahlbusch"
            D = 1.12*Vdotn^0.45/Hn^0.12
        end
    return D*1.5
end
# for darcys friction factor Sami and Jain
function f_Darcy(NRe, pipe_roughness,D)
    f = 1/(1.8*log10(6.9/NRe+(pipe_roughness/D/3.7)^1.1))^2
    return f
end
# for Reynolds number
function renoldsnum(rho,v,D,mu)
    return rho*v*D/mu
end
#
function basic_pipe(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05,unit="penstock")
    g,rho,mu=parameters()
    P = eta_nominal*rho*g*Vdotn*Hn/1000;
    D = nominal_diameter(method,P,Hn,Vdotn)
    A = pi*D^2/4
    v = Vdotn/A
    NRe = renoldsnum(rho,v,D,mu)
    f = f_Darcy(NRe, pipe_roughness,D)
    L = H/sind(theta)
    hL = f*L*v^2/(2*g*D)
    hGrad = hL/sqrt(L^2-H^2)
    gradAngle = atan(hGrad)
    return sort((Dict("a. Nominal head"=>Hn,
                "b. Nominal dischare"=>Vdotn,
                "c. Nominal hydraulic efficiency"=>eta_nominal,
                "d. Nominal power output"=>P,
                "e. Design based on"=>method,
                "f. Economical diameter"=>D,
                "g. Height"=>H,
                "h. Length"=>L,
                "i. Hydraulic crosssection"=>A,
                "j. Angle of inclination"=>theta,
                "k. Average velocity"=>v,
                "l. Nominal Reynolds number"=>NRe,
                "m. Darcy's friction factor"=>f,
                "n. Nominal allowed head loss"=>hL,
                "o. Hydraulic gradient"=>hGrad,
                "p. Pipe roughness"=>pipe_roughness,
                "q. Gradient angle"=>gradAngle)))
end
