function intake(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05)
    return basic_pipe(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05,unit="intake")
end
function penstock(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05)
    return basic_pipe(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05,unit="penstock")
end
function surgetank(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05)
    return basic_pipe(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05,unit="surgetank")
end
function pipe(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05)
    return basic_pipe(Hn, Vdotn; method="Bier",theta=45.,H=700.,eta_nominal=0.9,pipe_roughness=0.05,unit="pipe")
end
