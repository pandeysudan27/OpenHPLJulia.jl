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
                "g. Cross-section"=>A,
                "h. Height"=>H,
                "i. Length"=>L,
                "j. Hydraulic crosssection"=>A,
                "k. Angle of inclination"=>theta,
                "l. Average velocity"=>v,
                "m. Nominal Reynolds number"=>NRe,
                "n. Darcy's friction factor"=>f,
                "o. Nominal allowed head loss"=>hL,
                "p. Hydraulic gradient"=>hGrad,
                "q. Pipe roughness"=>pipe_roughness,
                "r. Gradient angle"=>gradAngle)))
end

function headraceNsurgetank(Hn, Vdotn, H, theta, Hns; method="Bier",eta_nominal=0.9,pipe_roughness=0.05)
    g,rho,mu=parameters()
    headrace_dict = penstock(Hn, Vdotn, H, theta,method=method,eta_nominal=eta_nominal,pipe_roughness=pipe_roughness)
    # surge tank depends on headrace tunnel so
    n = 1.6 # safety factor for Thoma criteria
    # Acessing data of headrace tunnel from dictionary
    Dt,Lt,At,ft,vt = headrace_dict["f. Economical diameter","i. Length","g. Cross-section","n. Darcy's friction factor","l. Average velocity"]
    # calculating headrace tunnel friction factor
    beta = ft*Lt/(2*g*Dt)
    As = n*(Lt*At)/(2*g*beta*(Hn-beta*vt^2))
    Ds = sqrt(4*As/pi)
    Ymax = vt*sqrt((Lt*At)/(g*As))
    Hs = 1.2*(Hns+Ymax)
    vs = Vdotn/As
    sugretank_dict = sort((Dict("s. Diameter of surge tank"=>Ds,
                    "t. Cross-section of surge tank"=>As,
                    "u. Maximum height of water oscillation"=>Hns+Ymax,
                    "v. Height of surge tank"=>Hs,
                    "w. Allowed velocity of water inside surge tank"=>vs)))
    return sort(merge(headrace_dict,surgetank_dict))
end
