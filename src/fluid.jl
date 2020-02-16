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
