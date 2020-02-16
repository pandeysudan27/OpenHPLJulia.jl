function penstock(Hn, Vdotn, H, theta; method="Bier",eta_nominal=0.9,pipe_roughness=0.05)
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

function headrace(Hn, Vdotn, H, theta; method="Bier",eta_nominal=0.9,pipe_roughness=0.05)
    return penstock(Hn, Vdotn, H, theta)
end
